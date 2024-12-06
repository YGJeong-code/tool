"""
Work
YG_bodySetup
since 2023.08.16
last updated 2024.01.12
by YeonGyun,Jeong
lupinxyz@gmail.com
"""

from maya import cmds

# function

def rot(obj, axis, value):
    rv = cmds.getAttr(obj+'.r'+axis)
    cmds.setAttr(obj+'.r'+axis, value)

def neckTrans():
    cmds.spaceLocator()
    cmds.rename('_loc')
    myLoc = '_loc'
    myConst = cmds.parentConstraint('Bip001_Neck', 'Bip001_Head', myLoc)
    cmds.delete(myConst)

    cmds.group(em=True)
    cmds.rename('_nul')
    myNul = '_nul'
    cmds.matchTransform(myNul, myLoc)

    cmds.parent(myLoc, myNul)

    rot(myLoc, 'x', 180)

    cmds.matchTransform('neck_02_drv', myLoc)

    cmds.delete(myNul)

def metacarpalTrans(mh, bip, value):
    cmds.spaceLocator()
    cmds.rename(bip+'_loc')
    myLoc = bip+'_loc'
    cmds.matchTransform(myLoc, bip)

    cmds.group(em=True)
    cmds.rename(bip+'_nul')
    myNul = bip+'_nul'
    cmds.matchTransform(myNul, bip)

    cmds.parent(myLoc, myNul)

    cmds.setAttr(myLoc+'.tx', value)

    cmds.matchTransform(mh, myLoc)

    cmds.delete(myNul)

def metacarpalTransRotate(mh, bip, value, axis, axisValue):
    cmds.spaceLocator()
    cmds.rename(bip+'_loc')
    myLoc = bip+'_loc'
    cmds.matchTransform(myLoc, bip)

    cmds.group(em=True)
    cmds.rename(bip+'_nul')
    myNul = bip+'_nul'
    cmds.matchTransform(myNul, bip)

    cmds.parent(myLoc, myNul)

    cmds.setAttr(myLoc+'.tx', value)

    rot(myLoc, axis, axisValue)

    cmds.matchTransform(mh, myLoc)

    cmds.delete(myNul)

def jointMatchRotate(mh, bip, axis, value):
    cmds.spaceLocator()
    cmds.rename(bip+'_loc')
    myLoc = bip+'_loc'
    cmds.matchTransform(myLoc, bip)

    cmds.group(em=True)
    cmds.rename(bip+'_nul')
    myNul = bip+'_nul'
    cmds.matchTransform(myNul, bip)

    cmds.parent(myLoc, myNul)

    rot(myLoc, axis, value)

    cmds.matchTransform(mh, myLoc)

    cmds.delete(myNul)

def renameObj(*, myA='', myB='', myC='', myD='', mySide='', prefix='', subfix='', search='', replace=''):
    # 선택한 객체 수 가져오기
    selected_objects = cmds.ls(selection=True)
    # object_count = len(selected_objects)

    # name
    # myA = 'fiona', 'tail'
    # myB = 'hair'
    # myC = 'A'
    # myD = 'R1'
    # mySide = 'l', 'r', 'c'

    # 이름 포맷 만들기
    for i, obj in enumerate(selected_objects):
        # 2자리 패딩된 연속적인 숫자 생성
        padded_number = f"{i+1:02d}"

        # 새로운 이름 생성
        new_name = ''
        if myA:
            new_name = f"{myA}_{padded_number}"
            if myB:
                new_name = f"{myA}_{myB}_{padded_number}"
                if myC:
                    new_name = f"{myA}_{myB}_{myC}_{padded_number}"
                    if myD:
                        new_name = f"{myA}_{myB}_{myC}_{myD}_{padded_number}"
        if len(selected_objects) == 1:
            new_name = f"{myA}_root"
        if mySide:
            new_name = f"{new_name}_{mySide}"
        if prefix:
            new_name = f"{prefix}_{obj}"
        if subfix:
            new_name = f"{obj}_{subfix}"
        if search:
            new_name = obj.replace(search, replace)

        # 객체 이름 변경
        if new_name:
            cmds.rename(obj, new_name)

myJntParentDict = {}

def deleteZeroWeightJoint():
    mySource = cmds.ls(sl=True, l=True)[0]
    mySourceShape = cmds.listRelatives (mySource, s=True, f=True)[0]

    temp = cmds.listHistory(mySourceShape, lv=True)
    for i in temp:
        if 'skinCluster' in i:
            cmds.skinCluster(i, e=True, rui=True)
            print(i)

# exec

myFaceJointList = ['spine_04', 'spine_05',
              'clavicle_pec_l', 'clavicle_pec_r',
              'spine_04_latissimus_l', 'spine_04_latissimus_r',
              'clavicle_l', 'clavicle_out_l',
              'clavicle_scap_l', 'upperarm_l',
              'upperarm_correctiveRoot_l',
              'upperarm_out_l','upperarm_fwd_l',
              'upperarm_in_l','upperarm_bck_l',
              'clavicle_r', 'clavicle_out_r',
              'clavicle_scap_r', 'upperarm_r',
              'upperarm_correctiveRoot_r',
              'upperarm_out_r','upperarm_fwd_r',
              'upperarm_in_r','upperarm_bck_r',
              'neck_01', 'neck_02','head']

myDrvList = ['root_drv', 'pelvis_drv','spine_01_drv', 'spine_02_drv', 'spine_03_drv', 'spine_04_drv', 'spine_05_drv', 'neck_01_drv', 'neck_02_drv', 'head_drv',
    'clavicle_l_drv', 'upperarm_l_drv', 'lowerarm_l_drv','hand_l_drv',
    'thumb_01_l_drv', 'thumb_02_l_drv', 'thumb_03_l_drv',
    'index_metacarpal_l_drv', 'index_01_l_drv', 'index_02_l_drv', 'index_03_l_drv',
    'middle_metacarpal_l_drv', 'middle_01_l_drv', 'middle_02_l_drv', 'middle_03_l_drv',
    'ring_metacarpal_l_drv', 'ring_01_l_drv', 'ring_02_l_drv', 'ring_03_l_drv',
    'pinky_metacarpal_l_drv', 'pinky_01_l_drv', 'pinky_02_l_drv', 'pinky_03_l_drv',
    'clavicle_r_drv', 'upperarm_r_drv', 'lowerarm_r_drv','hand_r_drv',
    'thumb_01_r_drv', 'thumb_02_r_drv', 'thumb_03_r_drv',
    'index_metacarpal_r_drv', 'index_01_r_drv', 'index_02_r_drv', 'index_03_r_drv',
    'middle_metacarpal_r_drv', 'middle_01_r_drv', 'middle_02_r_drv', 'middle_03_r_drv',
    'ring_metacarpal_r_drv', 'ring_01_r_drv', 'ring_02_r_drv', 'ring_03_r_drv',
    'pinky_metacarpal_r_drv', 'pinky_01_r_drv', 'pinky_02_r_drv', 'pinky_03_r_drv',
    'thigh_l_drv', 'calf_l_drv', 'foot_l_drv', 'ball_l_drv',
    'thigh_r_drv', 'calf_r_drv', 'foot_r_drv', 'ball_r_drv']

def matchJointBody2Bip():
    '''
    spine
    '''
    jointMatchRotate('pelvis_drv', 'Bip001_Pelvis', 'x', 180)
    jointMatchRotate('spine_02_drv', 'Bip001_Spine', 'x', 180)
    jointMatchRotate('spine_03_drv', 'Bip001_Spine1', 'x', 180)
    jointMatchRotate('spine_04_drv', 'Bip001_Spine2', 'x', 180)
    jointMatchRotate('spine_05_drv', 'Bip001_Spine3', 'x', 180)
    jointMatchRotate('neck_01_drv', 'Bip001_Neck', 'x', 180)
    neckTrans()
    # jointMatchRotate('head_drv', 'Bip001_Head', 'x', 180)
    cmds.delete(cmds.pointConstraint('Bip001_Head', 'head_drv'))


    '''
    left arm
    '''
    cmds.matchTransform('clavicle_l_drv', 'Bip001_L_Clavicle')
    cmds.matchTransform('upperarm_l_drv', 'Bip001_L_UpperArm')
    cmds.matchTransform('lowerarm_l_drv', 'Bip001_L_Forearm')
    cmds.matchTransform('hand_l_drv', 'Bip001_L_Hand')

    '''
    right arm
    '''
    jointMatchRotate('clavicle_r_drv', 'Bip001_R_Clavicle', 'z', 180)
    jointMatchRotate('upperarm_r_drv', 'Bip001_R_UpperArm', 'z', 180)
    jointMatchRotate('lowerarm_r_drv', 'Bip001_R_Forearm', 'z', 180)
    jointMatchRotate('hand_r_drv', 'Bip001_R_Hand', 'z', 180)


    '''
    right leg
    '''
    cmds.matchTransform('thigh_r_drv', 'Bip001_R_Thigh')
    cmds.matchTransform('calf_r_drv', 'Bip001_R_Calf')
    cmds.matchTransform('foot_r_drv', 'Bip001_R_Foot')
    jointMatchRotate('ball_r_drv', 'Bip001_R_Toe0', 'z', 180)

    '''
    left leg
    '''
    jointMatchRotate('thigh_l_drv', 'Bip001_L_Thigh', 'z', 180)
    jointMatchRotate('calf_l_drv', 'Bip001_L_Calf', 'z', 180)
    jointMatchRotate('foot_l_drv', 'Bip001_L_Foot', 'z', 180)
    cmds.matchTransform('ball_l_drv', 'Bip001_L_Toe0')

    '''
    left finger
    '''
    cmds.matchTransform('thumb_01_l_drv', 'Bip001_L_Finger0')
    cmds.matchTransform('thumb_02_l_drv', 'Bip001_L_Finger01')
    cmds.matchTransform('thumb_02_half_l_drv', 'Bip001_L_Finger01')
    cmds.matchTransform('thumb_03_l_drv', 'Bip001_L_Finger02')
    cmds.matchTransform('thumb_03_half_l_drv', 'Bip001_L_Finger02')

    metacarpalTrans('index_metacarpal_l_drv', 'Bip001_L_Finger1', -4)
    cmds.matchTransform('index_01_l_drv', 'Bip001_L_Finger1')
    cmds.matchTransform('index_01_half_l_drv', 'Bip001_L_Finger1')
    cmds.matchTransform('index_02_l_drv', 'Bip001_L_Finger11')
    cmds.matchTransform('index_02_half_l_drv', 'Bip001_L_Finger11')
    cmds.matchTransform('index_03_l_drv', 'Bip001_L_Finger12')
    cmds.matchTransform('index_03_half_l_drv', 'Bip001_L_Finger12')

    metacarpalTrans('middle_metacarpal_l_drv', 'Bip001_L_Finger2', -4)
    cmds.matchTransform('middle_01_l_drv', 'Bip001_L_Finger2')
    cmds.matchTransform('middle_01_half_l_drv', 'Bip001_L_Finger2')
    cmds.matchTransform('middle_02_l_drv', 'Bip001_L_Finger21')
    cmds.matchTransform('middle_02_half_l_drv', 'Bip001_L_Finger21')
    cmds.matchTransform('middle_03_l_drv', 'Bip001_L_Finger22')
    cmds.matchTransform('middle_03_half_l_drv', 'Bip001_L_Finger22')

    metacarpalTrans('ring_metacarpal_l_drv', 'Bip001_L_Finger3', -3)
    cmds.matchTransform('ring_01_l_drv', 'Bip001_L_Finger3')
    cmds.matchTransform('ring_01_half_l_drv', 'Bip001_L_Finger3')
    cmds.matchTransform('ring_02_l_drv', 'Bip001_L_Finger31')
    cmds.matchTransform('ring_02_half_l_drv', 'Bip001_L_Finger31')
    cmds.matchTransform('ring_03_l_drv', 'Bip001_L_Finger32')
    cmds.matchTransform('ring_03_half_l_drv', 'Bip001_L_Finger32')

    metacarpalTrans('pinky_metacarpal_l_drv', 'Bip001_L_Finger4', -3)
    cmds.matchTransform('pinky_01_l_drv', 'Bip001_L_Finger4')
    cmds.matchTransform('pinky_01_half_l_drv', 'Bip001_L_Finger4')
    cmds.matchTransform('pinky_02_l_drv', 'Bip001_L_Finger41')
    cmds.matchTransform('pinky_02_half_l_drv', 'Bip001_L_Finger41')
    cmds.matchTransform('pinky_03_l_drv', 'Bip001_L_Finger42')
    cmds.matchTransform('pinky_03_half_l_drv', 'Bip001_L_Finger42')

    '''
    right finger
    '''
    jointMatchRotate('thumb_01_r_drv', 'Bip001_R_Finger0', 'z', 180)
    jointMatchRotate('thumb_02_r_drv', 'Bip001_R_Finger01', 'z', 180)
    jointMatchRotate('thumb_02_half_r_drv', 'Bip001_R_Finger01', 'z', 180)
    jointMatchRotate('thumb_03_r_drv', 'Bip001_R_Finger02', 'z', 180)
    jointMatchRotate('thumb_03_half_r_drv', 'Bip001_R_Finger02', 'z', 180)

    metacarpalTransRotate('index_metacarpal_r_drv','Bip001_R_Finger1', -4, 'z', 180)
    jointMatchRotate('index_01_r_drv', 'Bip001_R_Finger1', 'z', 180)
    jointMatchRotate('index_01_half_r_drv', 'Bip001_R_Finger1', 'z', 180)
    jointMatchRotate('index_02_r_drv', 'Bip001_R_Finger11', 'z', 180)
    jointMatchRotate('index_02_half_r_drv', 'Bip001_R_Finger11', 'z', 180)
    jointMatchRotate('index_03_r_drv', 'Bip001_R_Finger12', 'z', 180)
    jointMatchRotate('index_03_half_r_drv', 'Bip001_R_Finger12', 'z', 180)

    metacarpalTransRotate('middle_metacarpal_r_drv','Bip001_R_Finger2', -4, 'z', 180)
    jointMatchRotate('middle_01_r_drv', 'Bip001_R_Finger2', 'z', 180)
    jointMatchRotate('middle_01_half_r_drv', 'Bip001_R_Finger2', 'z', 180)
    jointMatchRotate('middle_02_r_drv', 'Bip001_R_Finger21', 'z', 180)
    jointMatchRotate('middle_02_half_r_drv', 'Bip001_R_Finger21', 'z', 180)
    jointMatchRotate('middle_03_r_drv', 'Bip001_R_Finger22', 'z', 180)
    jointMatchRotate('middle_03_half_r_drv', 'Bip001_R_Finger22', 'z', 180)

    metacarpalTransRotate('ring_metacarpal_r_drv','Bip001_R_Finger3', -3, 'z', 180)
    jointMatchRotate('ring_01_r_drv', 'Bip001_R_Finger3', 'z', 180)
    jointMatchRotate('ring_01_half_r_drv', 'Bip001_R_Finger3', 'z', 180)
    jointMatchRotate('ring_02_r_drv', 'Bip001_R_Finger31', 'z', 180)
    jointMatchRotate('ring_02_half_r_drv', 'Bip001_R_Finger31', 'z', 180)
    jointMatchRotate('ring_03_r_drv', 'Bip001_R_Finger32', 'z', 180)
    jointMatchRotate('ring_03_half_r_drv', 'Bip001_R_Finger32', 'z', 180)

    metacarpalTransRotate('pinky_metacarpal_r_drv','Bip001_R_Finger4', -3, 'z', 180)
    jointMatchRotate('pinky_01_r_drv', 'Bip001_R_Finger4', 'z', 180)
    jointMatchRotate('pinky_01_half_r_drv', 'Bip001_R_Finger4', 'z', 180)
    jointMatchRotate('pinky_02_r_drv', 'Bip001_R_Finger41', 'z', 180)
    jointMatchRotate('pinky_02_half_r_drv', 'Bip001_R_Finger41', 'z', 180)
    jointMatchRotate('pinky_03_r_drv', 'Bip001_R_Finger42', 'z', 180)
    jointMatchRotate('pinky_03_half_r_drv', 'Bip001_R_Finger42', 'z', 180)

def drvJointZero():
    myList = ['root_drv', 'pelvis_drv','spine_01_drv', 'spine_02_drv', 'spine_03_drv', 'spine_04_drv', 'spine_05_drv', 'neck_01_drv', 'neck_02_drv', 'head_drv',
              'clavicle_l_drv', 'upperarm_l_drv', 'lowerarm_l_drv','hand_l_drv',
              'thumb_01_l_drv', 'thumb_02_l_drv', 'thumb_03_l_drv',
              'index_metacarpal_l_drv', 'index_01_l_drv', 'index_02_l_drv', 'index_03_l_drv',
              'middle_metacarpal_l_drv', 'middle_01_l_drv', 'middle_02_l_drv', 'middle_03_l_drv',
              'ring_metacarpal_l_drv', 'ring_01_l_drv', 'ring_02_l_drv', 'ring_03_l_drv',
              'pinky_metacarpal_l_drv', 'pinky_01_l_drv', 'pinky_02_l_drv', 'pinky_03_l_drv',
              'clavicle_r_drv', 'upperarm_r_drv', 'lowerarm_r_drv','hand_r_drv',
              'thumb_01_r_drv', 'thumb_02_r_drv', 'thumb_03_r_drv',
              'index_metacarpal_r_drv', 'index_01_r_drv', 'index_02_r_drv', 'index_03_r_drv',
              'middle_metacarpal_r_drv', 'middle_01_r_drv', 'middle_02_r_drv', 'middle_03_r_drv',
              'ring_metacarpal_r_drv', 'ring_01_r_drv', 'ring_02_r_drv', 'ring_03_r_drv',
              'pinky_metacarpal_r_drv', 'pinky_01_r_drv', 'pinky_02_r_drv', 'pinky_03_r_drv',
              'thigh_l_drv', 'calf_l_drv', 'foot_l_drv', 'ball_l_drv',
              'thigh_r_drv', 'calf_r_drv', 'foot_r_drv', 'ball_r_drv']

    myParentDict = {}

    # save parent dic
    # for i in myList:
    myDrvList = cmds.listRelatives('root_drv', c=True, ad=True, type='joint')
    myDrvList.append('root_drv')

    for i in myDrvList:
        myParent = cmds.listRelatives(i, p=True)[0]

        myParentDict[i] = myParent

    # print(myParentDict)

    # parent to world
    for i in myDrvList:
        cmds.parent(i, world=True)


    # freeze rotate
    for i in myList:
        print(i)
        cmds.select(i, r=True)
        cmds.makeIdentity (apply=True, r=True, pn=True)

    # reparent
    for i in myDrvList:
        cmds.parent(i, myParentDict[i])

    # cmds.delete(cmds.ls('transform*'))

def exportAllJointSet(myExportName):
    # all joint list
    myRoot = cmds.ls('root', type='joint')
    myChild = cmds.listRelatives(myRoot, c=True, ad=True, type='joint')

    # create sets
    cmds.select(myRoot, myChild, add=True)
    myExportSet = cmds.sets(n=f"export_set_{myExportName}")
    cmds.select(cl=True)

def skinJointSet():
    mySel = cmds.ls(sl=True)

    for mySource in mySel:
        # mySource = cmds.ls(sl=True, l=True)[0]
        mySourceShape = cmds.listRelatives (mySource, s=True, f=True)[0]

        temp = cmds.listHistory(mySourceShape, lv=True)
        mySkinJNT = []
        for i in temp:
            if 'skinCluster' in i:
                mySkinJNT = cmds.skinCluster(i,query=True,inf=True)

        # select skin joint
        cmds.select(mySkinJNT, r=True)

        # create sets
        myExportSet = cmds.sets(n=f"skin_set_{mySource}")
        cmds.select(cl=True)

def exportJointSet(myExportName):
    mySel = cmds.ls(sl=True)
    myExportSel = []

    for mySource in mySel:
        # append select geo
        myExportSel.append(mySource)

        mySourceShape = cmds.listRelatives (mySource, s=True, f=True)[0]

        temp = cmds.listHistory(mySourceShape, lv=True)
        mySkinJNT = []
        for i in temp:
            if 'skinCluster' in i:
                mySkinJNT = cmds.skinCluster(i,query=True,inf=True)

        # select skin joint
        cmds.select(mySkinJNT, r=True)
        for j in mySkinJNT:
            myExportSel.append(j)

        # select parent joint
        mySel = cmds.ls(sl=True)
        for i in mySel:
            myList = cmds.listRelatives(ap=True, ad=True)
            cmds.select(myList, add=True)

        mySel = cmds.ls(sl=True)
        for i in mySel:
            myExportSel.append(i)

    # create sets
    cmds.select(myExportSel, r=True)
    myExportSet = cmds.sets(n=f"export_set_{myExportName}")
    cmds.select(cl=True)

def makeLocator():
    mySel = cmds.ls(sl=True)
    for i in mySel:
        cmds.spaceLocator()
        cmds.rename(i+'_loc')
        myLoc = i+'_loc'
        cmds.matchTransform(myLoc, i)

def constDrv2FaceJnt():
    for i in myFaceJointList:
        myDriver = 'body:' + i.split('|')[-1] + '_drv'
        cmds.parentConstraint(myDriver, i, mo=True)

def matchJointFace2Body():
    ns = 'body:'
    for i in range(len(myFaceJointList)):
        # make locator on mh_body
        cmds.select(ns + myFaceJointList[i], r=True)
        makeLocator()

        # get transform
        myLoc = ns + myFaceJointList[i] + '_loc'
        tx = cmds.getAttr(myLoc + '.tx')
        ty = cmds.getAttr(myLoc + '.ty')
        tz = cmds.getAttr(myLoc + '.tz')

        # select face mesh & move skin joint
        cmds.select('head_lod0_grp', r=True)
        cmds.MoveSkinJointsTool()

        # match joint
        cmds.move(tx, ty, tz, myFaceJointList[i], preserveChildPosition=True, rotatePivotRelative=True)

        # delete loc
        # cmds.delete(myLoc)

def headMeshCut(obj):
    myFace = ['.f[692:696]', '.f[1273:1276]', '.f[1278:1279]', '.f[1303:1310]', '.f[1314]', '.f[1318:1323]', '.f[1330:1342]', '.f[1430]', '.f[1440]', '.f[1447:1448]', '.f[1508:1512]', '.f[1517]', '.f[1533:1544]', '.f[2482:2485]', '.f[3493:3495]', '.f[3498]', '.f[3512:3513]', '.f[3546]', '.f[3551]', '.f[4618]', '.f[4688:4690]', '.f[4696:4704]', '.f[4735]', '.f[4737:4741]', '.f[4780:4781]', '.f[4801:4803]', '.f[4809:4811]', '.f[4829]', '.f[4855]', '.f[4858]', '.f[5126:5128]', '.f[5130:5134]', '.f[5136:5139]', '.f[5141:5143]', '.f[5162:5173]', '.f[12040:12197]', '.f[13788]', '.f[14148]', '.f[14202:14204]', '.f[14210:14218]', '.f[14236]', '.f[14238:14242]', '.f[14250:14251]', '.f[14271:14273]', '.f[14279:14281]', '.f[14289]', '.f[14315]', '.f[14318]', '.f[14362:14437]', '.f[14469]', '.f[14488:20787]', '.f[20804:20808]', '.f[21385:21388]', '.f[21390:21391]', '.f[21415:21422]', '.f[21426]', '.f[21430:21435]', '.f[21442:21454]', '.f[21542]', '.f[21552]', '.f[21559:21560]', '.f[21620:21624]', '.f[21629]', '.f[21645:21656]', '.f[22594:22597]', '.f[23605:23607]', '.f[23610]', '.f[23624:23625]', '.f[23658]', '.f[23663]', '.f[23938:23940]', '.f[23942:23946]', '.f[23948:23951]', '.f[23953:23955]', '.f[23958:24051]', '.f[24314:24319]']
    for i in myFace:
        cmds.select(obj + i, add=True)

def deletePasted():
    mySel = cmds.ls(sl=True)
    for i in mySel:
        myName = i.replace('pasted__', '')
        cmds.rename(myName)

def makeRootJoint():
    myJnt = cmds.joint(n='root')
    cmds.setAttr(myJnt+'.rx', -90)

def importBody(gender, state):
    if gender == 'male':
        body = 'Z:/VindictusGFX/Content/tool/maya/scripts/Work/data/body/m_tal_nrw_body_rig.ma'
    else:
        body = 'Z:/VindictusGFX/Content/tool/maya/scripts/Work/data/body/f_tal_nrw_body_rig.ma'

    if state == 'import':
        cmds.file(body, i=True)
    else:
        cmds.file(body, r=True, namespace=gender)

# def skinTransfer():
#     mySource = cmds.ls(sl=True, l=True)[0]
#     mySourceShape = cmds.listRelatives (mySource, s=True, f=True)[0]

#     temp = cmds.listHistory(mySourceShape, lv=True)
#     mySkinJNT = []
#     for i in temp:
#         if 'skinCluster' in i:
#             mySkinJNT = cmds.skinCluster(i,query=True,inf=True)

#     myTarget = cmds.ls(sl=True, l=True)[1]

#     cmds.select (myTarget, mySkinJNT, r=True)
#     cmds.optionVar(iv=[('multipleBindPosesOpt',1),('bindMethod',1),('bindTo',2),
#                 ('skinMethod',1),('removeUnusedInfluences',0),('colorizeSkeleton',0),
#                 ('maxInfl',3),('normalizeWeights',2),('obeyMaxInfl',0)])
#     cmds.SmoothBindSkin()

#     cmds.select (mySource, myTarget, r=True)
#     cmds.copySkinWeights  (noMirror=True, surfaceAssociation='closestPoint', influenceAssociation='oneToOne')

def skinTransfer():
    # 스킨값 원본들
    mySource = cmds.ls(sl=True, l=True)[0:-1]

    # 스킨값 복제 타겟
    myTarget = cmds.ls(sl=True, l=True)[-1]

    # 원본에서 스킨노드 찾기
    mySourceShapeList = []
    for i in mySource:
        mySourceShape = cmds.listRelatives (i, s=True, f=True)[0]
        mySourceShapeList.append(mySourceShape)

    mySkinJointList = []
    for mySourceShape in mySourceShapeList:
        temp = cmds.listHistory(mySourceShape, lv=True)
        for i in temp:
            if 'skinCluster' in i:
                mySkinJoint = cmds.skinCluster(i,query=True,inf=True)

                for j in mySkinJoint:
                    # 유니크 스킨 조인트 리스트 만들기
                    if j not in mySkinJointList:
                        mySkinJointList.append(j)

    # 스킨값 복제
    cmds.select (myTarget, mySkinJointList, r=True)
    cmds.optionVar(iv=[('multipleBindPosesOpt',1),('bindMethod',1),('bindTo',2),
                ('skinMethod',1),('removeUnusedInfluences',0),('colorizeSkeleton',0),
                ('maxInfl',3),('normalizeWeights',2),('obeyMaxInfl',0)])
    cmds.SmoothBindSkin()

    cmds.select (mySource, myTarget, r=True)
    cmds.copySkinWeights  (noMirror=True, surfaceAssociation='closestPoint', influenceAssociation='oneToOne')

def headAddJoint():
    myList = ['spine_04','spine_04_latissimus_l','spine_04_latissimus_r',
              'clavicle_l','clavicle_pec_l','clavicle_out_l','clavicle_scap_l',
              'clavicle_r','clavicle_pec_r','clavicle_out_r','clavicle_scap_r',
              'upperarm_out_l','upperarm_fwd_l','upperarm_in_l','upperarm_bck_l',
              'upperarm_out_r','upperarm_fwd_r','upperarm_in_r','upperarm_bck_r']
    cmds.select(myList, add=True)

def bodyPose(pose):
    print(pose)

    loc = 'loc'

    for i in myDrvList:
        if pose == 'mh':
            loc = i + '_mh_loc'
            cmds.matchTransform(i, loc)
        elif pose == 'a':
            loc = i + '_a_loc'
            cmds.matchTransform(i, loc)
        elif pose == 't':
            loc = i + '_t_loc'
            cmds.matchTransform(i, loc)

def makePoseLoc(pose):
    print(pose)

    temp = 'loc'
    myTopGrp = 'loc_grp'
    myGrp = ''

    if len(cmds.ls(myTopGrp)) == 0:
        myTopGrp = cmds.group(em=True, n=myTopGrp)

    if pose == 'mh':
        myGrp = cmds.group(em=True, n='mh_loc')
    elif pose == 'a':
        myGrp = cmds.group(em=True, n='a_loc')
    elif pose == 't':
        myGrp = cmds.group(em=True, n='t_loc')

    cmds.parent(myGrp, myTopGrp)

    for i in myDrvList:
        if pose == 'mh':
            temp = i + '_mh_loc'
            loc = cmds.spaceLocator(n=temp)
            cmds.matchTransform(loc, i)

            cmds.parent(loc, myGrp)

        elif pose == 'a':
            temp = i + '_a_loc'
            loc = cmds.spaceLocator(n=temp)
            cmds.matchTransform(loc, i)

            cmds.parent(loc, myGrp)

        elif pose == 't':
            temp = i + '_t_loc'
            loc = cmds.spaceLocator(n=temp)
            cmds.matchTransform(loc, i)

            cmds.parent(loc, myGrp)

def selectDrv():
    cmds.select(myDrvList)

def setUpAxis(axis):
        cmds.upAxis( ax=axis, rv=True )

        if axis == 'Y':
            if bool(cmds.ls('root_drv')):
                cmds.setAttr('root_drv.rx', -90)
                cmds.setAttr('headRig_grp.rx', -90)
                cmds.setAttr('Lights.rx', -90)
        elif axis == 'Z':
            if bool(cmds.ls('root_drv')):
                cmds.setAttr('root_drv.rx', 0)
                cmds.setAttr('headRig_grp.rx', 0)
                cmds.setAttr('Lights.rx', 0)

def selectMetaHead():
    myList = ['.f[3218:3221]','.f[4594:4633]','.f[5158:5164]','.f[5362:5373]','.f[5667:5779]',
              '.f[9175:9206]','.f[15219:15222]','.f[16595:16634]','.f[17159:17165]','.f[17363:17374]',
              '.f[17668:17780]','.f[21176:21207]','.f[5512:5547]','.f[6780:6783]','.f[9207:9214]',
              '.f[9783:9790]','.f[9839:9842]','.f[9859:9870]','.f[9911:9922]','.f[10067:10106]',
              '.f[10251:10252]','.f[10255:10256]','.f[10259:10260]','.f[10263:10264]','.f[10268:10269]',
              '.f[10271:10272]','.f[10275:10276]','.f[10279:10280]','.f[10285:10288]','.f[10291:10292]',
              '.f[10297:10300]','.f[10304:10305]','.f[10307:10308]','.f[10313:10314]','.f[17513:17548]',
              '.f[18781:18784]','.f[21208:21215]','.f[21784:21791]','.f[21840:21843]','.f[21860:21871]',
              '.f[21912:21923]','.f[22068:22107]','.f[22252]','.f[22255:22256]','.f[22259:22260]',
              '.f[22263:22264]','.f[22267]','.f[22270:22272]','.f[22275:22276]','.f[22279:22280]',
              '.f[22283]','.f[22285:22286]','.f[22288]','.f[22291:22292]','.f[22295]',
              '.f[22297:22298]','.f[22300]','.f[22303]','.f[22306:22308]','.f[22311]',
              '.f[22313:22314]','.f[112:172]','.f[325:332]','.f[345:348]','.f[381:400]',
              '.f[417:424]','.f[661:860]','.f[929:936]','.f[949:952]','.f[957:968]',
              '.f[981:988]','.f[1189:1252]','.f[1317:1404]','.f[1413:1881]','.f[12113:12173]',
              '.f[12326:12333]','.f[12346:12349]','.f[12382:12401]','.f[12418:12425]','.f[12662:12861]',
              '.f[12930:12937]','.f[12950:12953]','.f[12958:12969]','.f[12982:12989]','.f[13190:13253]',
              '.f[13318:13405]','.f[13414:13882]']

    cmds.select(cl=True)
    for i in myList:
        cmds.select('*combined_lod0_mesh'+i, add=True)

def selectMetaFaceCon():
    myList = ['CTRL_R_brow_raiseOut','CTRL_R_brow_raiseIn','CTRL_L_brow_raiseIn','CTRL_L_brow_raiseOut',
              'CTRL_R_eye_blink','CTRL_C_eye','CTRL_L_eye_blink','CTRL_C_jaw','CTRL_C_tongue_inOut',
              'CTRL_C_tongue_press','CTRL_C_tongue_bendTwist','CTRL_C_tongue_roll','CTRL_R_mouth_cornerPull','CTRL_L_mouth_cornerPull',
              'CTRL_L_brow_down', 'CTRL_R_brow_down']

    cmds.select(myList, r=True)

def get_midpoint():
    point1 = cmds.ls(sl=True)[0]
    point2 = cmds.ls(sl=True)[1]

    # 두 점의 좌표 가져오기
    pos1 = cmds.xform(point1, query=True, translation=True, worldSpace=True)
    pos2 = cmds.xform(point2, query=True, translation=True, worldSpace=True)

    # 중간점 계산
    mid_x = (pos1[0] + pos2[0]) / 2
    mid_y = (pos1[1] + pos2[1]) / 2
    mid_z = (pos1[2] + pos2[2]) / 2

    myLoc = cmds.spaceLocator(name='midpoint_locator')[0]
    cmds.setAttr(myLoc+'.tx', mid_x)
    cmds.setAttr(myLoc+'.ty', mid_y)
    cmds.setAttr(myLoc+'.tz', mid_z)

def makeJointToSel():
    mySel = cmds.ls(sl=True)

    cmds.select(cl=True)
    for i in mySel:
        myJnt = cmds.joint()

        cmds.matchTransform(myJnt, i)

        cmds.setAttr (myJnt+".sx", 1)
        cmds.setAttr (myJnt+".sy", 1)
        cmds.setAttr (myJnt+".sz", 1)

        cmds.select(cl=True)

def skirtToPT(myPose, mySide, myJointNum):
    myList = ['A', 'B', 'C', 'D', 'E', 'F', 'G']

    if myPose == 'fwd':
        myList = ['A', 'B', 'C', 'D'] #fwd
    elif myPose == 'bck':
        myList = ['D', 'E', 'F', 'G'] #bck
    elif myPose == 'out':
        myList = ['B', 'C', 'D', 'E', 'F'] #out

    myOffsetSide = 'r'
    if mySide == 'r':
        myOffsetSide = 'l'

    for i in myList:
        myLoc = 'pt_skirt_' + i + '_' + myJointNum + '_' + mySide
        myJnt = 'skirt_' + i + '_' + myJointNum + '_' + mySide

        cmds.delete( cmds.pointConstraint(myLoc, myJnt) )

    if myPose == 'fwd' or myPose == 'bck':
        for i in myList:
            myLoc = 'pt_skirt_' + i + '_' + myJointNum + '_' + myOffsetSide
            myOffsetJnt = 'offset_skirt_' + i + '_' + myJointNum + '_' + myOffsetSide

            cmds.delete( cmds.pointConstraint(myLoc, myOffsetJnt) )

def makeGrp(myPC, myName):
    myRootGrp = cmds.group(em=True, n=myPC + '_' + myName + '_grp')

    myFaceGrp = cmds.group(em=True, n=myPC + '_Face_' + myName + '_grp', p=myRootGrp)
    myFaceQuadGrp = cmds.group(em=True, n=myPC + '_Face_' + myName + '_quad_grp', p=myFaceGrp)
    myFaceQuadOriGrp = cmds.group(em=True, n=myPC + '_Face_' + myName + '_quad_ori_grp', p=myFaceQuadGrp)
    myFaceQuadLod0Grp = cmds.group(em=True, n=myPC + '_Face_' + myName + '_quad_lod0_grp', p=myFaceQuadGrp)
    myFaceQuadLod1Grp = cmds.group(em=True, n=myPC + '_Face_' + myName + '_quad_lod1_grp', p=myFaceQuadGrp)

    myFaceTriGrp = cmds.group(em=True, n=myPC + '_Face_' + myName + '_tri_grp', p=myFaceGrp)
    myFaceTriOriGrp = cmds.group(em=True, n=myPC + '_Face_' + myName + '_tri_ori_grp', p=myFaceTriGrp)
    myFaceTriLod0Grp = cmds.group(em=True, n=myPC + '_Face_' + myName + '_tri_lod0_grp', p=myFaceTriGrp)
    myFaceTriLod1Grp = cmds.group(em=True, n=myPC + '_Face_' + myName + '_tri_lod1_grp', p=myFaceTriGrp)

    myOutfitGrp = cmds.group(em=True, n=myPC + '_Outfit_' + myName + '_grp', p=myRootGrp)
    myOutfitQuadGrp = cmds.group(em=True, n=myPC + '_Outfit_' + myName + '_quad_grp', p=myOutfitGrp)
    myOutfitTriGrp = cmds.group(em=True, n=myPC + '_Outfit_' + myName + '_tri_grp', p=myOutfitGrp)
