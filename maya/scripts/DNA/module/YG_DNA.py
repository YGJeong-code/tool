import maya.OpenMaya as om
from maya import cmds

from os import environ, makedirs
from os import path as ospath

CHARACTER_NAME = "Ada"

# If you use Maya, use absolute path
# usd = cmds.internalVar(usd=True)
# mayascripts = '%s/%s' % (usd.rsplit('/', 3)[0], 'scripts/')
mayascripts = "Z:/VindictusGFX/Content/tool/maya/scripts/"

ROOT_DIR = mayascripts+"DNA/"
OUTPUT_DIR = f"{ROOT_DIR}/output"
ROOT_LIB_DIR = f"{ROOT_DIR}/lib"
DATA_DIR = f"{ROOT_DIR}/data"
DNA_DIR = f"{DATA_DIR}/dna_files"
CHARACTER_DNA = f"{DNA_DIR}/{CHARACTER_NAME}.dna"
ANALOG_GUI = f"{DATA_DIR}/analog_gui.ma"
GUI = f"{DATA_DIR}/mh4/gui.ma"
ADDITIONAL_ASSEMBLE_SCRIPT = f"{DATA_DIR}/mh4/additional_assemble_script.py"
ADD_MESH_NAME_TO_BLEND_SHAPE_CHANNEL_NAME = True

MODIFIED_CHARACTER_DNA = f"{OUTPUT_DIR}/{CHARACTER_NAME}_modified"

from sys import path as syspath
from sys import platform

# ROOT_DIR = f"{ospath.dirname(ospath.abspath(__file__))}/..".replace("\\", "/")
MAYA_VERSION = "2023"  # or 2023
ROOT_LIB_DIR = f"{ROOT_DIR}/lib/Maya{MAYA_VERSION}"
if platform == "win32":
    LIB_DIR = f"{ROOT_LIB_DIR}/windows"
elif platform == "linux":
    LIB_DIR = f"{ROOT_LIB_DIR}/linux"
else:
    raise OSError(
        "OS not supported, please compile dependencies and add value to LIB_DIR"
    )

# Adds directories to path
syspath.insert(0, ROOT_DIR)
syspath.insert(0, LIB_DIR)

# Add bin directory to maya plugin path
if "MAYA_PLUG_IN_PATH" in environ:
    separator = ":" if platform == "linux" else ";"
    environ["MAYA_PLUG_IN_PATH"] = separator.join([environ["MAYA_PLUG_IN_PATH"], LIB_DIR])
else:
    environ["MAYA_PLUG_IN_PATH"] = LIB_DIR

from dna import (
    BinaryStreamReader,
    BinaryStreamWriter,
    DataLayer_All,
    FileStream,
    Status,
)
from dnacalib import (
    CommandSequence,
    DNACalibDNAReader,
    SetNeutralJointRotationsCommand,
    SetNeutralJointTranslationsCommand,
    SetVertexPositionsCommand,
    VectorOperation_Add,
)

from dna_viewer import DNA, RigConfig, build_rig


def load_dna_reader(path):
    stream = FileStream(path, FileStream.AccessMode_Read, FileStream.OpenMode_Binary)
    reader = BinaryStreamReader(stream, DataLayer_All)
    reader.read()
    if not Status.isOk():
        status = Status.get()
        raise RuntimeError(f"Error loading DNA: {status.message}")
    return reader


def save_dna(reader):
    stream = FileStream(
        f"{MODIFIED_CHARACTER_DNA}.dna",
        FileStream.AccessMode_Write,
        FileStream.OpenMode_Binary,
    )
    writer = BinaryStreamWriter(stream)
    writer.setFrom(reader)
    writer.write()

    if not Status.isOk():
        status = Status.get()
        raise RuntimeError(f"Error saving DNA: {status.message}")


def get_mesh_vertex_positions_from_scene(meshName):
    try:
        sel = om.MSelectionList()
        sel.add(meshName)

        dag_path = om.MDagPath()
        sel.getDagPath(0, dag_path)

        mf_mesh = om.MFnMesh(dag_path)
        positions = om.MPointArray()

        mf_mesh.getPoints(positions, om.MSpace.kObject)
        return [
            [positions[i].x, positions[i].y, positions[i].z]
            for i in range(positions.length())
        ]
    except RuntimeError:
        print(f"{meshName} is missing, skipping it")
        return None


def run_joints_command(reader, calibrated):
    # Making arrays for joints' transformations and their corresponding mapping arrays
    joint_translations = []
    joint_rotations = []

    for i in range(reader.getJointCount()):
        joint_name = reader.getJointName(i)

        translation = cmds.xform(joint_name, query=True, translation=True)
        joint_translations.append(translation)

        rotation = cmds.joint(joint_name, query=True, orientation=True)
        joint_rotations.append(rotation)

    # This is step 5 sub-step a
    set_new_joints_translations = SetNeutralJointTranslationsCommand(joint_translations)
    # This is step 5 sub-step b
    set_new_joints_rotations = SetNeutralJointRotationsCommand(joint_rotations)

    # Abstraction to collect all commands into a sequence, and run them with only one invocation
    commands = CommandSequence()
    # Add vertex position deltas (NOT ABSOLUTE VALUES) onto existing vertex positions
    commands.add(set_new_joints_translations)
    commands.add(set_new_joints_rotations)

    commands.run(calibrated)
    # Verify that everything went fine
    if not Status.isOk():
        status = Status.get()
        raise RuntimeError(f"Error run_joints_command: {status.message}")


def run_vertices_command(
    calibrated, old_vertices_positions, new_vertices_positions, mesh_index
):
    # Making deltas between old vertices positions and new one
    deltas = []
    for new_vertex, old_vertex in zip(new_vertices_positions, old_vertices_positions):
        delta = []
        for new, old in zip(new_vertex, old_vertex):
            delta.append(new - old)
        deltas.append(delta)

    # This is step 5 sub-step c
    new_neutral_mesh = SetVertexPositionsCommand(
        mesh_index, deltas, VectorOperation_Add
    )
    commands = CommandSequence()
    # Add nex vertex position deltas (NOT ABSOLUTE VALUES) onto existing vertex positions
    commands.add(new_neutral_mesh)
    commands.run(calibrated)

    # Verify that everything went fine
    if not Status.isOk():
        status = Status.get()
        raise RuntimeError(f"Error run_vertices_command: {status.message}")


def assemble_maya_scene():
    dna = DNA(f"{MODIFIED_CHARACTER_DNA}.dna")
    config = RigConfig(
        # gui_path=f"{DATA_DIR}/gui.ma",
        gui_path = GUI,
        analog_gui_path=f"{DATA_DIR}/analog_gui.ma",
        aas_path=ADDITIONAL_ASSEMBLE_SCRIPT,
    )
    build_rig(dna=dna, config=config)

    cmds.file(rename=f"{MODIFIED_CHARACTER_DNA}.mb")
    cmds.file(save=True)

'''
modify rig
'''
current_vertices_positions = {}

def memory_current_DNA_vertex_position():
    makedirs(OUTPUT_DIR, exist_ok=True)

    dna = DNA(CHARACTER_DNA)
    config = RigConfig(
        # gui_path=f"{DATA_DIR}/gui.ma",
        gui_path = GUI,
        analog_gui_path=f"{DATA_DIR}/analog_gui.ma",
        aas_path=ADDITIONAL_ASSEMBLE_SCRIPT,
    )
    build_rig(dna=dna, config=config)

    # This is step 3 sub-step a
    # current_vertices_positions = {}
    mesh_indices = []
    for mesh_index, name in enumerate(dna.meshes.names):
        current_vertices_positions[name] = {
            "mesh_index": mesh_index,
            "positions": get_mesh_vertex_positions_from_scene(name),
        }

def save_modify_dna():
    reader = load_dna_reader(CHARACTER_DNA)
    calibrated = DNACalibDNAReader(reader)

    run_joints_command(reader, calibrated)

    for name, item in current_vertices_positions.items():
        new_vertices_positions = get_mesh_vertex_positions_from_scene(name)
        if new_vertices_positions:
            run_vertices_command(
                calibrated, item["positions"], new_vertices_positions, item["mesh_index"]
            )
    save_dna(calibrated)
    assemble_maya_scene()

'''
modify taransform
'''
# path
python_folder_path = f"{ROOT_DIR}/module"

def jointTransfer():
    # top joint
    myJnt = ''
    if cmds.ls('spine_04', type='joint'):
        myJnt = 'spine_04'
    if cmds.ls('DHIhead:spine_04', type='joint'):
        myJnt = 'DHIhead:spine_04'

    # all joint
    myAllJnt = cmds.listRelatives(myJnt, c=True, ad=True, type='joint')

    # DNA
    DNA = cmds.ls('rl4Embedded*')[0]

    '''
    disconnect DNA
    '''
    myChannel = ['tx','ty','tz','rx','ry','rz','sx','sy','sz']
    for jnt in myAllJnt:
        for channel in myChannel:
            connections = cmds.listConnections(jnt + "." + channel, source=True, plugs=True)
            if connections:
                input_node = cmds.ls(connections[0], long=True)[0]

                if DNA in input_node:
                    #print("Input node for {}.{}: {}".format(jnt, channel, input_node))
                    cmds.disconnectAttr (input_node, jnt+'.'+channel)
            else:
                # print("No input node found for {}.{}".format(jnt, channel))
                pass

    '''
    loop joint
    '''
    # head mesh
    ogmesh = cmds.ls('head_lod0_mesh')[0]
    newmesh = cmds.ls('head_lod0_mesh1')[0]

    #selecting the bone//edit the bone name here
    bone_List = myAllJnt
    cmds.select( clear=True )

    #Starting bone loop
    for boneID in range(len(bone_List)):
        bone = bone_List[boneID]
        if 'TeethUpper' in bone or 'TeethLower' in bone:
            pass
        else:
            # print('---------- bone transfer (', boneID, '/', len(bone_List), ') : ', bone, '----------')

            exec(open(python_folder_path+"/OG_Mesh.py").read())
            exec(open(python_folder_path+"/Get_Bone_Data.py").read())
            exec(open(python_folder_path+"/New_Mesh.py").read())
            exec(open(python_folder_path+"/Vertex_Offset.py").read())
            exec(open(python_folder_path+"/Set_Bone_Data.py").read())

    for bone in cmds.ls('*Pupil'):
        cmds.setAttr(bone+'.sx', 0)
        cmds.setAttr(bone+'.sy', 0)
        cmds.setAttr(bone+'.sz', 0)

    # done
    print('bone transfer Done!!')

    myBlend = cmds.blendShape(newmesh, ogmesh)
    cmds.setAttr(myBlend[0]+'.'+newmesh, 1)

def disconnectRL4():
    # top joint
    myJnt = ''
    if cmds.ls('spine_04', type='joint'):
        myJnt = 'spine_04'
    if cmds.ls('DHIhead:spine_04', type='joint'):
        myJnt = 'DHIhead:spine_04'

    # all joint
    myAllJnt = cmds.listRelatives(myJnt, c=True, ad=True, type='joint')

    # DNA
    DNA = cmds.ls('rl4Embedded*')[0]

    # disconnect
    myChannel = ['tx','ty','tz','rx','ry','rz','sx','sy','sz']
    for jnt in myAllJnt:
        for channel in myChannel:
            connections = cmds.listConnections(jnt + "." + channel, source=True, plugs=True)
            if connections:
                input_node = cmds.ls(connections[0], long=True)[0]

                if DNA in input_node:
                    #print("Input node for {}.{}: {}".format(jnt, channel, input_node))
                    cmds.disconnectAttr (input_node, jnt+'.'+channel)
            else:
                # print("No input node found for {}.{}".format(jnt, channel))
                pass

def select_loop_bones():
    # top joint
    myJnt = ''
    if cmds.ls('spine_04', type='joint'):
        myJnt = 'spine_04'
    if cmds.ls('DHIhead:spine_04', type='joint'):
        myJnt = 'DHIhead:spine_04'

    # all joint
    myAllJnt = cmds.listRelatives(myJnt, c=True, ad=True, type='joint')

    # head mesh
    ogmesh = cmds.ls('head_lod0_mesh')[0]
    newmesh = cmds.ls('head_lod0_mesh1')[0]

    #selecting the bone//edit the bone name here
    bone_List = myAllJnt
    cmds.select( clear=True )

    #Starting bone loop
    for boneID in range(len(bone_List)):
        bone = bone_List[boneID]
        # if 'TeethUpper' in bone or 'TeethLower' in bone:
        #     pass
        # else:
            # print('---------- bone transfer (', boneID, '/', len(bone_List), ') : ', bone, '----------')

        exec(open(python_folder_path+"/OG_Mesh.py").read())
        exec(open(python_folder_path+"/Get_Bone_Data.py").read())
        exec(open(python_folder_path+"/New_Mesh.py").read())
        exec(open(python_folder_path+"/Vertex_Offset.py").read())
        exec(open(python_folder_path+"/Set_Bone_Data.py").read())

    for bone in cmds.ls('*Pupil'):
        cmds.setAttr(bone+'.sx', 0)
        cmds.setAttr(bone+'.sy', 0)
        cmds.setAttr(bone+'.sz', 0)

    # done
    print('bone transfer Done!!')

    myBlend = cmds.blendShape(newmesh, ogmesh)
    cmds.setAttr(myBlend[0]+'.'+newmesh, 1)
