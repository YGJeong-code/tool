import maya.cmds as cmds
import maya.mel as mel

gShelfTopLevel = mel.eval("$tmpVar=$gShelfTopLevel")
myTap = cmds.tabLayout(gShelfTopLevel, query=True, selectTab=True)
myCommand = '''import sys
myPath = "Z:/VindictusGFX/Content/tool/maya/scripts/"
if myPath not in sys.path:
    sys.path.append(myPath)

import DNA.ui.dna_window as DNA
from imp import reload
reload(DNA)
DNA.my_win.show()'''
# usd = cmds.internalVar(usd=True)
# mayascripts = '%s/%s' % (usd.rsplit('/', 3)[0], 'scripts/')
mayascripts = "Z:/VindictusGFX/Content/tool/maya/scripts/"
tempPath = mayascripts+"DNA/icon/"
cmds.shelfButton(command=myCommand,
                 annotation="YG_DNA",
                 label='YG_DNA',
                 image=tempPath+'YG_DNA.bmp',
                 parent=myTap)
