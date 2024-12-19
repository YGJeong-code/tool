import maya.cmds as cmds
import maya.mel as mel

gShelfTopLevel = mel.eval("$tmpVar=$gShelfTopLevel")
myTap = cmds.tabLayout(gShelfTopLevel, query=True, selectTab=True)
myCommand = '''import sys
myPath = "Z:/VindictusGFX/Content/tool/maya/scripts/metapipe/"
if myPath not in sys.path:
    sys.path.append(myPath)

import MetaPipeStudio
MetaPipeStudio.show_dna_edit_window()'''

mayascripts = "Z:/VindictusGFX/Content/tool/maya/scripts/"
myTool = "metapipe"
tempPath = mayascripts+myTool+"/icon/"
cmds.shelfButton(command=myCommand,
                 annotation=myTool,
                 label=myTool,
                 image=tempPath+myTool+'.bmp',
                 parent=myTap)
