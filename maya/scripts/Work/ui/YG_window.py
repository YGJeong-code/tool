"""
Work
YG_window
since 2023.08.16
last updated 2024.01.12
by YeonGyun,Jeong
lupinxyz@gmail.com
"""

from PySide2 import QtCore, QtWidgets, QtGui
from maya import cmds

import Work.module.YG_bodySetup as setup
from imp import reload
reload(setup)

def get_maya_win():
    for obj in QtWidgets.QApplication.topLevelWidgets():
        if obj.objectName() == "MayaWindow":
            return obj
    raise RuntimeError("Could not find MayaWindow instance")

class MyWindow(QtWidgets.QDialog):
    TOOL_NAME = 'YG_Tools'
    selected_filter = "*.*"

    def __init__(self, parent=get_maya_win()):
        super(self.__class__, self).__init__(parent=parent)
        self.setObjectName(self.__class__.TOOL_NAME)

        self.setWindowFlags(QtCore.Qt.Window)
        self.setWindowTitle(self.TOOL_NAME)
        self.resize(400, 100)

        self.create_body_layout()
        self.create_matchJoint_layout()
        self.create_skin_layout()
        self.create_set_layout()
        self.create_main_layout()

        self.create_connections()
        self.toggle_Select_Body()

    '''
    layout
    '''
    def create_body_layout(self):
        # button
        self.bodyMale_btn = QtWidgets.QRadioButton('Male', checked=True)
        self.bodyFemale_btn = QtWidgets.QRadioButton('Female')
        self.selectBody_btn = QtWidgets.QRadioButton('Select Body')

        self.filepath_le = QtWidgets.QLineEdit()
        self.select_file_path_btn = QtWidgets.QPushButton("...")
        self.select_file_path_btn.setIcon(QtGui.QIcon(":fileOpen.png"))

        self.bodyImport_btn = QtWidgets.QPushButton('Import')
        self.bodyReference_btn = QtWidgets.QPushButton('Reference')        

        # group
        self.body_group = QtWidgets.QGroupBox(title='MH_Body')

        # vertical layout
        self.body_layout = QtWidgets.QVBoxLayout(self)

        # radio layout
        self.bodyRadio_layout = QtWidgets.QHBoxLayout()
        self.bodyRadio_layout.addWidget(self.bodyMale_btn)
        self.bodyRadio_layout.addWidget(self.bodyFemale_btn)
        self.bodyRadio_layout.addWidget(self.selectBody_btn)

        # horizontal layout
        self.file_path_layout = QtWidgets.QHBoxLayout()
        self.file_path_layout.addWidget(self.filepath_le)
        self.file_path_layout.addWidget(self.select_file_path_btn)

        self.form_layout_1 = QtWidgets.QFormLayout()
        self.form_layout_1.addRow(self.file_path_layout)

        # button layout
        self.bodyButton_layout = QtWidgets.QHBoxLayout()
        self.bodyButton_layout.addWidget(self.bodyImport_btn)
        self.bodyButton_layout.addWidget(self.bodyReference_btn)

        # body layout
        self.body_layout.addLayout(self.bodyRadio_layout)
        self.body_layout.addLayout(self.form_layout_1)
        self.body_layout.addLayout(self.bodyButton_layout)

        # group set
        self.body_group.setLayout(self.body_layout)

    def create_matchJoint_layout(self):
        # button
        self.matchBodyJnt_btn = QtWidgets.QPushButton('MH_Body to Bip')
        self.matchFaceJnt_btn = QtWidgets.QPushButton('MH_Face to MH_Body')
        self.constFaceJnt_btn = QtWidgets.QPushButton('Constraints Face to Body')
        # self.drvJointZero_btn = QtWidgets.QPushButton('Drv Joint to Zero')

        # group
        self.match_group = QtWidgets.QGroupBox(title='Match Joint')        

        # vertical layout
        self.matchJoint_layout = QtWidgets.QVBoxLayout()
        self.matchJoint_layout.addWidget(self.matchBodyJnt_btn)
        self.matchJoint_layout.addWidget(self.matchFaceJnt_btn)
        self.matchJoint_layout.addWidget(self.constFaceJnt_btn)
        # self.matchJoint_layout.addWidget(self.drvJointZero_btn)

        # group set
        self.match_group.setLayout(self.matchJoint_layout)

    def create_skin_layout(self):
        # button
        self.skinTransfer_btn = QtWidgets.QPushButton('Skin Transfer A to B')
        self.addHeadJoint_btn = QtWidgets.QPushButton('Add Select Head Missing Skin Joint')

        # group
        self.skin_group = QtWidgets.QGroupBox(title='Skin')

        # vertical layout
        self.skin_layout = QtWidgets.QVBoxLayout()
        self.skin_layout.addWidget(self.skinTransfer_btn)
        self.skin_layout.addWidget(self.addHeadJoint_btn)

        # group set
        self.skin_group.setLayout(self.skin_layout)
    
    def create_set_layout(self):
        # button
        self.skinSet_btn = QtWidgets.QPushButton('Set - Skin')
        self.exportSet_btn = QtWidgets.QPushButton('Set - Export')

        # radio button
        self.rbtn_face = QtWidgets.QRadioButton('Face', self)
        self.rbtn_face.setChecked(True)

        self.rbtn_foot = QtWidgets.QRadioButton(self)
        self.rbtn_foot.setText('Foot')

        self.rbtn_hand = QtWidgets.QRadioButton(self)
        self.rbtn_hand.setText('Hand')

        self.rbtn_head = QtWidgets.QRadioButton(self)
        self.rbtn_head.setText('Head')

        self.rbtn_lower = QtWidgets.QRadioButton(self)
        self.rbtn_lower.setText('Lower')

        self.rbtn_upper = QtWidgets.QRadioButton(self)
        self.rbtn_upper.setText('Upper')

        self.rbtn_onepiece = QtWidgets.QRadioButton(self)
        self.rbtn_onepiece.setText('Onepiece')

        # group
        self.set_group = QtWidgets.QGroupBox(title='Set')

        # horizontal layout
        self.set_layout_h = QtWidgets.QHBoxLayout()
        self.set_layout_h.addWidget(self.rbtn_face)
        self.set_layout_h.addWidget(self.rbtn_foot)
        self.set_layout_h.addWidget(self.rbtn_hand)
        self.set_layout_h.addWidget(self.rbtn_head)
        self.set_layout_h.addWidget(self.rbtn_lower)
        self.set_layout_h.addWidget(self.rbtn_upper)
        self.set_layout_h.addWidget(self.rbtn_onepiece)

        # vertical layout
        self.set_layout = QtWidgets.QVBoxLayout()
        self.set_layout.addWidget(self.skinSet_btn)
        self.set_layout.addLayout(self.set_layout_h)
        self.set_layout.addWidget(self.exportSet_btn)

        # group set
        self.set_group.setLayout(self.set_layout)

    def create_main_layout(self):
        self.main_layout = QtWidgets.QVBoxLayout(self)
        self.main_layout.addWidget(self.body_group)
        self.main_layout.addWidget(self.match_group)
        self.main_layout.addWidget(self.skin_group)
        self.main_layout.addWidget(self.set_group)
        self.main_layout.addStretch()
    
    '''
    connections
    '''
    def create_connections(self):
        # body 
        self.bodyMale_btn.clicked.connect(self.toggle_Select_Body)
        self.bodyFemale_btn.clicked.connect(self.toggle_Select_Body)
        self.selectBody_btn.clicked.connect(self.toggle_Select_Body)

        self.bodyImport_btn.clicked.connect(self.on_button_pressed)
        self.bodyReference_btn.clicked.connect(self.on_button_pressed)

        # MH_Body
        self.select_file_path_btn.clicked.connect(self.show_file_select_dialog)

        # match joint
        self.matchBodyJnt_btn.clicked.connect(self.on_button_pressed)
        self.matchFaceJnt_btn.clicked.connect(self.on_button_pressed)
        self.constFaceJnt_btn.clicked.connect(self.on_button_pressed)
        # self.drvJointZero_btn.clicked.connect(self.on_button_pressed)

        # skin
        self.skinTransfer_btn.clicked.connect(self.on_button_pressed)
        self.addHeadJoint_btn.clicked.connect(self.on_button_pressed)

        # set
        self.skinSet_btn.clicked.connect(self.on_button_pressed)        
        self.exportSet_btn.clicked.connect(self.on_button_pressed)        
    
    '''
    function
    '''
    def show_file_select_dialog(self):
        myFile = cmds.file(q=True, location=True)
        myDir = '%s' % (myFile.rsplit('/',1)[0])
        file_name, self.selected_filter = QtWidgets.QFileDialog.getOpenFileName(self, "Select MH_Body File", myDir, self.selected_filter)
        if file_name:
            self.filepath_le.setText(file_name)


    def on_button_pressed(self):
        sender = self.sender()
        print ('{0} : pressed'.format(sender.text()))

        if sender.text() == 'MH_Body to Bip':
            setup.matchJointBody2Bip()

        elif sender.text() == 'MH_Face to MH_Body':
            setup.matchJointFace2Body()

        elif sender.text() == 'Import':
            if self.bodyMale_btn.isChecked():
                setup.importBody('male', 'import')
            elif self.bodyFemale_btn.isChecked():
                setup.importBody('female', 'import')
            elif self.selectBody_btn.isChecked():
                cmds.file(self.filepath_le.text(), i=True)

        elif sender.text() == 'Reference':
            if self.bodyMale_btn.isChecked():
                setup.importBody('male', 'reference')
            elif self.bodyFemale_btn.isChecked():
                setup.importBody('female', 'reference')
            elif self.selectBody_btn.isChecked():
                cmds.file(self.filepath_le.text(), r=True, namespace='body')
        
        elif sender.text() == 'Skin Transfer A to B':
            setup.skinTransfer()
        
        elif sender.text() == 'Constraints Face to Body':
            setup.constDrv2FaceJnt()

        elif sender.text() == 'Drv Joint to Zero':
            setup.drvJointZero()

        elif sender.text() == 'Add Select Head Missing Skin Joint':
            setup.headAddJoint()
        
        elif sender.text() == 'Set - Skin':
            setup.skinJointSet()
        
        elif sender.text() == 'Set - Export':
            myExportName = ''

            if self.rbtn_face.isChecked() :
                myExportName = 'Face'
                setup.exportJointSet(myExportName)
            elif self.rbtn_foot.isChecked() :
                myExportName = 'Foot'
                setup.exportJointSet(myExportName)
            elif self.rbtn_hand.isChecked() :
                myExportName = 'Hand'
                setup.exportJointSet(myExportName)
            elif self.rbtn_head.isChecked() :
                myExportName = 'Head'
                setup.exportJointSet(myExportName)
            elif self.rbtn_lower.isChecked() :
                myExportName = 'Lower'
                setup.exportJointSet(myExportName)            

            elif self.rbtn_upper.isChecked() :
                myExportName = 'Upper'
                setup.exportAllJointSet(myExportName)
            elif self.rbtn_onepiece.isChecked() :
                myExportName = 'Onepiece'
                setup.exportAllJointSet(myExportName)            
        
    
    def toggle_Select_Body(self):
        if self.selectBody_btn.isChecked():
            self.filepath_le.setEnabled(True)
            self.select_file_path_btn.setEnabled(True)
        else:
            self.filepath_le.setDisabled(True)
            self.select_file_path_btn.setDisabled(True)


try:
    my_win.deleteLater()
except:
    pass

my_win = MyWindow()
