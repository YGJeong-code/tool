from PySide2 import QtCore, QtWidgets, QtGui
from maya import cmds
from maya.app.general.mayaMixin import MayaQWidgetDockableMixin

from imp import reload

import DNA.module.YG_DNA as YG_DNA
reload(YG_DNA)

import DNA.module.YG_DNA_LOD as YG_DNA_LOD
reload(YG_DNA_LOD)

import DNA.module.YG_DNA_Neck as YG_DNA_Neck
reload(YG_DNA_Neck)

import Work.module.YG_bodySetup as setup
reload(setup)

import dna_viewer

def get_maya_win():
    for obj in QtWidgets.QApplication.topLevelWidgets():
        if obj.objectName() == "MayaWindow":
            return obj
    raise RuntimeError("Could not find MayaWindow instance")

# class MyDockableWindow(MayaQWidgetDockableMixin, QtWidgets.QDialog):
class MyDockableWindow(QtWidgets.QDialog):
    TOOL_NAME = 'YG_DNA_v1.2'
    selected_filter = "DNA (*.dna)"

    def __init__(self, parent=get_maya_win()):
        super(self.__class__, self).__init__(parent=parent)
        self.setObjectName(self.__class__.TOOL_NAME)

        self.setWindowFlags(QtCore.Qt.Window)
        self.setWindowTitle(self.TOOL_NAME)
        self.resize(400, 200)

        self.create_top_layout()
        self.create_1st_layout()
        self.create_2nd_layout()
        self.create_3rd_layout()
        self.create_4th_layout()
        self.create_connections()


    def create_top_layout(self):
        self.main_layout = QtWidgets.QVBoxLayout(self)

        # top
        self.btn_layout_top = QtWidgets.QHBoxLayout()
        self.rbtnY = QtWidgets.QRadioButton('Y', self)
        self.rbtnY.setChecked(True)
        self.rbtnZ = QtWidgets.QRadioButton('Z', self)

        self.btn_layout_top.addWidget(QtWidgets.QLabel("Up Axis"))
        self.btn_layout_top.addWidget(self.rbtnY)
        self.btn_layout_top.addWidget(self.rbtnZ)
        # btn_layout_top.addWidget(QtWidgets.QLabel("DNA Calibration"))

        self.DNAViewer = QtWidgets.QPushButton('DNA Viewer')
        self.btn_layout_top.addWidget(self.DNAViewer)

        self.main_layout.addLayout(self.btn_layout_top)

        self.separatorLine = QtWidgets.QFrame()
        self.separatorLine.setFrameShape( QtWidgets.QFrame.HLine )
        self.separatorLine.setFrameShadow( QtWidgets.QFrame.Raised )

        self.main_layout.addWidget(self.separatorLine)

    def create_1st_layout(self):
        # 1st
        self.file_path_layout = QtWidgets.QHBoxLayout()

        self.filepath_le = QtWidgets.QLineEdit()
        self.select_file_path_btn = QtWidgets.QPushButton("...")
        self.select_file_path_btn.setIcon(QtGui.QIcon(":fileOpen.png"))

        self.file_path_layout.addWidget(self.filepath_le)
        self.file_path_layout.addWidget(self.select_file_path_btn)

        self.form_layout_1 = QtWidgets.QFormLayout()
        self.form_layout_1.addRow("DNA :", self.file_path_layout)

        self.main_layout.addWidget(QtWidgets.QLabel("1st"))
        self.main_layout.addLayout(self.form_layout_1)

    def create_2nd_layout(self):    
        # 2nd
        self.btn_layout_2 = QtWidgets.QVBoxLayout()
        self.btn_layout_2.addWidget(QtWidgets.QLabel("2nd"))

        self.currentDNA = QtWidgets.QPushButton('Memory Current DNA Veterx Position')

        self.btn_layout_2.addWidget(self.currentDNA)

        self.main_layout.addLayout(self.btn_layout_2)

    def create_3rd_layout(self):
        # 3rd
        self.check = QtWidgets.QCheckBox()
        self.modifyTransform = QtWidgets.QPushButton('Modify Joint and Vertex Transform')
        self.modifyTransform.setEnabled(False)
        
        self.layout_3rd = QtWidgets.QHBoxLayout()
        self.layout_3rd.addWidget(QtWidgets.QLabel("modify rig in maya..."))
        self.layout_3rd.addWidget(self.check)
        self.layout_3rd.addWidget(self.modifyTransform)

        self.matchFaceJnt_btn = QtWidgets.QPushButton('MH_Face to MH_Body')
        self.constFaceJnt_btn = QtWidgets.QPushButton('Constraints Face to Body')

        self.btn_layout_3 = QtWidgets.QVBoxLayout()
        self.btn_layout_3.addWidget(self.matchFaceJnt_btn)
        self.btn_layout_3.addWidget(self.constFaceJnt_btn)

        self.main_layout.addWidget(QtWidgets.QLabel("3rd"))
        self.main_layout.addLayout(self.layout_3rd)
        self.main_layout.addLayout(self.btn_layout_3)

    def create_4th_layout(self):
        # 4th
        self.modify_file_path_layout = QtWidgets.QHBoxLayout()

        self.modify_filepath_le = QtWidgets.QLineEdit()
        self.select_modify_file_path_btn = QtWidgets.QPushButton("...")
        self.select_modify_file_path_btn.setIcon(QtGui.QIcon(":fileOpen.png"))

        self.modify_file_path_layout.addWidget(self.modify_filepath_le)
        self.modify_file_path_layout.addWidget(self.select_modify_file_path_btn)

        self.form_layout_4 = QtWidgets.QFormLayout()
        self.form_layout_4.addRow("Modify DNA :", self.modify_file_path_layout)

        self.btn_layout_4 = QtWidgets.QVBoxLayout()
        self.saveDNA = QtWidgets.QPushButton('Save Modify DNA')
        self.makeLOD = QtWidgets.QPushButton('Make LOD')
        self.deleteNeckJoint = QtWidgets.QPushButton('Delete Neck Joint')

        self.btn_layout_4.addWidget(self.saveDNA)
        self.btn_layout_4.addWidget(self.makeLOD)
        self.btn_layout_4.addWidget(self.deleteNeckJoint)

        self.main_layout.addWidget(QtWidgets.QLabel("4th"))
        self.main_layout.addLayout(self.form_layout_4)
        self.main_layout.addLayout(self.btn_layout_4)

        self.main_layout.addStretch()

    def create_connections(self):
        # TOP
        self.rbtnY.toggled.connect(self.on_button_pressed)
        self.rbtnZ.toggled.connect(self.on_button_pressed)
        self.DNAViewer.clicked.connect(self.on_button_pressed)

        # 1st
        self.select_file_path_btn.clicked.connect(self.show_file_select_dialog)
        
        # 2nd
        self.currentDNA.clicked.connect(self.on_button_pressed)

        # 3rd
        self.check.toggled.connect(self.on_button_pressed)
        self.modifyTransform.clicked.connect(self.on_button_pressed)
        self.matchFaceJnt_btn.clicked.connect(self.on_button_pressed)
        self.constFaceJnt_btn.clicked.connect(self.on_button_pressed)

        # 4th
        self.select_modify_file_path_btn.clicked.connect(self.show_modify_file_select_dialog)
        self.saveDNA.clicked.connect(self.on_button_pressed)
        self.makeLOD.clicked.connect(self.on_button_pressed)
        self.deleteNeckJoint.clicked.connect(self.on_button_pressed)


    def show_file_select_dialog(self):
        file_name, self.selected_filter = QtWidgets.QFileDialog.getOpenFileName(self, "Select DNA File", YG_DNA.DNA_DIR, self.selected_filter)
        if file_name:
            self.filepath_le.setText(file_name)
            YG_DNA.CHARACTER_NAME = file_name.rsplit('/', 1)[-1][:-4]
            YG_DNA.MODIFIED_CHARACTER_DNA = f"{YG_DNA.OUTPUT_DIR}/{YG_DNA.CHARACTER_NAME}_modified"
            YG_DNA.CHARACTER_DNA = f"{YG_DNA.DNA_DIR}/{YG_DNA.CHARACTER_NAME}.dna"
            YG_DNA.DNA_NEW = f"{YG_DNA.OUTPUT_DIR}/{YG_DNA.CHARACTER_NAME}_lod"

    def show_modify_file_select_dialog(self):
        file_name, self.selected_filter = QtWidgets.QFileDialog.getOpenFileName(self, "Modify DNA File", YG_DNA.OUTPUT_DIR, self.selected_filter)
        if file_name:
            self.modify_filepath_le.setText(file_name)
            temp = file_name.rsplit('/', 1)[-1][:-4]
            YG_DNA_LOD.CHARACTER = temp.rsplit('_')[0]
            YG_DNA_LOD.DNA = f"{YG_DNA_LOD.OUTPUT_DIR}/{YG_DNA_LOD.CHARACTER}_calib_modified.dna"
            YG_DNA_LOD.DNA_NEW = f"{YG_DNA_LOD.OUTPUT_DIR}/{YG_DNA_LOD.CHARACTER}_lod.dna"

            YG_DNA_Neck.CHARACTER_DNA = YG_DNA_LOD.DNA_NEW
            YG_DNA_Neck.OUTPUT_DNA = f"{YG_DNA_LOD.OUTPUT_DIR}/{YG_DNA_LOD.CHARACTER}_deleteNeck.dna"

    def on_button_pressed(self):
        sender = self.sender()
        print ('{0} : pressed'.format(sender.text()))

        # top
        if sender.text() == 'DNA Viewer':
            print ('viewer')

            dna_viewer.show()
        
        elif sender.text() == 'Y':
            if self.rbtnY.isChecked():
                print ('Y')
                setup.setUpAxis("Y")
            elif self.rbtnZ.isChecked():
                print ('Z')
                setup.setUpAxis("Z")
        
        # 2nd
        elif sender.text() == 'Memory Current DNA Veterx Position':
            print (YG_DNA.CHARACTER_NAME)
            file_name = YG_DNA.MODIFIED_CHARACTER_DNA
            self.modify_filepath_le.setText(file_name)
            YG_DNA.memory_current_DNA_vertex_position()
        
        #3rd
        elif sender.text() == '':
            if self.check.checkState() == QtCore.Qt.CheckState.Checked:
                print (self.check.checkState())
                self.modifyTransform.setEnabled(True)
            else:
                print (self.check.checkState())
                self.modifyTransform.setEnabled(False)

        elif sender.text() == 'Modify Joint and Vertex Transform':
            YG_DNA.jointTransfer()

        elif sender.text() == 'MH_Face to MH_Body':
            print ("MH_Face to MH_Body...")
            setup.matchJointFace2Body()

        elif sender.text() == 'Constraints Face to Body':
            print ("Constraints Face to Body...")
            setup.constDrv2FaceJnt()

        # 4th
        elif sender.text() == 'Save Modify DNA':
            print (YG_DNA.MODIFIED_CHARACTER_DNA)
            print('save modify DNA...')
            YG_DNA.save_modify_dna()
        
        elif sender.text() == 'Make LOD':
            print('make LOD...')
            YG_DNA_LOD.makeLOD()
        
        elif sender.text() == 'Delete Neck Joint':
            print('delete neck joint...')
            YG_DNA_Neck.deleteNeckJoint()
            

try:
    my_win.deleteLater()
except:
    pass

my_win = MyDockableWindow()
# my_win.show(dockable=True)
my_win.show()

#clear history
cmds.scriptEditorInfo (ch=True)
