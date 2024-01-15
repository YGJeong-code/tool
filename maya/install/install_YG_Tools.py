import maya.cmds as cmds
import maya.mel as mel

gShelfTopLevel = mel.eval("$tmpVar=$gShelfTopLevel")
myTap = cmds.tabLayout(gShelfTopLevel, query=True, selectTab=True)
myCommand = '''import sys
myPath = "Z:/VindictusGFX/Content/tool/maya/scripts/"
if myPath not in sys.path:
    sys.path.append(myPath)

import Work.ui.YG_window as yg_win
from imp import reload
reload(yg_win)
yg_win.my_win.show()'''
usd = cmds.internalVar(usd=True)
# mayascripts = '%s/%s' % (usd.rsplit('/', 3)[0], 'scripts/')
mayascripts = "Z:/VindictusGFX/Content/tool/maya/scripts/"
tempPath = mayascripts+"Work/icon/"
myTool = 'YG_Tools'
cmds.shelfButton(command=myCommand,
                 annotation=myTool,
                 label=myTool,
                 image=tempPath+myTool,
                 parent=myTap)
