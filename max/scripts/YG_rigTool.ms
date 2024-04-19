/*
YG_rigTool
since 2023.10.24
last updated 2024.04.19
by YeonGyun,Jeong
lupinxyz@gmail.com
*/

--------------------------------------------------------------------------------------------------------
--struct-------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
struct bipStruct
(
	myBip,myPelvis,mySpine,mySpine1,mySpine2,mySpine3,myNeck,myHead,
	myClavicleL,myUpperArmL,myForearmL,myHandL,
	myFinger0L,myFinger01L,myFinger02L,
	myFinger1L,myFinger11L,myFinger12L,
	myFinger2L,myFinger21L,myFinger22L,
	myFinger3L,myFinger31L,myFinger32L,
	myFinger4L,myFinger41L,myFinger42L,
	myThighL,myCalfL,myHorseLinkL,myFootL,
	myToe0L,myToe01L,
	myToe1L,myToe11L,
	myToe2L,myToe21L,
	myToe3L,myToe31L,
	myToe4L,myToe41L,
	myClavicleR,myUpperArmR,myForearmR,myHandR,
	myFinger0R,myFinger01R,myFinger02R,
	myFinger1R,myFinger11R,myFinger12R,
	myFinger2R,myFinger21R,myFinger22R,
	myFinger3R,myFinger31R,myFinger32R,
	myFinger4R,myFinger41R,myFinger42R,
	myThighR,myCalfR,myHorseLinkR,myFootR,
	myToe0R,myToe01R,
	myToe1R,myToe11R,
	myToe2R,myToe21R,
	myToe3R,myToe31R,
	myToe4R,myToe41R,
	myTail,myTail1,myTail2,myTail3,myTail4,myTail5,myTail6,myTail7,myTail8,
	
	myAllList = #(myBip,myPelvis,mySpine,mySpine1,mySpine2,mySpine3,myNeck,myHead,
		myClavicleL,myUpperArmL,myForearmL,myHandL,
		myFinger0L,myFinger01L,myFinger02L,
		myFinger1L,myFinger11L,myFinger12L,
		myFinger2L,myFinger21L,myFinger22L,
		myFinger3L,myFinger31L,myFinger32L,
		myFinger4L,myFinger41L,myFinger42L,
		myThighL,myCalfL,myHorseLinkL,myFootL,
		myToe0L,myToe01L,
		myToe1L,myToe11L,
		myToe2L,myToe21L,
		myToe3L,myToe31L,
		myToe4L,myToe41L,
		myClavicleR,myUpperArmR,myForearmR,myHandR,
		myFinger0R,myFinger01R,myFinger02R,
		myFinger1R,myFinger11R,myFinger12R,
		myFinger2R,myFinger21R,myFinger22R,
		myFinger3R,myFinger31R,myFinger32R,
		myFinger4R,myFinger41R,myFinger42R,
		myThighR,myCalfR,myHorseLinkR,myFootR,
		myToe0R,myToe01R,
		myToe1R,myToe11R,
		myToe2R,myToe21R,
		myToe3R,myToe31R,
		myToe4R,myToe41R,
		myTail,myTail1,myTail2,myTail3,myTail4,myTail5,myTail6,myTail7,myTail8)
)

struct boneStruct
(
	--name
	myName = "",

	myBip = execute ("$"+ "com"),
	myPelvis = execute ("$" + "pelvis"),

	-- mySpine = execute ("$"  + "spine_01"),
	mySpine1 = execute ("$"  + "spine_02"),
	mySpine2 = execute ("$"  + "spine_03"),
	mySpine3 = execute ("$"  + "spine_04"),
	mySpine4 = execute ("$"  + "spine_05"),

	myNeck = execute ("$" + "neck_01"),
	myHead = execute ("$" + "head"),

	myClavicleL = execute ("$" + "clavicle_l"),
	myUpperArmL = execute ("$" + "upperarm_l"),
	myForearmL = execute ("$" + "lowerarm_l"),
	myHandL = execute ("$" + "hand_l"),

	myFinger0L = execute ("$" + "thumb_01_l"),
	myFinger01L = execute ("$" + "thumb_02_l"),
	myFinger02L = execute ("$" + "thumb_03_l"),

	myFinger1L = execute ("$" + "index_01_l"),
	myFinger11L = execute ("$" + "index_02_l"),
	myFinger12L = execute ("$" + "index_03_l"),

	myFinger2L = execute ("$" + "middle_01_l"),
	myFinger21L = execute ("$" + "middle_02_l"),
	myFinger22L = execute ("$" + "middle_03_l"),

	myFinger3L = execute ("$" + "ring_01_l"),
	myFinger31L = execute ("$" + "ring_02_l"),
	myFinger32L = execute ("$" + "ring_03_l"),

	myFinger4L = execute ("$" + "pinky_01_l"),
	myFinger41L = execute ("$" + "pinky_02_l"),
	myFinger42L = execute ("$" + "pinky_03_l"),

	myThighL = execute ("$" + "thigh_l"),
	myCalfL = execute ("$" + "calf_l"),
	myHorseLinkL = execute ("$" + "horseLink_l"),
	myFootL = execute ("$" + "foot_l"),

	myToe0L = execute ("$" + "ball_l"),
	myToe01L = execute ("$" + "ball_01_l"),

	myToe1L = execute ("$" + "ball_1_l"),
	myToe11L = execute ("$" + "ball_11_l"),

	myToe2L = execute ("$" + "ball_2_l"),
	myToe21L = execute ("$" + "ball_21_l"),

	myToe3L = execute ("$" + "ball_3_l"),
	myToe31L = execute ("$" + "ball_31_l"),

	myToe4L = execute ("$" + "ball_4_l"),
	myToe41L = execute ("$" + "ball_41_l"),

	myClavicleR = execute ("$" + "clavicle_r"),
	myUpperArmR = execute ("$" + "upperarm_r"),
	myForearmR = execute ("$" + "lowerarm_r"),
	myHandR = execute ("$" + "hand_r"),

	-- myProp = execute ("$" + "weapon_r"),

	myFinger0R = execute ("$" + "thumb_01_r"),
	myFinger01R = execute ("$" + "thumb_02_r"),
	myFinger02R = execute ("$" + "thumb_03_r"),

	myFinger1R = execute ("$" + "index_01_r"),
	myFinger11R = execute ("$" + "index_02_r"),
	myFinger12R = execute ("$" + "index_03_r"),

	myFinger2R = execute ("$" + "middle_01_r"),
	myFinger21R = execute ("$" + "middle_02_r"),
	myFinger22R = execute ("$" + "middle_03_r"),

	myFinger3R = execute ("$" + "ring_01_r"),
	myFinger31R = execute ("$" + "ring_02_r"),
	myFinger32R = execute ("$" + "ring_03_r"),

	myFinger4R = execute ("$" + "pinky_01_r"),
	myFinger41R = execute ("$" + "pinky_02_r"),
	myFinger42R = execute ("$" + "pinky_03_r"),

	myThighR = execute ("$" + "thigh_r"),
	myCalfR = execute ("$" + "calf_r"),
	myHorseLinkR = execute ("$" + "horseLink_r"),
	myFootR = execute ("$" + "foot_r"),

	myToe0R = execute ("$" + "ball_r"),
	myToe01R = execute ("$" + "ball_01_r"),

	myToe1R = execute ("$" + "ball_1_r"),
	myToe11R = execute ("$" + "ball_11_r"),

	myToe2R = execute ("$" + "ball_2_r"),
	myToe21R = execute ("$" + "ball_21_r"),

	myToe3R = execute ("$" + "ball_3_r"),
	myToe31R = execute ("$" + "ball_31_r"),

	myToe4R = execute ("$" + "ball_4_r"),
	myToe41R = execute ("$" + "ball_41_r"),

	myTail = execute ("$" + "Tail"),
	myTail1 = execute ("$" + "Tail1"),
	myTail2 = execute ("$" + "Tail2"),
	myTail3 = execute ("$" + "Tail3"),
	myTail4 = execute ("$" + "Tail4"),
	myTail5 = execute ("$" + "Tail5"),
	myTail6 = execute ("$" + "Tail6"),
	myTail7 = execute ("$" + "Tail7"),
	myTail8 = execute ("$" + "Tail8"),

	myAllList = #(myBip,myPelvis,mySpine1,mySpine2,mySpine3,mySpine4,myNeck,myHead,
		myClavicleL,myUpperArmL,myForearmL,myHandL,
		myFinger0L,myFinger01L,myFinger02L,
		myFinger1L,myFinger11L,myFinger12L,
		myFinger2L,myFinger21L,myFinger22L,
		myFinger3L,myFinger31L,myFinger32L,
		myFinger4L,myFinger41L,myFinger42L,
		myThighL,myCalfL,myHorseLinkL,myFootL,
		myToe0L,myToe01L,
		myToe1L,myToe11L,
		myToe2L,myToe21L,
		myToe3L,myToe31L,
		myToe4L,myToe41L,
		myClavicleR,myUpperArmR,myForearmR,myHandR,
		myFinger0R,myFinger01R,myFinger02R,
		myFinger1R,myFinger11R,myFinger12R,
		myFinger2R,myFinger21R,myFinger22R,
		myFinger3R,myFinger31R,myFinger32R,
		myFinger4R,myFinger41R,myFinger42R,
		myThighR,myCalfR,myHorseLinkR,myFootR,
		myToe0R,myToe01R,
		myToe1R,myToe11R,
		myToe2R,myToe21R,
		myToe3R,myToe31R,
		myToe4R,myToe41R,
		myTail,myTail1,myTail2,myTail3,myTail4,myTail5,myTail6,myTail7,myTail8),

	myScaleList = #(myPelvis,mySpine1,mySpine2,mySpine3,mySpine4,myNeck,myHead,
		myClavicleL,myUpperArmL,myForearmL,myHandL,
		myThighL,myCalfL,myHorseLinkL,myFootL,
		myClavicleR,myUpperArmR,myForearmR,myHandR,
		myThighR,myCalfR,myHorseLinkR,myFootR,
		myTail,myTail1,myTail2,myTail3,myTail4,myTail5,myTail6,myTail7,myTail8)
)

struct bonePTStruct
(
	--name
	myName = "pt_",

	myBip = execute ("$"+ myName + "com"),
	myPelvis = execute ("$"+ myName + "pelvis"),

	-- mySpine = execute ("$" + myName + "spine_01"),
	mySpine1 = execute ("$" + myName + "spine_02"),
	mySpine2 = execute ("$" + myName + "spine_03"),
	mySpine3 = execute ("$" + myName + "spine_04"),
	mySpine4 = execute ("$" + myName + "spine_05"),

	myNeck = execute ("$"+ myName + "neck_01"),
	myHead = execute ("$"+ myName + "head"),

	myClavicleL = execute ("$"+ myName + "clavicle_l"),
	myUpperArmL = execute ("$"+ myName + "upperarm_l"),
	myForearmL = execute ("$"+ myName + "lowerarm_l"),
	myHandL = execute ("$"+ myName + "hand_l"),

	myFinger0L = execute ("$"+ myName + "thumb_01_l"),
	myFinger01L = execute ("$"+ myName + "thumb_02_l"),
	myFinger02L = execute ("$"+ myName + "thumb_03_l"),

	myFinger1L = execute ("$"+ myName + "index_01_l"),
	myFinger11L = execute ("$"+ myName + "index_02_l"),
	myFinger12L = execute ("$"+ myName + "index_03_l"),

	myFinger2L = execute ("$"+ myName + "middle_01_l"),
	myFinger21L = execute ("$"+ myName + "middle_02_l"),
	myFinger22L = execute ("$"+ myName + "middle_03_l"),

	myFinger3L = execute ("$"+ myName + "ring_01_l"),
	myFinger31L = execute ("$"+ myName + "ring_02_l"),
	myFinger32L = execute ("$"+ myName + "ring_03_l"),

	myFinger4L = execute ("$"+ myName + "pinky_01_l"),
	myFinger41L = execute ("$"+ myName + "pinky_02_l"),
	myFinger42L = execute ("$"+ myName + "pinky_03_l"),

	myThighL = execute ("$"+ myName + "thigh_l"),
	myCalfL = execute ("$"+ myName + "calf_l"),
	myHorseLinkL = execute ("$"+ myName + "horseLink_l"),
	myFootL = execute ("$"+ myName + "foot_l"),

	myToe0L = execute ("$"+ myName + "ball_l"),
	myToe01L = execute ("$"+ myName + "ball_01_l"),

	myToe1L = execute ("$"+ myName + "ball_1_l"),
	myToe11L = execute ("$"+ myName + "ball_11_l"),

	myToe2L = execute ("$"+ myName + "ball_2_l"),
	myToe21L = execute ("$"+ myName + "ball_21_l"),

	myToe3L = execute ("$"+ myName + "ball_3_l"),
	myToe31L = execute ("$"+ myName + "ball_31_l"),

	myToe4L = execute ("$"+ myName + "ball_4_l"),
	myToe41L = execute ("$"+ myName + "ball_41_l"),

	myClavicleR = execute ("$"+ myName + "clavicle_r"),
	myUpperArmR = execute ("$"+ myName + "upperarm_r"),
	myForearmR = execute ("$"+ myName + "lowerarm_r"),
	myHandR = execute ("$"+ myName + "hand_r"),

	-- myProp = execute ("$"+ myName + "weapon_r"),

	myFinger0R = execute ("$"+ myName + "thumb_01_r"),
	myFinger01R = execute ("$"+ myName + "thumb_02_r"),
	myFinger02R = execute ("$"+ myName + "thumb_03_r"),

	myFinger1R = execute ("$"+ myName + "index_01_r"),
	myFinger11R = execute ("$"+ myName + "index_02_r"),
	myFinger12R = execute ("$"+ myName + "index_03_r"),

	myFinger2R = execute ("$"+ myName + "middle_01_r"),
	myFinger21R = execute ("$"+ myName + "middle_02_r"),
	myFinger22R = execute ("$"+ myName + "middle_03_r"),

	myFinger3R = execute ("$"+ myName + "ring_01_r"),
	myFinger31R = execute ("$"+ myName + "ring_02_r"),
	myFinger32R = execute ("$"+ myName + "ring_03_r"),

	myFinger4R = execute ("$"+ myName + "pinky_01_r"),
	myFinger41R = execute ("$"+ myName + "pinky_02_r"),
	myFinger42R = execute ("$"+ myName + "pinky_03_r"),

	myThighR = execute ("$"+ myName + "thigh_r"),
	myCalfR = execute ("$"+ myName + "calf_r"),
	myHorseLinkR = execute ("$"+ myName + "horseLink_r"),
	myFootR = execute ("$"+ myName + "foot_r"),

	myToe0R = execute ("$"+ myName + "ball_r"),
	myToe01R = execute ("$"+ myName + "ball_01_r"),

	myToe1R = execute ("$"+ myName + "ball_1_r"),
	myToe11R = execute ("$"+ myName + "ball_11_r"),

	myToe2R = execute ("$"+ myName + "ball_2_r"),
	myToe21R = execute ("$"+ myName + "ball_21_r"),

	myToe3R = execute ("$"+ myName + "ball_3_r"),
	myToe31R = execute ("$"+ myName + "ball_31_r"),

	myToe4R = execute ("$"+ myName + "ball_4_r"),
	myToe41R = execute ("$"+ myName + "ball_41_r"),

	myTail = execute ("$"+ myName + "Tail"),
	myTail1 = execute ("$"+ myName + "Tail1"),
	myTail2 = execute ("$"+ myName + "Tail2"),
	myTail3 = execute ("$"+ myName + "Tail3"),
	myTail4 = execute ("$"+ myName + "Tail4"),
	myTail5 = execute ("$"+ myName + "Tail5"),
	myTail6 = execute ("$"+ myName + "Tail6"),
	myTail7 = execute ("$"+ myName + "Tail7"),
	myTail8 = execute ("$"+ myName + "Tail8"),

	myAllList = #(myBip,myPelvis,mySpine1,mySpine2,mySpine3,mySpine4,myNeck,myHead,
		myClavicleL,myUpperArmL,myForearmL,myHandL,
		myFinger0L,myFinger01L,myFinger02L,
		myFinger1L,myFinger11L,myFinger12L,
		myFinger2L,myFinger21L,myFinger22L,
		myFinger3L,myFinger31L,myFinger32L,
		myFinger4L,myFinger41L,myFinger42L,
		myThighL,myCalfL,myHorseLinkL,myFootL,
		myToe0L,myToe01L,
		myToe1L,myToe11L,
		myToe2L,myToe21L,
		myToe3L,myToe31L,
		myToe4L,myToe41L,
		myClavicleR,myUpperArmR,myForearmR,myHandR,
		myFinger0R,myFinger01R,myFinger02R,
		myFinger1R,myFinger11R,myFinger12R,
		myFinger2R,myFinger21R,myFinger22R,
		myFinger3R,myFinger31R,myFinger32R,
		myFinger4R,myFinger41R,myFinger42R,
		myThighR,myCalfR,myHorseLinkR,myFootR,
		myToe0R,myToe01R,
		myToe1R,myToe11R,
		myToe2R,myToe21R,
		myToe3R,myToe31R,
		myToe4R,myToe41R,
		myTail,myTail1,myTail2,myTail3,myTail4,myTail5,myTail6,myTail7,myTail8),

	myScaleList = #(myPelvis,mySpine1,mySpine2,mySpine3,mySpine4,myNeck,myHead,
		myClavicleL,myUpperArmL,myForearmL,myHandL,
		myThighL,myCalfL,myHorseLinkL,myFootL,
		myClavicleR,myUpperArmR,myForearmR,myHandR,
		myThighR,myCalfR,myHorseLinkR,myFootR,
		myTail,myTail1,myTail2,myTail3,myTail4,myTail5,myTail6,myTail7,myTail8)
)

struct rigStruct
(
	myBoneList = #(),
	myRigList = #(),
	myConList = #()
)

myBipStruct = bipStruct()
myBoneStruct = boneStruct()
myBonePTStruct = bonePTStruct()
myRigStruct = rigStruct()

myTopLayerList = #("PCM_BaseBody","PCF_BaseBody","Weapon","Monster")

myName = "Bip001"
myBip = $Bip001

myVersion = "v1.1"
	
try( destroydialog YG_rigTool ) catch()

rollout YG_rigTool ("YG_rigTool " + myVersion) width:160 height:408
(
	GroupBox 'grp1' "Bone" pos:[8,8] width:144 height:160 align:#left
	spinner 'spn_boneSize' "Bone Size" pos:[16,24] width:67 height:16 range:[1,20,5] type:#integer scale:1 align:#left
	button 'btn_makeRootBone' "Make Root Bone" pos:[16,48] width:128 height:32 align:#left
	button 'btn_boneMirror' "Bone Mirror" pos:[16,88] width:128 height:32 align:#left
	button 'btn_openBoneTools' "Open Bone Tools" pos:[16,128] width:128 height:32 align:#left
	
	GroupBox 'grp2' "Rig" pos:[8,168] width:144 height:88 align:#left
	edittext 'bip_name' "Biped : " pos:[16,184] width:128 height:24 align:#left
	button 'btn_boneConnectToBonePT' "Bone Connect To Biped" pos:[16,216] width:128 height:32 align:#left
	
	GroupBox 'grp3' "Layer" pos:[8,256] width:144 height:88 align:#left
	dropdownList 'layer_name' "" pos:[16,272] width:128 height:22 align:#left
	button 'btn_layerArrange' "Layer Arrange" pos:[16,304] width:128 height:32 align:#left

	GroupBox 'grp6' "Tools" pos:[8,344] width:144 height:56 align:#left
	button 'btn_namingTool' "Naming Tool" pos:[16,360] width:128 height:32 align:#left
--------------------------------------------------------------------------------------------------------
--function------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
	--struct execute
	fn structExecute=
	(
		myName = YG_rigTool.bip_name.text

		myBip = execute ("$"+ myName)
		myPelvis = execute ("$"+ myName + "Pelvis")

		mySpine = execute ("$" + myName + "Spine")
		mySpine1 = execute ("$" + myName + "Spine1")
		mySpine2 = execute ("$" + myName + "Spine2")
		mySpine3 = execute ("$" + myName + "Spine3")

		myNeck = execute ("$"+ myName + "Neck")
		myHead = execute ("$"+ myName + "Head")

		myClavicleL = execute ("$"+ myName + "LClavicle")
		myUpperArmL = execute ("$"+ myName + "LUpperArm")
		myForearmL = execute ("$"+ myName + "LForearm")
		myHandL = execute ("$"+ myName + "LHand")

		myFinger0L = execute ("$"+ myName + "LFinger0")
		myFinger01L = execute ("$"+ myName + "LFinger01")
		myFinger02L = execute ("$"+ myName + "LFinger02")

		myFinger1L = execute ("$"+ myName + "LFinger1")
		myFinger11L = execute ("$"+ myName + "LFinger11")
		myFinger12L = execute ("$"+ myName + "LFinger12")

		myFinger2L = execute ("$"+ myName + "LFinger2")
		myFinger21L = execute ("$"+ myName + "LFinger21")
		myFinger22L = execute ("$"+ myName + "LFinger22")

		myFinger3L = execute ("$"+ myName + "LFinger3")
		myFinger31L = execute ("$"+ myName + "LFinger31")
		myFinger32L = execute ("$"+ myName + "LFinger32")

		myFinger4L = execute ("$"+ myName + "LFinger4")
		myFinger41L = execute ("$"+ myName + "LFinger41")
		myFinger42L = execute ("$"+ myName + "LFinger42")

		myThighL = execute ("$"+ myName + "LThigh")
		myCalfL = execute ("$"+ myName + "LCalf")
		myHorseLinkL = execute ("$"+ myName + "LHorseLink")
		myFootL = execute ("$"+ myName + "LFoot")

		myToe0L = execute ("$"+ myName + "LToe0")
		myToe01L = execute ("$"+ myName + "LToe01")

		myToe1L = execute ("$"+ myName + "LToe1")
		myToe11L = execute ("$"+ myName + "LToe11")

		myToe2L = execute ("$"+ myName + "LToe2")
		myToe21L = execute ("$"+ myName + "LToe21")

		myToe3L = execute ("$"+ myName + "LToe3")
		myToe31L = execute ("$"+ myName + "LToe31")

		myToe4L = execute ("$"+ myName + "LToe4")
		myToe41L = execute ("$"+ myName + "LToe41")

		myClavicleR = execute ("$"+ myName + "RClavicle")
		myUpperArmR = execute ("$"+ myName + "RUpperArm")
		myForearmR = execute ("$"+ myName + "RForearm")
		myHandR = execute ("$"+ myName + "RHand")

		-- myProp = execute ("$"+ myName + "Prop1")

		myFinger0R = execute ("$"+ myName + "RFinger0")
		myFinger01R = execute ("$"+ myName + "RFinger01")
		myFinger02R = execute ("$"+ myName + "RFinger02")

		myFinger1R = execute ("$"+ myName + "RFinger1")
		myFinger11R = execute ("$"+ myName + "RFinger11")
		myFinger12R = execute ("$"+ myName + "RFinger12")

		myFinger2R = execute ("$"+ myName + "RFinger2")
		myFinger21R = execute ("$"+ myName + "RFinger21")
		myFinger22R = execute ("$"+ myName + "RFinger22")

		myFinger3R = execute ("$"+ myName + "RFinger3")
		myFinger31R = execute ("$"+ myName + "RFinger31")
		myFinger32R = execute ("$"+ myName + "RFinger32")

		myFinger4R = execute ("$"+ myName + "RFinger4")
		myFinger41R = execute ("$"+ myName + "RFinger41")
		myFinger42R = execute ("$"+ myName + "RFinger42")

		myThighR = execute ("$"+ myName + "RThigh")
		myCalfR = execute ("$"+ myName + "RCalf")
		myHorseLinkR = execute ("$"+ myName + "RHorseLink")
		myFootR = execute ("$"+ myName + "RFoot")

		myToe0R = execute ("$"+ myName + "RToe0")
		myToe01R = execute ("$"+ myName + "RToe01")

		myToe1R = execute ("$"+ myName + "RToe1")
		myToe11R = execute ("$"+ myName + "RToe11")

		myToe2R = execute ("$"+ myName + "RToe2")
		myToe21R = execute ("$"+ myName + "RToe21")

		myToe3R = execute ("$"+ myName + "RToe3")
		myToe31R = execute ("$"+ myName + "RToe31")

		myToe4R = execute ("$"+ myName + "RToe4")
		myToe41R = execute ("$"+ myName + "RToe41")

		myTail = execute ("$"+ myName + "Tail")
		myTail1 = execute ("$"+ myName + "Tail1")
		myTail2 = execute ("$"+ myName + "Tail2")
		myTail3 = execute ("$"+ myName + "Tail3")
		myTail4 = execute ("$"+ myName + "Tail4")
		myTail5 = execute ("$"+ myName + "Tail5")
		myTail6 = execute ("$"+ myName + "Tail6")
		myTail7 = execute ("$"+ myName + "Tail7")
		myTail8 = execute ("$"+ myName + "Tail8")
		
		myAllList = #(myBip,myPelvis,mySpine,mySpine1,mySpine2,mySpine3,myNeck,myHead,
		myClavicleL,myUpperArmL,myForearmL,myHandL,
		myFinger0L,myFinger01L,myFinger02L,
		myFinger1L,myFinger11L,myFinger12L,
		myFinger2L,myFinger21L,myFinger22L,
		myFinger3L,myFinger31L,myFinger32L,
		myFinger4L,myFinger41L,myFinger42L,
		myThighL,myCalfL,myHorseLinkL,myFootL,
		myToe0L,myToe01L,
		myToe1L,myToe11L,
		myToe2L,myToe21L,
		myToe3L,myToe31L,
		myToe4L,myToe41L,
		myClavicleR,myUpperArmR,myForearmR,myHandR,
		myFinger0R,myFinger01R,myFinger02R,
		myFinger1R,myFinger11R,myFinger12R,
		myFinger2R,myFinger21R,myFinger22R,
		myFinger3R,myFinger31R,myFinger32R,
		myFinger4R,myFinger41R,myFinger42R,
		myThighR,myCalfR,myHorseLinkR,myFootR,
		myToe0R,myToe01R,
		myToe1R,myToe11R,
		myToe2R,myToe21R,
		myToe3R,myToe31R,
		myToe4R,myToe41R,
		myTail,myTail1,myTail2,myTail3,myTail4,myTail5,myTail6,myTail7,myTail8)
		
		for i=1 to myAllList.count do
		(
			if myAllList[i] != undefined then
			(
				myBipStruct.myAllList[i] = myAllList[i]
			)
		)
		myBipStruct.myBip = myBip
		myBipStruct.myPelvis = myPelvis
		myBipStruct.mySpine = mySpine
		myBipStruct.mySpine1 = mySpine1
		myBipStruct.mySpine2 = mySpine2
		myBipStruct.mySpine3 = mySpine3
		myBipStruct.myNeck = myNeck
		myBipStruct.myHead = myHead
		myBipStruct.myClavicleL = myClavicleL
		myBipStruct.myUpperArmL = myUpperArmL
		myBipStruct.myForearmL = myForearmL
		myBipStruct.myHandL = myHandL
		myBipStruct.myFinger0L = myFinger0L
		myBipStruct.myFinger01L = myFinger01L
		myBipStruct.myFinger02L = myFinger02L
		myBipStruct.myFinger1L = myFinger1L
		myBipStruct.myFinger11L = myFinger11L
		myBipStruct.myFinger12L = myFinger12L
		myBipStruct.myFinger2L = myFinger2L
		myBipStruct.myFinger21L = myFinger21L
		myBipStruct.myFinger22L = myFinger22L
		myBipStruct.myFinger3L = myFinger3L
		myBipStruct.myFinger31L = myFinger31L
		myBipStruct.myFinger32L = myFinger32L
		myBipStruct.myFinger4L = myFinger4L
		myBipStruct.myFinger41L = myFinger41L
		myBipStruct.myFinger42L = myFinger42L
		myBipStruct.myThighL = myThighL
		myBipStruct.myCalfL = myCalfL
		myBipStruct.myHorseLinkL = myHorseLinkL
		myBipStruct.myFootL = myFootL
		myBipStruct.myToe0L = myToe0L
		myBipStruct.myToe01L = myToe01L
		myBipStruct.myToe1L = myToe1L
		myBipStruct.myToe11L = myToe11L
		myBipStruct.myToe2L = myToe2L
		myBipStruct.myToe21L = myToe21L
		myBipStruct.myToe3L = myToe3L
		myBipStruct.myToe31L = myToe31L
		myBipStruct.myToe4L = myToe4L
		myBipStruct.myToe41L = myToe41L
		myBipStruct.myClavicleR = myClavicleR
		myBipStruct.myUpperArmR = myUpperArmR
		myBipStruct.myForearmR = myForearmR
		myBipStruct.myHandR = myHandR
		myBipStruct.myFinger0R = myFinger0R
		myBipStruct.myFinger01R = myFinger01R
		myBipStruct.myFinger02R = myFinger02R
		myBipStruct.myFinger1R = myFinger1R
		myBipStruct.myFinger11R = myFinger11R
		myBipStruct.myFinger12R = myFinger12R
		myBipStruct.myFinger2R = myFinger2R
		myBipStruct.myFinger21R = myFinger21R
		myBipStruct.myFinger22R = myFinger22R
		myBipStruct.myFinger3R = myFinger3R
		myBipStruct.myFinger31R = myFinger31R
		myBipStruct.myFinger32R = myFinger32R
		myBipStruct.myFinger4R = myFinger4R
		myBipStruct.myFinger41R = myFinger41R
		myBipStruct.myFinger42R = myFinger42R
		myBipStruct.myThighR = myThighR
		myBipStruct.myCalfR = myCalfR
		myBipStruct.myHorseLinkR = myHorseLinkR
		myBipStruct.myFootR = myFootR
		myBipStruct.myToe0R = myToe0R
		myBipStruct.myToe01R = myToe01R
		myBipStruct.myToe1R = myToe1R
		myBipStruct.myToe11R = myToe11R
		myBipStruct.myToe2R = myToe2R
		myBipStruct.myToe21R = myToe21R
		myBipStruct.myToe3R = myToe3R
		myBipStruct.myToe31R = myToe31R
		myBipStruct.myToe4R = myToe4R
		myBipStruct.myToe41R = myToe41R
		myBipStruct.myTail = myTail
		myBipStruct.myTail1 = myTail1
		myBipStruct.myTail2 = myTail2
		myBipStruct.myTail3 = myTail3
		myBipStruct.myTail4 = myTail4
		myBipStruct.myTail5 = myTail5
		myBipStruct.myTail6 = myTail6
		myBipStruct.myTail7 = myTail7
		myBipStruct.myTail8 = myTail8
		-- myBipStruct.myProp = myProp
	)
	
	--bone mirror copy function
	fn boneMirrorCopy myBone=
	(
		myCopy = copy myBone
		t = myCopy.transform
		mt=t*(scaleMatrix [-1,1,1])
		myCopy.transform = mt
		mtm=(scaleMatrix [1,1,-1])*mt
		myCopy.transform = mtm
		myCopy.name = substituteString myBone.name "_l" "_r"
		myCopy.wirecolor = color 174 186 203

		return myCopy.name
	)
--------------------------------------------------------------------------------------------------------
--controller-------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
	--make constraint function
	fn makeConst myType myDriven myDriver =
	(
		if myType == "pos" then
		(
			myConst = myDriven.position.controller = Position_constraint()
			myConst.relative = off
			myConst.appendTarget myDriver 50
		)
		else if myType == "pos2" then
		(
			myConst = myDriven.position.controller
			myConst.appendTarget myDriver 50
		)
		else if myType == "pos_active" then
		(
			myDriven.position.controller = position_list()
			myDriven.pos.controller.Position_XYZ.controller = Position_XYZ ()
			myDriven.pos.controller.setName 1 "Position XYZ"
			myConst = myDriven.pos.controller.Available.controller = Position_constraint()
			myConst.relative = off
			myConst.appendTarget myDriver 50
			myDriven.pos.controller.Available.controller = Position_XYZ()
			myDriven.pos.controller.setActive 3
		)
		else if myType == "ori" then
		(
			myConst = myDriven.rotation.controller = Orientation_constraint()
			myConst.relative = on
			myConst.appendTarget myDriver 50
		)
		else if myType == "ori2" then
		(
			myConst = myDriven.rotation.controller
			myConst.appendTarget myDriver 50
		)
		else if myType == "basic" then
		(
			myTransform = myDriven.transform
			myDriven.position.controller = Position_XYZ()		
			myDriven.rotation.controller = Euler_XYZ()
			myDriven.transform = myTransform
		)
		else if myType == "basic_pos" then
		(
			myTransform = myDriven.transform
			myDriven.position.controller = Position_XYZ()		
			myDriven.transform = myTransform
		)
		else if myType == "zero" then
		(
			myDriven.position.controller = position_list()
			myDriven.pos.controller.Position_XYZ.controller = Bezier_Position ()
			myDriven.pos.controller.setName 1 "Frozen Position"
			myDriven.pos.controller.Available.controller = Position_XYZ()
			myDriven.pos.controller.setName 2 "Zero Pos XYZ"
			myDriven.pos.controller.setActive 2

			myDriven.rotation.controller = rotation_list()
			myDriven.rotation.controller.setName 1 "Frozen Rotation"
			myDriven.rotation.controller.Available.controller = Euler_XYZ()
			myDriven.rotation.controller.setName 2 "Zero Euler XYZ"
			myDriven.rotation.controller.setActive 2
		)
		else if myType == "scale" then
		(
			paramWire.connect myDriver.transform.controller[#Scale] myDriven.transform.controller[#Scale] "Scale"
		)
	)

	--weapon socket
	fn weaponSocketBoneParent = 
	(
		$shield_l.parent = $lowerarm_l

		$weapon_back_l.parent = $spine_04
		$weapon_back_r.parent = $spine_04

		$weapon_l.parent = $hand_l
		$weapon_r.parent = $hand_r

		$weapon_waist_l.parent = $pelvis
		$weapon_waist_r.parent = $pelvis
	)
	
--------------------------------------------------------------------------------------------------------
--bone-------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
	--make bone function
	fn makeBone myStart myName =
	(
		if myStart != undefined then
		(
			myBone = BoneSys.createBone [0,0,0] [0,0,YG_rigTool.spn_boneSize.value] [1,0,0]
			myBone.transform = myStart.transform
			myBone.name = myName
			myBone.width = YG_rigTool.spn_boneSize.value
			myBone.height = YG_rigTool.spn_boneSize.value
			myBone.taper = 90
			myBone.sidefins=false
		)
	)

	--make bone function
	fn makeBoneHalfSize myStart myName =
	(
		myBone = BoneSys.createBone [0,0,0] [0,0,YG_rigTool.spn_boneSize.value/2] [1,0,0]
		myBone.transform = myStart.transform
		myBone.name = myName
		myBone.width = YG_rigTool.spn_boneSize.value/2
		myBone.height = YG_rigTool.spn_boneSize.value/2
		myBone.taper = 90
		myBone.sidefins=false
	)

	-- con mirror
	fn conTransformMirror sel=
	(
		mySide = sel.name[sel.name.count]
		myMirrorSide = "r"
		
		if mySide == "l" then myMirrorSide = "r"
		else if mySide == "r" then myMirrorSide = "l"
		
		myName = sel.name
		myName[myName.count] = myMirrorSide
		
		myMirrorCon = execute( "$" + myName)
		
		t = sel.transform
		mt=t*(scaleMatrix [-1,1,1])
		mtm=(scaleMatrix [-1,-1,-1])*mt
		myMirrorCon.transform = mtm
	)

	-- twist function
	function fnSplineControl preFix subFix splineNode widthVar=
	(	 
		local n=(numknots splineNode 1)	  
		--Here is the creation of the Control Objects (the ones that will deform the spline)
		local controlsArray=#()
		for i=1 to n do
		(
			controlVar=point centerMarker:false axisTripod:false cross:false box:true size:(widthVar*5) \
							wirecolor:red name:("con_"+preFix+"_"+(i as string)+"_"+subFix)
			local controlRow1=pathTangent splineNode 1 ((i-1)/(n-1) as float)
			local controlRow3=normalize (cross controlRow1 [0,1,0])
			local controlRow2=normalize (cross controlRow3 controlRow1)
			local controlRow4=getknotpoint splineNode 1 i
			controlVar.transform=matrix3 controlRow1 controlRow2 controlRow3 controlRow4
			append controlsArray controlVar
		)

		--it's a need to select the spline and activate the modify panel, oterwise the script 
		--will crash when adding the control Objects in the skin modifier.
		select splineNode
		setCommandPanelTaskMode mode: #modify

		--Creates the Attachment, according to the type.
		--Spline IK Control
		--Without tangents
		for i=1 to n do setknotType splineNode 1 i #smooth
			
		addmodifier splineNode (Spline_IK_Control ()) 
		splineNode.modifiers[1].noLinking()
		splineNode.modifiers[1].helper_list=controlsArray
		return controlsArray
	)
	
	-- twist function
	function fnCreateChain preFix subFix splineNode ControlsArray nBones widthVar taperVar =
	(
		 --some variables
		local BoneArray=#()
		local SplineChainDef
		local rotScriptCtrl
		local lengthVar=curveLength splineNode
		local HelperArray=#()
		local RootHelper=point centerMarker:false axisTripod:false cross:false box:true size:(widthVar*3) wirecolor:blue name:("pt_tw_"+preFix+"_main_"+subFix)
		RootHelper.transform=ControlsArray[1].transform
		ControlsArray.parent=RootHelper
		local prevBoneVar=RootHelper

		 --First loop, it creates each bone and defines its settings, it creates also its respective
		 --helper and the controller to attach the bone to the helper (position constraint)
		for i=1 to nBones+1 do
		(
			HelperVar=point centerMarker:false axisTripod:false cross:false box:true size:(widthVar*1.5) wirecolor:blue name:("pt_tw_"+preFix+"_"+(i as string)+"_"+subFix)
			HelperVar.position=[(lengthVar*(i-1)/nBones),0,0]
			append HelperArray HelperVar
		)
		
		--Remove Helper's inheritance 
		setInheritanceFlags HelperArray #{7,8,9}

		--This loop assigns the path_constraint to the helper objects
		for i=1 to HelperArray.count do
		(
			HelperArray[i].position.controller=path_constraint()
			HelperArray[i].position.controller.appendTarget splineNode 100
			deletekeys HelperArray[i].position.controller.percent.controller
			--the helper's percent over the spline depends on its position over the chain
			HelperArray[i].position.controller.percent=100*(i-1)/nBones as float
		)

		for i=1 to (nBones+1) do HelperArray[i].position.controller=position_list()

		HelperArray.parent=RootHelper

		--if the manipulation controllers option is active then create an extra position_xyz controller for manual adjustments
		for i=1 to HelperArray.count do
		(
			HelperArray[i].position.controller.available.controller=position_xyz()
			HelperArray[i].position.controller.active=HelperArray[i].position.controller.count
		)

		--if Look At Type Equals Quaternion Aim,constraints each bone to the current level helper
		--the helper will do all the job with the quaternion script controller
		setTransformLockFlags HelperArray #{5,6,7,8,9}
		local quatScriptCtrl
		local scriptString="posThis=posThisCtrl.value*inverse nodeParent.transform\n"+
								"posTarget=posTargetCtrl.value*inverse nodeParent.transform\n"+
								"vector=posTarget-posThis\n"+
								"axis=normalize (cross vector [1,0,0])\n"+
								"angle=acos (normalize vector).x\n"

		for i=1 to HelperArray.count do
		(
			HelperArray[i].rotation.controller=rotation_list()
			HelperArray[i].rotation.controller[2].controller=euler_xyz()
			HelperArray[i].rotation.controller.active=2
		)
		quatScriptCtrl=rotation_script()
		helperArray[1].rotation.controller[1].controller=quatScriptCtrl
		quatScriptCtrl.addNode "nodeParent" RootHelper
		quatScriptCtrl.addObject "posTargetCtrl" helperArray[2].position.controller
		quatScriptCtrl.addObject "posThisCtrl" helperArray[1].position.controller
		quatScriptCtrl.script=scriptString+"(quat angle axis)*nodeParent.transform.rotation"
		scriptString+="(quat rotX [1,0,0])*(quat angle axis)*nodeParent.transform.rotation"
		
		for i=2 to nBones do
		(
			quatScriptCtrl=rotation_script()
			helperArray[i].rotation.controller[1].controller=quatScriptCtrl
			quatScriptCtrl.addNode "nodeParent" helperArray[i-1]
			quatScriptCtrl.addObject "posTargetCtrl" helperArray[i+1].position.controller
			quatScriptCtrl.addObject "posThisCtrl" helperArray[i].position.controller
			quatScriptCtrl.addTarget "rotX" helperArray[i-1].rotation.controller[2].x_rotation.controller
			quatScriptCtrl.script=scriptString
		)

		--if "Average to" equals All controls
		--If "Average Type" equals Orientation Constraint
		--Loops throught the Control Objects and constraint the bones between them (the weight is a static value in respect percent by number of controls 
		--instead dynamic distance calculation)
		m =(ControlsArray.count-1)
		l=nBones/m as float
		rotScriptCtrl=rotation_script()
		rotScriptCtrl.addNode "nodeA" RootHelper
		rotScriptCtrl.addNode "nodeB" controlsArray[1]
		rotScriptCtrl.script="rot=quatToEuler (nodeB.transform*inverse nodeA.transform).rotation order:7\n"+
								   "quat (rot.x+rot.z) [-1,0,0]"
		HelperArray[1].rotation.controller.available.controller=rotScriptCtrl
		for j=1 to m do
		(
			difIter=((j-1)*l+1)
			minIter=(ceil difIter) 
			difIter=minIter-difIter
			maxIter=(ceil (j*l))
			if j!=1 then
			(
				HelperArray[minIter].rotation.controller.available.controller=rotScriptCtrl
				HelperArray[minIter].rotation.controller.weight[HelperArray[minIter].rotation.controller.count]=100.0*(1-difIter)/l
			)
			rotScriptCtrl=copy rotScriptCtrl
			rotScriptCtrl.setNode "nodeA" controlsArray[j]
			rotScriptCtrl.setNode "nodeB" controlsArray[j+1]
			if difIter!=0 then
			(
				HelperArray[minIter].rotation.controller.available.controller=rotScriptCtrl
				HelperArray[minIter].rotation.controller.weight[HelperArray[minIter].rotation.controller.count]=100.0*difIter/l
			)
			minIter+=1
			for i=minIter to maxIter do
			(
				HelperArray[i].rotation.controller.available.controller=rotScriptCtrl
				HelperArray[i].rotation.controller.weight[HelperArray[i].rotation.controller.count]=100.0/l
			)
		)
	)
	
	--make twist bone
	fn makeTwistBone =
	(
		myBonePTStruct = bonePTStruct()

		--arm line		
		myList = #("myBipStruct.myUpperArm","myBipStruct.myForearm","myBipStruct.myHand")
		mySide = #("L","R")
		for i=1 to 2 do
		(
			s = splineShape() --create a spline shape
			addNewSpline s --add a spline to it
			addKnot s 1 #corner #line (execute (myList[1]+mySide[i]+".transform.pos"))
			addKnot s 1 #corner #line (execute (myList[2]+mySide[i]+".transform.pos"))
			addKnot s 1 #corner #line (execute (myList[3]+mySide[i]+".transform.pos"))
			updateShape s --update the shape
			s.vertexTicks = true --enable vertex ticks
			s.wirecolor = color 0 0 0
			if i==1 then s.name = "line_arm_l" else s.name = "line_arm_r"
		)
		
		select #($line_arm_l, $line_arm_r)
		SelArray=selection as array
		for splineNode in SelArray where (superclassof splineNode==shape) do
		(
			myCount = numknots splineNode 1
			if myCount>1 then
			(
				myName = filterString splineNode.name "_"
				local ControlsArray=fnSplineControl (myName[2]) (myName[3]) splineNode YG_rigTool.spn_boneSize.value
				fnCreateChain (myName[2]) (myName[3]) splineNode ControlsArray ((myCount-1)*3) YG_rigTool.spn_boneSize.value 0.0
			)
		)
		
		--arm left
		makeConst "pos" $upperarm_twist_01_l $pt_tw_arm_2_l
		makeConst "ori" $upperarm_twist_01_l $pt_tw_arm_2_l

		makeConst "pos" $upperarm_twist_02_l $pt_tw_arm_3_l
		makeConst "ori" $upperarm_twist_02_l $pt_tw_arm_3_l
		
		makeConst "pos" $lowerarm_twist_02_l $pt_tw_arm_5_l
		makeConst "ori" $lowerarm_twist_02_l $pt_tw_arm_5_l

		makeConst "pos" $lowerarm_twist_01_l $pt_tw_arm_6_l
		makeConst "ori" $lowerarm_twist_01_l $pt_tw_arm_6_l

		---
		myPointList = #($pt_tw_arm_1_l,$pt_tw_arm_2_l,$pt_tw_arm_3_l,$pt_tw_arm_4_l,$pt_tw_arm_5_l,$pt_tw_arm_main_l,$line_arm_l)
		myBoneList = #($upperarm_twist_01_l,$upperarm_twist_02_l,$lowerarm_twist_01_l,$lowerarm_twist_02_l)
		myConList = #($con_arm_1_l,$con_arm_2_l,$con_arm_3_l)
		
		for i in myPointList do append myRigStruct.myRigList i
		for i in myBoneList do append myRigStruct.myBoneList i
		for i in myConList do append myRigStruct.myConList i

		--arm right
		makeConst "pos" $upperarm_twist_01_r $pt_tw_arm_2_r
		makeConst "ori" $upperarm_twist_01_r $pt_tw_arm_2_r

		makeConst "pos" $upperarm_twist_02_r $pt_tw_arm_3_r
		makeConst "ori" $upperarm_twist_02_r $pt_tw_arm_3_r

		makeConst "pos" $lowerarm_twist_02_r $pt_tw_arm_5_r
		makeConst "ori" $lowerarm_twist_02_r $pt_tw_arm_5_r

		makeConst "pos" $lowerarm_twist_01_r $pt_tw_arm_6_r
		makeConst "ori" $lowerarm_twist_01_r $pt_tw_arm_6_r

		---
		myPointList = #($pt_tw_arm_1_r,$pt_tw_arm_2_r,$pt_tw_arm_3_r,$pt_tw_arm_4_r,$pt_tw_arm_5_r,$pt_tw_arm_main_r,$line_arm_r)
		myBoneList = #($upperarm_twist_01_r,$upperarm_twist_02_r,$lowerarm_twist_01_r,$lowerarm_twist_02_r)
		myConList = #($con_arm_1_r,$con_arm_2_r,$con_arm_3_r)
		
		for i in myPointList do append myRigStruct.myRigList i
		for i in myBoneList do append myRigStruct.myBoneList i
		for i in myConList do append myRigStruct.myConList i

		-- leg line
		myList = #("myBipStruct.myThigh","myBipStruct.myCalf","myBipStruct.myHorseLink","myBipStruct.myFoot")
		mySide = #("L","R")
		for i=1 to 2 do
		(
			s = splineShape() --create a spline shape
			addNewSpline s --add a spline to it
			
			if (execute (myList[3]+mySide[i])) == undefined then
			(
				addKnot s 1 #corner #line (execute (myList[1]+mySide[i]+".transform.pos"))
				addKnot s 1 #corner #line (execute (myList[2]+mySide[i]+".transform.pos"))
				addKnot s 1 #corner #line (execute (myList[4]+mySide[i]+".transform.pos"))
			)else
			(
				addKnot s 1 #corner #line (execute (myList[1]+mySide[i]+".transform.pos"))
				addKnot s 1 #corner #line (execute (myList[2]+mySide[i]+".transform.pos"))
				addKnot s 1 #corner #line (execute (myList[3]+mySide[i]+".transform.pos"))
				addKnot s 1 #corner #line (execute (myList[4]+mySide[i]+".transform.pos"))
			)
			updateShape s --update the shape
			s.vertexTicks = true --enable vertex ticks
			s.wirecolor = color 0 0 0
			if i==1 then s.name = "line_leg_l" else s.name = "line_leg_r"
		)

		select #($line_leg_l, $line_leg_r)
		SelArray=selection as array
		for splineNode in SelArray where (superclassof splineNode==shape) do
		(
			myCount = numknots splineNode 1
			if myCount>1 then
			(
			   myName = filterString splineNode.name "_"
			   local ControlsArray=fnSplineControl (myName[2]) (myName[3]) splineNode YG_rigTool.spn_boneSize.value
			   fnCreateChain (myName[2]) (myName[3]) splineNode ControlsArray ((myCount-1)*3) YG_rigTool.spn_boneSize.value 0.0
			)
		)
		clearSelection()

		--leg left
		$pt_tw_leg_main_l.transform = myBipStruct.myThighL.transform
		$con_leg_2_l.transform = myBipStruct.myCalfL.transform
		$con_leg_3_l.transform = myBipStruct.myFootL.transform

		myPoint = point name:"pt_link_thigh_l" size:10 cross:on box:off axistripod:off pos:myBonePTStruct.myThighL.transform.pos
		myPoint.transform = myBonePTStruct.myThighL.transform
		
		myPoint = point name:"pt_tw_thigh_l" size:10 cross:off box:off axistripod:on pos:(myBonePTStruct.myThighL.transform.pos)
		myPoint.transform = myBonePTStruct.myThighL.transform
		myPoint.parent = $pt_link_thigh_l
		myPoint[3][1][1].value = (distance myBonePTStruct.myThighL myBonePTStruct.myCalfL)
		myConst = myPoint.rotation.controller = LookAt_constraint()
		myConst.appendTarget myBonePTStruct.myCalfL 50
		myConst.viewline_length_abs = off
		myConst.lookat_vector_length = 0
		myConst.pickUpNode  = $pt_link_thigh_l
		myConst.upnode_world = off

		--
		makeConst "pos" $thigh_twist_01_l $pt_tw_leg_2_l
		makeConst "ori" $thigh_twist_01_l $pt_tw_leg_2_l

		makeConst "pos" $thigh_twist_02_l $pt_tw_leg_3_l
		makeConst "ori" $thigh_twist_02_l $pt_tw_leg_3_l

		makeConst "pos" $calf_twist_02_l $pt_tw_leg_5_l
		makeConst "ori" $calf_twist_02_l $pt_tw_leg_5_l

		makeConst "pos" $calf_twist_01_l $pt_tw_leg_6_l
		makeConst "ori" $calf_twist_01_l $pt_tw_leg_6_l

		--
		try(myPointList = #($pt_link_thigh_l,$pt_tw_thigh_l,$pt_tw_leg_1_l,$pt_tw_leg_2_l,$pt_tw_leg_3_l,$pt_tw_leg_4_l,$pt_tw_leg_5_l,$pt_tw_leg_6_l,$pt_tw_leg_7_l,
			$line_leg_l,$pt_tw_leg_main_l))catch()
		try(myBoneList = #($thigh_twist_01_l,$thigh_twist_02_l,$calf_twist_01_l,$calf_twist_02_l))catch()
		try(myConList = #($con_leg_1_l,$con_leg_2_l,$con_leg_3_l,$con_leg_4_l))catch()
			
		try(for i in myPointList do append myRigStruct.myRigList i)catch()
		try(for i in myBoneList do append myRigStruct.myBoneList i)catch()
		try(for i in myConList do append myRigStruct.myConList i)catch()

		--leg right
		$pt_tw_leg_main_r.transform = myBipStruct.myThighR.transform
		$con_leg_2_r.transform = myBipStruct.myCalfR.transform
		$con_leg_3_r.transform = myBipStruct.myFootR.transform
		
		myPoint = point name:"pt_link_thigh_r" size:10 cross:on box:off axistripod:off pos:myBonePTStruct.myThighR.transform.pos
		myPoint.transform = myBonePTStruct.myThighR.transform
		myPoint.parent = myBonePTStruct.myPelvis

		myPoint = point name:"pt_tw_thigh_r" size:10 cross:off box:off axistripod:on pos:(myBonePTStruct.myThighR.transform.pos)
		myPoint.transform = myBonePTStruct.myThighR.transform
		myPoint.parent = $pt_link_thigh_r
		myPoint[3][1][1].value = -(distance myBonePTStruct.myThighR myBonePTStruct.myCalfR)
		myConst = myPoint.rotation.controller = LookAt_constraint()
		myConst.appendTarget myBonePTStruct.myCalfR 50
		myConst.viewline_length_abs = off
		myConst.lookat_vector_length = 0
		myConst.pickUpNode  = $pt_link_thigh_r
		myConst.upnode_world = off

		--
		makeConst "pos" $thigh_twist_01_r $pt_tw_leg_2_r
		makeConst "ori" $thigh_twist_01_r $pt_tw_leg_2_r

		makeConst "pos" $thigh_twist_02_r $pt_tw_leg_3_r
		makeConst "ori" $thigh_twist_02_r $pt_tw_leg_3_r

		makeConst "pos" $calf_twist_02_r $pt_tw_leg_5_r
		makeConst "ori" $calf_twist_02_r $pt_tw_leg_5_r
		
		makeConst "pos" $calf_twist_01_r $pt_tw_leg_6_r
		makeConst "ori" $calf_twist_01_r $pt_tw_leg_6_r

		--
		try(myPointList = #($pt_link_thigh_r,$pt_tw_thigh_r,$pt_tw_leg_1_r,$pt_tw_leg_2_r,$pt_tw_leg_3_r,$pt_tw_leg_4_r,$pt_tw_leg_5_r,$pt_tw_leg_6_r,$pt_tw_leg_7_r,
			$line_leg_r,$pt_tw_leg_main_r))catch()
		try(myBoneList = #($thigh_twist_01_r,$thigh_twist_02_r,$calf_twist_01_r,$calf_twist_02_r))catch()
		try(myConList = #($con_leg_1_r,$con_leg_2_r,$con_leg_3_r,$con_leg_4_r))catch()
			
		try(for i in myPointList do append myRigStruct.myRigList i)catch()
		try(for i in myBoneList do append myRigStruct.myBoneList i)catch()
		try(for i in myConList do append myRigStruct.myConList i)catch()

		--neck
		myPoint = point name:"pt_link_head" size:10 cross:on box:off axistripod:off pos:myBonePTStruct.myHead.transform.pos
		myPoint.transform = myBonePTStruct.myHead.transform
		myPoint.parent = myBonePTStruct.myHead

		myPoint = point name:"pt_tw_neck_01" size:10 cross:on box:off axistripod:off pos:((myBonePTStruct.myNeck.transform.pos+myBonePTStruct.myHead.transform.pos)/2)
		myPoint.parent = myBonePTStruct.myNeck
		myConst = myPoint.rotation.controller = LookAt_constraint()
		myConst.appendTarget $pt_link_head 50
		myConst.viewline_length_abs = off
		myConst.lookat_vector_length = 0
		myConst.pickUpNode  = $pt_link_head
		myConst.upnode_world = off

		makeConst "pos" $neck_02 $pt_tw_neck_01
		makeConst "ori" $neck_02 $pt_tw_neck_01
		makeConst "ori2" $neck_02 myBonePTStruct.myNeck

		myPointList = #($pt_link_head,$pt_tw_neck_01)
		myBoneList = #($neck_02)

		for i in myPointList do append myRigStruct.myRigList i
		for i in myBoneList do append myRigStruct.myBoneList i

		--breast
		/*
		myPoint = point name:"pt_link_spine" size:10 cross:on box:off axistripod:off pos:myBipStruct.mySpine2.transform.pos
		myPoint.parent = myBipStruct.mySpine2
		
		myPoint = point name:"pt_link_breast" size:10 cross:on box:off axistripod:off pos:myBipStruct.mySpine2.transform.pos
		myPoint.parent = $pt_link_spine
		myPoint[3][2][1].value = 90
		myPoint[3][2][3].value = -90

		myPoint = point name:"pt_breast_l" size:10 cross:off box:off axistripod:on pos:$pt_link_breast.transform.pos
		myPoint.transform = $pt_link_breast.transform
		myPoint.pos.x = $pt_tw_thigh_l.pos.x
		myPoint.parent = $pt_link_breast
		makeBoneHalfSize myPoint "breast_l"
		myBone = $breast_l
		myBone.parent = $spine_03
		makeConst "pos" myBone myPoint
		makeConst "ori" myBone myPoint
		paramWire.connect $pt_breast_l.transform.controller[#Scale] $breast_l.transform.controller[#Scale] "Scale"
		setInheritanceFlags $pt_breast_l #{1..6}

		myPoint = point name:"pt_breast_r" size:10 cross:off box:off axistripod:on pos:$pt_link_breast.transform.pos
		myPoint.transform = $pt_link_breast.transform
		myPoint.pos.x = $pt_tw_thigh_r.pos.x
		myPoint.parent = $pt_link_breast
		conTransformMirror $pt_breast_l
		makeBoneHalfSize myPoint "breast_r"
		myBone = $breast_r
		myBone.parent = $spine_03
		makeConst "pos" myBone myPoint
		makeConst "ori" myBone myPoint
		paramWire.connect $pt_breast_r.transform.controller[#Scale] $breast_r.transform.controller[#Scale] "Scale"
		setInheritanceFlags $pt_breast_r #{1..6}

		myPointList = #($pt_link_spine,$pt_link_breast,$pt_breast_l,$pt_breast_r)
		myBoneList = #($breast_l,$breast_r)

		for i in myPointList do append myRigStruct.myRigList i
		for i in myBoneList do append myRigStruct.myBoneList i
		*/

	)

	--make bone to biped
	fn makeBoneToBiped=
	(
		--make bone pt / wire scale
		for i=1 to myBoneStruct.myAllList.count do
		(
			if myBoneStruct.myAllList[i] != undefined do
			(
				myName = "pt_" + myBoneStruct.myAllList[i].name
				myPt = point name:"point" size:YG_rigTool.spn_boneSize.value cross:off box:on axistripod:off pos:[0,0,0] wirecolor:(color 14 255 2) --green
				myPt.name = myName
				myPt.transform = myBoneStruct.myAllList[i].transform
				paramWire.connect myPt.transform.controller[#Scale] myBoneStruct.myAllList[i].transform.controller[#Scale] "Scale"
				myPt.parent = myBipStruct.myAllList[i]
				append myRigStruct.myRigList myPt
			)
		)

		--make twist bone
		makeTwistBone()

		/*
		--breast
		myPoint = point name:"pt_link_spine" size:10 cross:on box:off axistripod:off pos:myBipStruct.mySpine2.transform.pos
		myPoint.parent = myBipStruct.mySpine2
		
		myPoint = point name:"pt_link_breast" size:10 cross:on box:off axistripod:off pos:myBipStruct.mySpine2.transform.pos
		myPoint.parent = $pt_link_spine
		myPoint[3][2][1].value = 90
		myPoint[3][2][3].value = -90

		myPoint = point name:"pt_breast_l" size:10 cross:off box:off axistripod:on pos:$pt_link_breast.transform.pos
		myPoint.transform = $pt_link_breast.transform
		myPoint.pos.x = $pt_tw_thigh_l.pos.x
		myPoint.parent = $pt_link_breast
		makeBoneHalfSize myPoint "breast_l"
		myBone = $breast_l
		myBone.parent = $spine_03
		makeConst "pos" myBone myPoint
		makeConst "ori" myBone myPoint
		paramWire.connect $pt_breast_l.transform.controller[#Scale] $breast_l.transform.controller[#Scale] "Scale"
		setInheritanceFlags $pt_breast_l #{1..6}

		myPoint = point name:"pt_breast_r" size:10 cross:off box:off axistripod:on pos:$pt_link_breast.transform.pos
		myPoint.transform = $pt_link_breast.transform
		myPoint.pos.x = $pt_tw_thigh_r.pos.x
		myPoint.parent = $pt_link_breast
		makeBoneHalfSize myPoint "breast_r"
		myBone = $breast_r
		myBone.parent = $spine_03
		makeConst "pos" myBone myPoint
		makeConst "ori" myBone myPoint
		conTransformMirror $pt_breast_l
		paramWire.connect $pt_breast_r.transform.controller[#Scale] $breast_r.transform.controller[#Scale] "Scale"
		setInheritanceFlags $pt_breast_r #{1..6}

		myPointList = #($pt_link_spine,$pt_link_breast,$pt_breast_l,$pt_breast_r)
		myBoneList = #($breast_l,$breast_r)

		for i in myPointList do append myRigStruct.myRigList i
		for i in myBoneList do append myRigStruct.myBoneList i
		*/
	)

	--bone connect to biped
	fn boneConnectToBiped=
	(
		for i in 1 to myBoneStruct.myAllList.count do
		(
			try(
			makeConst "ori" myBoneStruct.myAllList[i] myBipStruct.myAllList[i]
			makeConst "pos" myBoneStruct.myAllList[i] myBonePTStruct.myAllList[i]
			)catch()
		)
		-- neck, head
		$neck_01.pos.controller.relative = off
		$neck_02.pos.controller.relative = off
		$head.pos.controller.relative = off

		--tw con connect
		--arm left
		$pt_tw_arm_main_l.parent = myBipStruct.myClavicleL
		$line_arm_l.parent = myBip
		
		makeConst "pos_active" $con_arm_1_l myBipStruct.myUpperArmL
		$con_arm_2_l.parent = myBipStruct.myForeArmL
		$con_arm_3_l.parent = myBipStruct.myHandL
		
		makeConst "zero" $con_arm_2_l $con_arm_2_l
		makeConst "zero" $con_arm_3_l $con_arm_3_l

		$pt_upperarm_l.parent = $con_arm_1_l
		$pt_lowerarm_l.parent = $con_arm_2_l
		$pt_hand_l.parent = $con_arm_3_l
		-- try(
		-- 	myList = #("thumb_01","thumb_02","thumb_03",
		-- 		"index_01","index_02","index_03",
		-- 		"middle_01","middle_02","middle_03",
		-- 		"ring_01","ring_02","ring_03",
		-- 		"pinky_01","pinky_02","pinky_03")
		-- 	for i in myBoneList do makeConst "basic_pos" i i
		-- )catch()

		--arm right
		$pt_tw_arm_main_r.parent = myBipStruct.myClavicleR
		$line_arm_r.parent = myBip
		
		makeConst "pos_active" $con_arm_1_r myBipStruct.myUpperArmR
		$con_arm_2_r.parent = myBipStruct.myForeArmR
		$con_arm_3_r.parent = myBipStruct.myHandR
		
		makeConst "zero" $con_arm_2_r $con_arm_2_r
		makeConst "zero" $con_arm_3_r $con_arm_3_r		

		$pt_upperarm_r.parent = $con_arm_1_r
		$pt_lowerarm_r.parent = $con_arm_2_r
		$pt_hand_r.parent = $con_arm_3_r
		-- try(
		-- 	myBoneList = #($thumb_01_r,$thumb_02_r,$thumb_03_r,
		-- 		$index_01_r,$index_02_r,$index_03_r,
		-- 		$middle_01_r,$middle_02_r,$middle_03_r,
		-- 		$ring_01_r,$ring_02_r,$ring_03_r,
		-- 		$pinky_01_r,$pinky_02_r,$pinky_03_r)
		-- 	for i in myBoneList do makeConst "basic_pos" i i
		-- )catch()

		--leg left
		$pt_tw_leg_main_l.parent = myBipStruct.myBip
		$line_leg_l.parent = myBip
		$con_leg_2_l.parent = myBipStruct.myCalfL
		$pt_link_thigh_l.parent = $con_leg_1_l
		$pt_thigh_l.parent = $con_leg_1_l
		$pt_calf_l.parent = $con_leg_2_l

		makeConst "pos_active" $con_leg_1_l myBipStruct.myThighL
		makeConst "zero" $con_leg_2_l $con_leg_2_l
		makeConst "zero" $con_leg_3_l $con_leg_3_l
		try(makeConst "zero" $con_leg_4_l $con_leg_4_l)catch()
		makeConst "basic_pos" $ball_l $ball_l

		if myBipStruct.myHorseLinkL != undefined then
		(
			$con_leg_3_l.parent = myBipStruct.myHorseLinkL
			$con_leg_4_l.parent = myBipStruct.myFootL
			$pt_horseLink_l.parent = $con_leg_3_l
			$pt_foot_l.parent = $con_leg_4_l
		)else
		(
			$con_leg_3_l.parent = myBipStruct.myFootL
			$pt_foot_l.parent = $con_leg_3_l
		)	
		
		--leg right
		$pt_tw_leg_main_r.parent = myBipStruct.myBip
		$line_leg_r.parent = myBip
		$con_leg_2_r.parent = myBipStruct.myCalfR
		$pt_link_thigh_r.parent = $con_leg_1_r
		$pt_thigh_r.parent = $con_leg_1_r
		$pt_calf_r.parent = $con_leg_2_r

		makeConst "pos_active" $con_leg_1_r myBipStruct.myThighR
		makeConst "zero" $con_leg_2_r $con_leg_2_r
		makeConst "zero" $con_leg_3_r $con_leg_3_r
		try(makeConst "zero" $con_leg_4_r $con_leg_4_r)catch()
		makeConst "basic_pos" $ball_r $ball_r

		if myBipStruct.myHorseLinkR != undefined then
		(
			$con_leg_3_r.parent = myBipStruct.myHorseLinkR
			$con_leg_4_r.parent = myBipStruct.myFootR
			$pt_horseLink_r.parent = $con_leg_3_r
			$pt_foot_r.parent = $con_leg_4_r
		)else
		(
			$con_leg_3_r.parent = myBipStruct.myFootR
			$pt_foot_r.parent = $con_leg_3_r
		)
		
		--inherit scale off
		for i in myBoneStruct.myAllList do
		(
			if i != undefined do
			(
				setInheritanceFlags i #{1..6}
				i.boneEnable=false
			)
		)
		for i in myRigStruct.myBoneList do
		(
			try(i.boneEnable=false)catch()
		)

		-- weapon socket
		if $weapon_l != undefined then
		(
			$weapon_l.parent = $hand_l
			$weapon_r.parent = $hand_r
			$weapon_back_l.parent = $spine_04
			$weapon_back_r.parent = $spine_04
			$weapon_waist_l.parent = $pelvis
			$weapon_waist_r.parent = $pelvis
		)

		sliderTime = 0f
		$con_weapon_l.transform.controller.AddTarget myBipStruct.myHandL 0
		$con_weapon_r.transform.controller.AddTarget myBipStruct.myHandR 0

		$con_weapon_l.parent = myBipStruct.myBip
		$con_weapon_r.parent = myBipStruct.myBip
	)

--------------------------------------------------------------------------------------------------------
--layer-------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
	-- function
	fn getAllChildren obj &arr:#() =
	(
		for c in obj.children do
		(
			append arr c
			getAllChildren c arr:arr
		)
		arr
	)

	-- layer arrange
	fn layerArrange =
	(
		myTopLayer = LayerManager.getLayerFromName layer_name.selected
		if myTopLayer == undefined then
		(
			myLayer = LayerManager.newLayer()
			myLayer.setName layer_name.selected
		)

		--
		myLayerList = #("bip", "bip+", "bone", "bone_currective", "bone_export_ani", "bone_socket", "bone+", "pt", "line", "con_arm_leg", "con_socket", "geo")


		for i in myLayerList do
		(
			myLayer = LayerManager.getLayerFromName i
			if myLayer == undefined then
			(
				myLayer = LayerManager.newLayer()
				myLayer.setName i
			)
			
			if i == "geo" then
			(
				select geometry
				select (for i in selection where classOf i != BoneGeometry and classOf i != Biped_Object collect i)
				
				for i in selection do
				(
					myLayer.addnode i
				)
				clearSelection()
			)
			/*
			if i == "cut" then
			(
				try
				(
					select $*_cut
					for i in selection do
					(
						myLayer.addnode i
					)
					clearSelection()
				)catch()
			)
			*/
			if i == "bip" then
			(
				myList = myBipStruct.myAllList
				for j in myList do myLayer.addnode j
			)

			if i == "bip+" then
			(
				myFootsteps = execute("$"+bip_name.text+"Footsteps")
				myHeadNub = execute("$"+bip_name.text+"HeadNub")
				myLFinger0Nub = execute("$"+bip_name.text+"LFinger0Nub")
				myLFinger1Nub = execute("$"+bip_name.text+"LFinger1Nub")
				myLFinger2Nub = execute("$"+bip_name.text+"LFinger2Nub")
				myLFinger3Nub = execute("$"+bip_name.text+"LFinger3Nub")
				myLFinger4Nub = execute("$"+bip_name.text+"LFinger4Nub")
				myLToe0Nub = execute("$"+bip_name.text+"LToe0Nub")
				myRFinger0Nub = execute("$"+bip_name.text+"RFinger0Nub")
				myRFinger1Nub = execute("$"+bip_name.text+"RFinger1Nub")
				myRFinger2Nub = execute("$"+bip_name.text+"RFinger2Nub")
				myRFinger3Nub = execute("$"+bip_name.text+"RFinger3Nub")
				myRFinger4Nub = execute("$"+bip_name.text+"RFinger4Nub")
				myRToe0Nub = execute("$"+bip_name.text+"RToe0Nub")

				myList = #(myFootsteps,myHeadNub,
					myLFinger0Nub,myLFinger1Nub,myLFinger2Nub,myLFinger3Nub,myLFinger4Nub,myLToe0Nub,
					myRFinger0Nub,myRFinger1Nub,myRFinger2Nub,myRFinger3Nub,myRFinger4Nub,myRToe0Nub)
				try(for j in myList do myLayer.addnode j)catch()
			)

			if i == "bone_currective" then
			(
				if $root != undefined do
				(
					myLayer.addnode $root

					select (getAllChildren $root arr:(selection as array))
					for i in selection do myLayer.addnode i

					clearSelection()
				)
			)

			if i == "bone_export_ani" then
			(
				myList = #($root, $pelvis, $spine_01, $spine_02, $spine_03, $spine_04, $spine_05, $neck_01, $neck_02, $head,

					$clavicle_l, $upperarm_l, $lowerarm_l, $hand_l,
					$index_metacarpal_l, $index_01_l, $index_02_l, $index_03_l,
					$middle_metacarpal_l, $middle_01_l, $middle_02_l, $middle_03_l,
					$pinky_metacarpal_l, $pinky_01_l, $pinky_02_l, $pinky_03_l,
					$ring_metacarpal_l, $ring_01_l, $ring_02_l, $ring_03_l,
					$thumb_01_l, $thumb_02_l, $thumb_03_l,

					$clavicle_r, $upperarm_r, $lowerarm_r, $hand_r,
					$index_metacarpal_r, $index_01_r, $index_02_r, $index_03_r,
					$middle_metacarpal_r, $middle_01_r, $middle_02_r, $middle_03_r,
					$pinky_metacarpal_r, $pinky_01_r, $pinky_02_r, $pinky_03_r,
					$ring_metacarpal_r, $ring_01_r, $ring_02_r, $ring_03_r,
					$thumb_01_r, $thumb_02_r, $thumb_03_r,

					$thigh_l, $calf_l, $foot_l, $ball_l,
					$thigh_r, $calf_r, $foot_r, $ball_r
				)

				try
				(
					select myList
					for i in selection do myLayer.addnode i

					clearSelection()
				)catch()
			)

			if i == "bone_socket" then
			(
				myList = #($weapon_l, $weapon_r, $weapon_back_l, $weapon_back_r, $weapon_waist_l, $weapon_waist_r)

				try
				(
					select myList
					for i in selection do myLayer.addnode i

					clearSelection()
				)catch()
			)

			if i == "pt" then
			(
				select $pt_*
				for i in selection do myLayer.addnode i

				clearSelection()
			)

			if i == "line" then
			(
				select $line_*
				for i in selection do myLayer.addnode i

				clearSelection()
			)

			if i == "con_arm_leg" then
			(
				select $con_arm*
				for i in selection do myLayer.addnode i

				select $con_leg*
				for i in selection do myLayer.addnode i

				clearSelection()
			)

			if i == "con_socket" then
			(
				select $con_weapon_*
				for i in selection do myLayer.addnode i

				select $con_potion_*
				for i in selection do myLayer.addnode i

				select $con_shield_*
				for i in selection do myLayer.addnode i

				clearSelection()
			)

		)

		-- get layer
		myTopLayer = LayerManager.getLayerFromName layer_name.selected
		myBipLayer = LayerManager.getLayerFromName "bip"
		myBipPlusLayer = LayerManager.getLayerFromName "bip+"
		
		myBoneLayer = LayerManager.getLayerFromName "bone"
		myBoneExportAniLayer = LayerManager.getLayerFromName "bone_export_ani"
		myBoneCurrectiveLayer = LayerManager.getLayerFromName "bone_currective"

		myBonePlusLayer = LayerManager.getLayerFromName "bone+"
		myPTLayer = LayerManager.getLayerFromName "pt"
		myLineLayer = LayerManager.getLayerFromName "line"

		myConLayer = LayerManager.getLayerFromName "con_arm_leg"
		mySocketLayer = LayerManager.getLayerFromName "con_socket"

		myGeoLayer = LayerManager.getLayerFromName "geo"
		-- myCutLayer = LayerManager.getLayerFromName "cut"

		-- set parent
		myBipLayer.setParent myTopLayer
		myBipPlusLayer.setParent myTopLayer

		myBoneLayer.setParent myTopLayer
		-- myBoneExportLayer.setParent myBoneLayer
		myBoneExportAniLayer.setParent myBoneLayer
		myBoneCurrectiveLayer.setParent myBonePlusLayer
		myPTLayer.setParent myBonePlusLayer
		myLineLayer.setParent myBonePlusLayer

		myBonePlusLayer.setParent myTopLayer
		myConLayer.setParent myTopLayer
		mySocketLayer.setParent myTopLayer

		myGeoLayer.setParent myTopLayer
		-- myCutLayer.setParent myGeoLayer

		-- set layer property
		myBipLayer.boxmode = true
		myBipPlusLayer.on = false
		myBoneLayer.on = false
		myBonePlusLayer.on = false
		myConLayer.on = false

		-- remove empty layers
		-- macros.run "Scene Explorer" "SERemoveEmptyLayers"
	)

--------------------------------------------------------------------------------------------------------
--button-------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
	on YG_rigTool open do
	(
		gc()
		clearListener()
	
		--Rig
		bip_name.text = "Bip001"
		structExecute()
	
		--Layer
		layer_name.items = myTopLayerList
	)
	on btn_makeRootBone pressed do
	(
		undo on
		(
			myPoint = point()
		
			makeBone myPoint "root"
			$root.boneEnable=false
			
			delete myPoint
		)
	)
	on btn_openBoneTools pressed do
	(
		macros.run "Animation Tools" "BoneAdjustmentTools"
	)
	on btn_boneConnectToBonePT pressed do
	(
		undo on
		(
			makeBoneToBiped()
			boneConnectToBiped()
		)
	)
	on btn_layerArrange pressed do
	(
		undo on
		(
			layerArrange()
		)
	)
	on btn_namingTool pressed do
	(
		scripts = "Z:\\VindictusGFX\\Content\\tool\\max\\scripts\\YG_namingTool.ms"
		executeScriptFile scripts
	)
	on btn_boneMirror pressed do
	(
		for i=1 to selection.count do
		(
			myMirror = boneMirrorCopy selection[i]

			myMirrorBone = execute ("$"+ myMirror)

			myParent = selection[i].parent

			if i>1 do
			(
				myName = substituteString myParent.name "_l" "_r"

				myBone = execute ("$"+ myName)

				myMirrorBone.parent = myBone
			)			
		)
	)
)

createdialog YG_rigTool
