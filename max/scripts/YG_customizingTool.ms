/*
Customizing Tool
since 2019.10.10
last updated 2023.12.22
by YeonGyun,Jeong
lupinxyz@gmail.com
*/

struct limitStruct
(
	myMin = 0.8,
	myMax = 1.2
)
struct bipScale
(
	LClavicle=[1,1,1],
	LUpperArm=[1,1,1],
	LForeArm=[1,1,1],
	LHand=[1,1,1],
	LFinger0=[1,1,1],	LFinger01=[1,1,1],LFinger02=[1,1,1],
	LFinger1=[1,1,1],	LFinger11=[1,1,1],LFinger12=[1,1,1],
	LFinger2=[1,1,1],	LFinger21=[1,1,1],LFinger22=[1,1,1],
	LFinger3=[1,1,1],	LFinger31=[1,1,1],LFinger32=[1,1,1],
	LFinger4=[1,1,1],	LFinger41=[1,1,1],LFinger42=[1,1,1],
	LThigh=[1,1,1],
	LThighEdit=[1,1,1],
	LCalf=[1,1,1],
	LCalfEdit=[1,1,1],
	LFoot=[1,1,1],
	myThighDis=0,
	myThighDisEdit=0,
	myCalfDis=0,
	myCalfDisEdit=0,
	myCom=0,
	myComEdit=0,
	myThighComEdit=0,
	myCalfComEdit=0
)
myLimit = limitStruct()
myScale = bipScale()
myVersion = "v1.0"
myRange = [0.7, 1.3, 1]

try( destroydialog YG_customizingTool ) catch()

rollout YG_customizingTool ("YG_customizingTool " + myVersion) width:544 height:488
(
	edittext 'edt_name' "Name :" pos:[8,8] width:120 height:24 align:#left
	edittext 'edt_height' "Height : " pos:[136,8] width:120 height:24 align:#left
	edittext 'edt_heightChange' "---> " pos:[264,8] width:104 height:24 align:#left
	label 'lbl1' "Figure : " pos:[392,8] width:40 height:24 align:#left
	button 'btn_on' "ON" pos:[432,8] width:48 height:24 align:#left
	button 'btn_off' "OFF" pos:[488,8] width:48 height:24 align:#left

	GroupBox 'grp_all' "All" pos:[8,40] width:176 height:72 align:#left
	slider 'sld_body' "Body Volume" pos:[16,56] width:112 height:44 range:myRange align:#left
	button 'btn_body' "Reset" pos:[125,64] width:48 height:32 align:#left
	
	GroupBox 'grp_torso' "Torso" pos:[8,120] width:176 height:360 align:#left
	slider 'sld_head' "Head Volume" pos:[16,136] width:112 height:44 range:myRange align:#left
	button 'btn_head' "Reset" pos:[128,144] width:48 height:32 Enable:false align:#left
	slider 'sld_neck' "Neck Volume" pos:[16,184] width:112 height:44 range:myRange align:#left
	button 'btn_neck' "Reset" pos:[128,192] width:48 height:32 align:#left
	slider 'sld_breast' "Breast Volume" pos:[16,232] width:112 height:44 range:myRange align:#left
	button 'btn_breast' "Reset" pos:[128,240] width:48 height:32 align:#left
	slider 'sld_spine3' "Spine3 Volume" pos:[16,280] width:112 height:44 range:myRange align:#left
	button 'btn_spine3' "Reset" pos:[128,288] width:48 height:32 align:#left
	slider 'sld_spine2' "Spine2 Volume" pos:[16,328] width:112 height:44 range:myRange align:#left
	button 'btn_spine2' "Reset" pos:[128,336] width:48 height:32 align:#left
	slider 'sld_spine1' "Spine1 Volume" pos:[16,376] width:112 height:44 range:myRange align:#left
	button 'btn_spine1' "Reset" pos:[128,384] width:48 height:32 align:#left
	slider 'sld_pelvis' "Pelvis Volume" pos:[16,424] width:112 height:44 range:myRange align:#left
	button 'btn_pelvis' "Reset" pos:[128,432] width:48 height:32 align:#left

	GroupBox 'grp_arm' "Arm" pos:[192,40] width:344 height:216 align:#left
	slider 'sld_clavicle' "Clavicle Volume" pos:[200,56] width:112 height:44 range:myRange align:#left
	button 'btn_clavicle' "Reset" pos:[309,64] width:48 height:32 align:#left
	slider 'sld_clavicleLength' "Clavicle Length" pos:[368,56] width:112 height:44 range:myRange align:#left
	button 'btn_clavicleLength' "Reset" pos:[477,64] width:48 height:32 align:#left

	slider 'sld_upperArm' "UpperArm Volume" pos:[200,104] width:112 height:44 range:myRange align:#left
	button 'btn_upperArm' "Reset" pos:[309,112] width:48 height:32 align:#left
	slider 'sld_upperArmLength' "UpperArm Length" pos:[368,104] width:112 height:44 range:myRange align:#left
	button 'btn_upperArmLength' "Reset" pos:[477,112] width:48 height:32 align:#left
	
	slider 'sld_foreArm' "ForeArm Volume" pos:[200,152] width:112 height:44 range:myRange align:#left
	button 'btn_foreArm' "Reset" pos:[309,160] width:48 height:32 align:#left
	slider 'sld_foreArmLength' "ForeArm Length" pos:[368,152] width:112 height:44 range:myRange align:#left
	button 'btn_foreArmLength' "Reset" pos:[477,160] width:48 height:32 align:#left

	slider 'sld_hand' "Hand Volume" pos:[200,200] width:112 height:44 range:myRange align:#left
	button 'btn_hand' "Reset" pos:[309,208] width:48 height:32 align:#left

	GroupBox 'grpl_eg' "Leg" pos:[192,264] width:344 height:216 align:#left
	slider 'sld_hip' "Hip Volume" pos:[200,280] width:112 height:44 range:myRange align:#left
	button 'btn_hip' "Reset" pos:[309,288] width:48 height:32 align:#left
	slider 'sld_thigh' "Thigh Volume" pos:[200,328] width:112 height:44 range:myRange align:#left
	button 'btn_thigh' "Reset" pos:[309,336] width:48 height:32 align:#left
	slider 'sld_thighLength' "Thigh Length" pos:[368,328] width:112 height:44 range:myRange align:#left
	button 'btn_thighLength' "Reset" pos:[477,336] width:48 height:32 align:#left

	slider 'sld_calf' "Calf Volume" pos:[200,376] width:112 height:44 range:myRange align:#left
	button 'btn_calf' "Reset" pos:[309,384] width:48 height:32 align:#left
	slider 'sld_calfLength' "Calf Length" pos:[368,376] width:112 height:44 range:myRange align:#left
	button 'btn_calfLength' "Reset" pos:[477,384] width:48 height:32 align:#left

	slider 'sld_foot' "Foot Volume" pos:[200,424] width:112 height:44 range:myRange align:#left
	button 'btn_foot' "Reset" pos:[309,432] width:48 height:32 align:#left
	
	
	fn uiEnabled val =
	(
		myList = #(
			sld_head,btn_head,sld_neck,btn_neck,sld_breast,btn_breast,sld_spine3,btn_spine3,sld_spine2,btn_spine2,sld_spine1,btn_spine1,sld_pelvis,btn_pelvis,
			sld_clavicle,btn_clavicle,sld_clavicleLength,btn_clavicleLength,sld_upperArm,btn_upperArm,sld_upperArmLength,btn_upperArmLength,
			sld_foreArmLength,btn_foreArmLength,sld_foreArm,btn_foreArm,sld_hand,btn_hand,
			sld_hip,btn_hip,sld_thigh,btn_thigh,sld_thighLength,btn_calfLength,sld_calf,btn_calf,sld_calfLength,btn_calfLength,sld_foot,btn_foot,sld_body,btn_body
		)
		for i in myList do
		(
			i.enabled = val
		)
	)

	fn getBipTransform =
	(
		myScale.LThighEdit = biped.getTransform (execute("$"+edt_name.text+"LThigh")) #scale
		myScale.LCalfEdit = biped.getTransform (execute("$"+edt_name.text+"LCalf")) #scale

		myScale.myThighDisEdit = execute("$"+edt_name.text+"LThigh.transform.pos[3]") - execute("$"+edt_name.text+"LCalf.transform.pos[3]")
		myScale.myCalfDisEdit = execute("$"+edt_name.text+"LCalf.transform.pos[3]") - execute("$"+edt_name.text+"LFoot.transform.pos[3]")

		myBip = execute("$"+edt_name.text)
		myScale.myComEdit = biped.getTransform myBip #pos

		myScale.myThighComEdit = biped.getTransform myBip #pos
		myScale.myCalfComEdit = biped.getTransform myBip #pos
	)

	on YG_customizingTool open do
	(
		gc()
		clearListener()

		uiEnabled(False)
		edt_name.text = "Bip001"
		
		myScale = bipScale()
			
		myScale.LClavicle = biped.getTransform (execute("$"+edt_name.text+"LClavicle")) #scale
		myScale.LUpperArm = biped.getTransform (execute("$"+edt_name.text+"LUpperArm")) #scale
		myScale.LForearm = biped.getTransform (execute("$"+edt_name.text+"LForearm")) #scale
		myScale.LHand = biped.getTransform (execute("$"+edt_name.text+"LHand")) #scale
		myScale.LFinger0 = biped.getTransform (execute("$"+edt_name.text+"LFinger0")) #scale
		myScale.LFinger01 = biped.getTransform (execute("$"+edt_name.text+"LFinger01")) #scale
		myScale.LFinger02 = biped.getTransform (execute("$"+edt_name.text+"LFinger02")) #scale
		myScale.LFinger1 = biped.getTransform (execute("$"+edt_name.text+"LFinger1")) #scale
		myScale.LFinger11 = biped.getTransform (execute("$"+edt_name.text+"LFinger11")) #scale
		myScale.LFinger12 = biped.getTransform (execute("$"+edt_name.text+"LFinger12")) #scale
		myScale.LFinger2 = biped.getTransform (execute("$"+edt_name.text+"LFinger2")) #scale
		myScale.LFinger21 = biped.getTransform (execute("$"+edt_name.text+"LFinger21")) #scale
		myScale.LFinger22 = biped.getTransform (execute("$"+edt_name.text+"LFinger22")) #scale
		myScale.LFinger3 = biped.getTransform (execute("$"+edt_name.text+"LFinger3")) #scale
		myScale.LFinger31 = biped.getTransform (execute("$"+edt_name.text+"LFinger31")) #scale
		myScale.LFinger32 = biped.getTransform (execute("$"+edt_name.text+"LFinger32")) #scale
		myScale.LFinger4 = biped.getTransform (execute("$"+edt_name.text+"LFinger4")) #scale
		myScale.LFinger41 = biped.getTransform (execute("$"+edt_name.text+"LFinger41")) #scale
		myScale.LFinger42 = biped.getTransform (execute("$"+edt_name.text+"LFinger42")) #scale
		myScale.LThigh = biped.getTransform (execute("$"+edt_name.text+"LThigh")) #scale
		-- myScale.LThighEdit = biped.getTransform (execute("$"+edt_name.text+"LThigh")) #scale
		myScale.LCalf = biped.getTransform (execute("$"+edt_name.text+"LCalf")) #scale
		-- myScale.LCalfEdit = biped.getTransform (execute("$"+edt_name.text+"LCalf")) #scale
		myScale.LFoot = biped.getTransform (execute("$"+edt_name.text+"LFoot")) #scale
		myScale.myThighDis = execute("$"+edt_name.text+"LThigh.transform.pos[3]") - execute("$"+edt_name.text+"LCalf.transform.pos[3]")
		myScale.myCalfDis = execute("$"+edt_name.text+"LCalf.transform.pos[3]") - execute("$"+edt_name.text+"LFoot.transform.pos[3]")
		myBip = execute("$"+edt_name.text)
		myScale.myCom = biped.getTransform myBip #pos
		-- myScale.myComEdit = biped.getTransform myBip #pos

		getBipTransform()
	)
	on btn_on pressed do
	(
		myBip = execute ("$"+ edt_name.text)
		select myBip
		myBip.controller.figuremode = true
		edt_height.text = myBip.controller.height as string
		edt_heightChange.text = myBip.controller.height as string
		uiEnabled(True)
	)
	on btn_off pressed do
	(
		myBip = execute ("$"+ edt_name.text)
		select myBip
		myBip.controller.figuremode = false
		edt_height.text = myBip.controller.height as string
		uiEnabled(False)
	)
	on sld_head changed val do
	(
		$pt_head.scale = [val,val,val]
	)
	on btn_head pressed do
	(
		val = sld_head.value = 1
		$pt_head.scale = [val,val,val]
	)
	on sld_neck changed val do
	(
		$pt_neck_01.scale = [1,val,val]
	)
	on btn_neck pressed do
	(
		val = sld_neck.value = 1
		$pt_neck_01.scale = [val,val,val]
	)
	on sld_breast changed val do
	(
		-- val = sld_breast.value * $pt_link_breast.scale[1]
		-- $pt_breast_l.scale = [val,val,val]
		-- $pt_breast_r.scale = [val,val,val]
	)
	on btn_breast pressed do
	(
		sld_breast.value = 1
		-- val = $pt_link_breast.scale[1]
		-- $pt_breast_l.scale = [val,val,val]
		-- $pt_breast_r.scale = [val,val,val]
	)
	on sld_spine3 changed val do
	(
		$pt_spine_04.scale = [1,val,val]
		$pt_spine_05.scale = [1,val,val]
		--$pt_link_breast.scale = [val,val,val]
	)
	on btn_spine3 pressed do
	(
		val = sld_spine3.value = 1
		$pt_spine_04.scale = [val,val,val]
		$pt_spine_05.scale = [val,val,val]
		--$pt_link_breast.scale = [val,val,val]
	)
	on sld_spine2 changed val do
	(
		$pt_spine_03.scale = [1,val,val]
	)
	on btn_spine2 pressed do
	(
		val = sld_spine2.value = 1
		$pt_spine_03.scale = [val,val,val]
	)
	on sld_spine1 changed val do
	(
		$pt_spine_02.scale = [1,val,val]
	)
	on btn_spine1 pressed do
	(
		val = sld_spine1.value = 1
		$pt_spine_02.scale = [val,val,val]
	)
	on sld_pelvis changed val do
	(
		$pt_pelvis.scale = [1,val,val]
		$thigh_l.transform = $pt_thigh_l.transform
		--$pt_hip_l.scale = [val,val,val]
		--$pt_hip_r.scale = [val,val,val]
	)
	on btn_pelvis pressed do
	(
		val = sld_pelvis.value = 1
		$pt_pelvis.scale = [val,val,val]
		--$pt_hip_l.scale = [val,val,val]
		--$pt_hip_r.scale = [val,val,val]
	)
	on sld_clavicle changed val do
	(
		myLen = sld_clavicleLength.value
		$pt_clavicle_l.scale = [myLen,val,val]
		$pt_clavicle_r.scale = [myLen,val,val]
	)
	on btn_clavicle pressed do
	(
		val = sld_clavicle.value = 1
		myLen = sld_clavicleLength.value
		$pt_clavicle_l.scale = [myLen,val,val]
		$pt_clavicle_r.scale = [myLen,val,val]
	)
	on sld_clavicleLength changed val do
	(
		myList = #("LClavicle","RClavicle")
		for i in myList do
		(
			myBip = execute("$"+edt_name.text+i)
			biped.setTransform myBip #scale [myScale.LClavicle[1]*val, myScale.LClavicle[2], myScale.LClavicle[3]] false
		)
	)
	on btn_clavicleLength pressed do
	(
		val = sld_clavicleLength.value = 1
		myList = #("LClavicle","RClavicle")
		for i in myList do
		(
			myBip = execute("$"+edt_name.text+i)
			biped.setTransform myBip #scale [myScale.LClavicle[1]*val, myScale.LClavicle[2], myScale.LClavicle[3]] false
		)
	)
	on sld_upperArm changed val do
	(
		myLen = sld_upperArmLength.value
		$pt_upperarm_l.scale = [myLen,val,val]
		$pt_upperarm_r.scale = [myLen,val,val]
		--$arm_armor_l.scale = [val,val,val]
		--$arm_armor_r.scale = [val,val,val]
	)
	on btn_upperArm pressed do
	(
		val = sld_upperArm.value = 1
		myLen = sld_upperArmLength.value
		$pt_upperarm_l.scale = [myLen,val,val]
		$pt_upperarm_r.scale = [myLen,val,val]
		--$arm_armor_l.scale = [val,val,val]
		--$arm_armor_r.scale = [val,val,val]
	)
	on sld_upperArmLength changed val do
	(
		myList = #("LUpperArm","RUpperArm")
		for i in myList do
		(
			myBip = execute("$"+edt_name.text+i)
			biped.setTransform myBip #scale [myScale.LUpperArm[1]*val, myScale.LUpperArm[2], myScale.LUpperArm[3]] false
		)
	)
	on btn_upperArmLength pressed do
	(
		val = sld_upperArmLength.value = 1
		myList = #("LUpperArm","RUpperArm")
		for i in myList do
		(
			myBip = execute("$"+edt_name.text+i)
			biped.setTransform myBip #scale [myScale.LUpperArm[1]*val, myScale.LUpperArm[2], myScale.LUpperArm[3]] false
		)
	)
	on sld_foreArm changed val do
	(
		myLen = sld_foreArmLength.value
		$pt_lowerArm_l.scale = [myLen,val,val]
		$pt_lowerArm_r.scale = [myLen,val,val]
	)
	on btn_foreArm pressed do
	(
		val = sld_foreArm.value = 1
		myLen = sld_foreArmLength.value
		$pt_lowerArm_l.scale = [myLen,val,val]
		$pt_lowerArm_r.scale = [myLen,val,val]
	)
	on sld_foreArmLength changed val do
	(
		myList = #("LForeArm","RForeArm")
		for i in myList do
		(
			myBip = execute("$"+edt_name.text+i)
			biped.setTransform myBip #scale [myScale.LForeArm[1]*val, myScale.LForeArm[2], myScale.LForeArm[3]] false
		)
	)
	on btn_foreArmLength pressed do
	(
		val = sld_foreArmLength.value = 1
		myList = #("LForeArm","RForeArm")
		for i in myList do
		(
			myBip = execute("$"+edt_name.text+i)
			biped.setTransform myBip #scale [myScale.LForeArm[1]*val, myScale.LForeArm[2], myScale.LForeArm[3]] false
		)
	)
	on sld_hand changed val do
	(
		myList = #($pt_hand_l,$pt_thumb_01_l,$pt_thumb_02_l,$pt_thumb_03_l,
			$pt_index_01_l,$pt_index_02_l,$pt_index_03_l,$pt_middle_01_l,$pt_middle_02_l,$pt_middle_03_l,
			$pt_ring_01_l,$pt_ring_02_l,$pt_ring_03_l,$pt_pinky_01_l,$pt_pinky_02_l,$pt_pinky_03_l,
			$pt_hand_r,$pt_thumb_01_r,$pt_thumb_02_r,$pt_thumb_03_r,
			$pt_index_01_r,$pt_index_02_r,$pt_index_03_r,$pt_middle_01_r,$pt_middle_02_r,$pt_middle_03_r,
			$pt_ring_01_r,$pt_ring_02_r,$pt_ring_03_r,$pt_pinky_01_r,$pt_pinky_02_r,$pt_pinky_03_r)
		for i in myList do
		(
			i.scale = [val,val,val]
		)
		biped.setTransform (execute("$"+edt_name.text+"LHand")) #scale [myScale.LHand[1]*val, myScale.LHand[2]*val, myScale.LHand[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger0")) #scale [myScale.LFinger0[1]*val, myScale.LFinger0[2]*val, myScale.LFinger0[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger01")) #scale [myScale.LFinger01[1]*val, myScale.LFinger01[2]*val, myScale.LFinger01[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger02")) #scale [myScale.LFinger02[1]*val, myScale.LFinger02[2]*val, myScale.LFinger02[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger1")) #scale [myScale.LFinger1[1]*val, myScale.LFinger1[2]*val, myScale.LFinger1[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger11")) #scale [myScale.LFinger11[1]*val, myScale.LFinger11[2]*val, myScale.LFinger11[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger12")) #scale [myScale.LFinger12[1]*val, myScale.LFinger12[2]*val, myScale.LFinger12[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger2")) #scale [myScale.LFinger2[1]*val, myScale.LFinger2[2]*val, myScale.LFinger2[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger21")) #scale [myScale.LFinger21[1]*val, myScale.LFinger21[2]*val, myScale.LFinger21[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger22")) #scale [myScale.LFinger22[1]*val, myScale.LFinger22[2]*val, myScale.LFinger22[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger3")) #scale [myScale.LFinger3[1]*val, myScale.LFinger3[2]*val, myScale.LFinger3[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger31")) #scale [myScale.LFinger31[1]*val, myScale.LFinger31[2]*val, myScale.LFinger31[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger32")) #scale [myScale.LFinger32[1]*val, myScale.LFinger32[2]*val, myScale.LFinger32[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger4")) #scale [myScale.LFinger4[1]*val, myScale.LFinger4[2]*val, myScale.LFinger4[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger41")) #scale [myScale.LFinger41[1]*val, myScale.LFinger41[2]*val, myScale.LFinger41[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger42")) #scale [myScale.LFinger42[1]*val, myScale.LFinger42[2]*val, myScale.LFinger42[3]*val] false
		
		biped.setTransform (execute("$"+edt_name.text+"RHand")) #scale [myScale.LHand[1]*val, myScale.LHand[2]*val, myScale.LHand[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger0")) #scale [myScale.LFinger0[1]*val, myScale.LFinger0[2]*val, myScale.LFinger0[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger01")) #scale [myScale.LFinger01[1]*val, myScale.LFinger01[2]*val, myScale.LFinger01[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger02")) #scale [myScale.LFinger02[1]*val, myScale.LFinger02[2]*val, myScale.LFinger02[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger1")) #scale [myScale.LFinger1[1]*val, myScale.LFinger1[2]*val, myScale.LFinger1[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger11")) #scale [myScale.LFinger11[1]*val, myScale.LFinger11[2]*val, myScale.LFinger11[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger12")) #scale [myScale.LFinger12[1]*val, myScale.LFinger12[2]*val, myScale.LFinger12[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger2")) #scale [myScale.LFinger2[1]*val, myScale.LFinger2[2]*val, myScale.LFinger2[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger21")) #scale [myScale.LFinger21[1]*val, myScale.LFinger21[2]*val, myScale.LFinger21[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger22")) #scale [myScale.LFinger22[1]*val, myScale.LFinger22[2]*val, myScale.LFinger22[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger3")) #scale [myScale.LFinger3[1]*val, myScale.LFinger3[2]*val, myScale.LFinger3[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger31")) #scale [myScale.LFinger31[1]*val, myScale.LFinger31[2]*val, myScale.LFinger31[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger32")) #scale [myScale.LFinger32[1]*val, myScale.LFinger32[2]*val, myScale.LFinger32[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger4")) #scale [myScale.LFinger4[1]*val, myScale.LFinger4[2]*val, myScale.LFinger4[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger41")) #scale [myScale.LFinger41[1]*val, myScale.LFinger41[2]*val, myScale.LFinger41[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger42")) #scale [myScale.LFinger42[1]*val, myScale.LFinger42[2]*val, myScale.LFinger42[3]*val] false
	)
	on btn_hand pressed do
	(
		val = sld_hand.value = 1
		myList = #($pt_hand_l,$pt_thumb_01_l,$pt_thumb_02_l,$pt_thumb_03_l,
			$pt_index_01_l,$pt_index_02_l,$pt_index_03_l,$pt_middle_01_l,$pt_middle_02_l,$pt_middle_03_l,
			$pt_ring_01_l,$pt_ring_02_l,$pt_ring_03_l,$pt_pinky_01_l,$pt_pinky_02_l,$pt_pinky_03_l,
			$pt_hand_r,$pt_thumb_01_r,$pt_thumb_02_r,$pt_thumb_03_r,
			$pt_index_01_r,$pt_index_02_r,$pt_index_03_r,$pt_middle_01_r,$pt_middle_02_r,$pt_middle_03_r,
			$pt_ring_01_r,$pt_ring_02_r,$pt_ring_03_r,$pt_pinky_01_r,$pt_pinky_02_r,$pt_pinky_03_r)
		for i in myList do
		(
			i.scale = [val,val,val]
		)
		biped.setTransform (execute("$"+edt_name.text+"LHand")) #scale [myScale.LHand[1]*val, myScale.LHand[2]*val, myScale.LHand[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger0")) #scale [myScale.LFinger0[1]*val, myScale.LFinger0[2]*val, myScale.LFinger0[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger01")) #scale [myScale.LFinger01[1]*val, myScale.LFinger01[2]*val, myScale.LFinger01[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger02")) #scale [myScale.LFinger02[1]*val, myScale.LFinger02[2]*val, myScale.LFinger02[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger1")) #scale [myScale.LFinger1[1]*val, myScale.LFinger1[2]*val, myScale.LFinger1[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger11")) #scale [myScale.LFinger11[1]*val, myScale.LFinger11[2]*val, myScale.LFinger11[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger12")) #scale [myScale.LFinger12[1]*val, myScale.LFinger12[2]*val, myScale.LFinger12[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger2")) #scale [myScale.LFinger2[1]*val, myScale.LFinger2[2]*val, myScale.LFinger2[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger21")) #scale [myScale.LFinger21[1]*val, myScale.LFinger21[2]*val, myScale.LFinger21[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger22")) #scale [myScale.LFinger22[1]*val, myScale.LFinger22[2]*val, myScale.LFinger22[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger3")) #scale [myScale.LFinger3[1]*val, myScale.LFinger3[2]*val, myScale.LFinger3[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger31")) #scale [myScale.LFinger31[1]*val, myScale.LFinger31[2]*val, myScale.LFinger31[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger32")) #scale [myScale.LFinger32[1]*val, myScale.LFinger32[2]*val, myScale.LFinger32[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger4")) #scale [myScale.LFinger4[1]*val, myScale.LFinger4[2]*val, myScale.LFinger4[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger41")) #scale [myScale.LFinger41[1]*val, myScale.LFinger41[2]*val, myScale.LFinger41[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger42")) #scale [myScale.LFinger42[1]*val, myScale.LFinger42[2]*val, myScale.LFinger42[3]*val] false
		
		biped.setTransform (execute("$"+edt_name.text+"RHand")) #scale [myScale.LHand[1]*val, myScale.LHand[2]*val, myScale.LHand[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger0")) #scale [myScale.LFinger0[1]*val, myScale.LFinger0[2]*val, myScale.LFinger0[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger01")) #scale [myScale.LFinger01[1]*val, myScale.LFinger01[2]*val, myScale.LFinger01[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger02")) #scale [myScale.LFinger02[1]*val, myScale.LFinger02[2]*val, myScale.LFinger02[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger1")) #scale [myScale.LFinger1[1]*val, myScale.LFinger1[2]*val, myScale.LFinger1[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger11")) #scale [myScale.LFinger11[1]*val, myScale.LFinger11[2]*val, myScale.LFinger11[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger12")) #scale [myScale.LFinger12[1]*val, myScale.LFinger12[2]*val, myScale.LFinger12[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger2")) #scale [myScale.LFinger2[1]*val, myScale.LFinger2[2]*val, myScale.LFinger2[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger21")) #scale [myScale.LFinger21[1]*val, myScale.LFinger21[2]*val, myScale.LFinger21[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger22")) #scale [myScale.LFinger22[1]*val, myScale.LFinger22[2]*val, myScale.LFinger22[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger3")) #scale [myScale.LFinger3[1]*val, myScale.LFinger3[2]*val, myScale.LFinger3[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger31")) #scale [myScale.LFinger31[1]*val, myScale.LFinger31[2]*val, myScale.LFinger31[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger32")) #scale [myScale.LFinger32[1]*val, myScale.LFinger32[2]*val, myScale.LFinger32[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger4")) #scale [myScale.LFinger4[1]*val, myScale.LFinger4[2]*val, myScale.LFinger4[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger41")) #scale [myScale.LFinger41[1]*val, myScale.LFinger41[2]*val, myScale.LFinger41[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger42")) #scale [myScale.LFinger42[1]*val, myScale.LFinger42[2]*val, myScale.LFinger42[3]*val] false
	)
	on sld_hip changed val do
	(
		-- val = sld_hip.value * sld_pelvis.value
		-- $pt_hip_l.scale = [val,val,val]
		-- $pt_hip_r.scale = [val,val,val]
	)
	on btn_hip pressed do
	(
		sld_hip.value = 1
		-- val = sld_pelvis.value
		-- $pt_hip_l.scale = [val,val,val]
		-- $pt_hip_r.scale = [val,val,val]
	)
	on sld_thigh changed val do
	(
		myLen = sld_thighLength.value
		$pt_thigh_l.scale = [myLen,val,val]
		$pt_thigh_r.scale = [myLen,val,val]
	)
	on btn_thigh pressed do
	(
		val = sld_thigh.value = 1
		myLen = sld_thighLength.value
		$pt_thigh_l.scale = [myLen,val,val]
		$pt_thigh_r.scale = [myLen,val,val]
	)
	on sld_thighLength changed val do
	(
		myList = #("LThigh","RThigh")
		for i in myList do
		(
			myBip = execute("$"+edt_name.text+i)
			biped.setTransform myBip #scale [myScale.LThighEdit[1]*val, myScale.LThighEdit[2], myScale.LThighEdit[3]] false
		)
	
		myThigh = execute("$"+edt_name.text+"LThigh")
		myThighPos = biped.getTransform myThigh #pos
	
		myCalf = execute("$"+edt_name.text+"LCalf")
		myCalfPos = biped.getTransform myCalf #pos
	
		myDis = myThighPos[3] - myCalfPos[3]
	
		myBip = execute("$"+edt_name.text)
		myTrans = biped.getTransform myBip #pos

		myDist = myScale.myComEdit[3] + myDis - myScale.myThighDisEdit

		print("comEdit")
		print(myScale.myComEdit)
		print("calfComEdit")
		print(myScale.myCalfComEdit)

		if myScale.myComEdit != myScale.myCalfComEdit then
		(
			myDist = myScale.myCalfComEdit[3] + myDis - myScale.myThighDisEdit
		)

		biped.setTransform myBip #pos [myTrans[1], myTrans[2], myDist] false
		
		val = sld_thigh.value
		myLen = sld_thighLength.value
		$pt_thigh_l.scale = [myLen,val,val]
		$pt_thigh_r.scale = [myLen,val,val]

		myScale.myThighComEdit = biped.getTransform myBip #pos
	)
	on btn_thighLength pressed do
	(
		val = sld_thighLength.value = 1
		myList = #("LThigh","RThigh")
		for i in myList do
		(
			myBip = execute("$"+edt_name.text+i)
			biped.setTransform myBip #scale [myScale.LThighEdit[1]*val, myScale.LThighEdit[2], myScale.LThighEdit[3]] false
		)
	
		myBip = execute("$"+edt_name.text)
		myTrans = myScale.myComEdit
		-- if myScale.myComEdit != myScale.myCalfComEdit then
		-- (
		-- 	myTrans = myScale.myCalfComEdit
		-- )
		biped.setTransform myBip #pos [myTrans[1], myTrans[2], myTrans[3]] false
		
		val = sld_thigh.value
		myLen = sld_thighLength.value
		$pt_thigh_l.scale = [myLen,val,val]
		$pt_thigh_r.scale = [myLen,val,val]
	)
	on sld_calf changed val do
	(
		myLen = sld_calfLength.value
		$pt_calf_l.scale = [myLen,val,val]
		$pt_calf_r.scale = [myLen,val,val]
	)
	on btn_calf pressed do
	(
		val = sld_calf.value = 1
		myLen = sld_calfLength.value
		$pt_calf_l.scale = [myLen,val,val]
		$pt_calf_r.scale = [myLen,val,val]
	)
	on sld_calfLength changed val do
	(
		myList = #("LCalf","RCalf")
		for i in myList do
		(
			myBip = execute("$"+edt_name.text+i)
			biped.setTransform myBip #scale [myScale.LCalfEdit[1]*val, myScale.LCalfEdit[2], myScale.LCalfEdit[3]] false
		)
	
		myCalf = execute("$"+edt_name.text+"LCalf")
		myCalfPos = biped.getTransform myCalf #pos
	
		myFoot = execute("$"+edt_name.text+"LFoot")
		myFootPos = biped.getTransform myFoot #pos
	
		myDis = myCalfPos[3] - myFootPos[3]
	
		myBip = execute("$"+edt_name.text)
		myTrans = biped.getTransform myBip #pos

		myDist = myScale.myComEdit[3] + myDis - myScale.myCalfDisEdit
		if myScale.myComEdit != myScale.myThighComEdit then
		(
			myDist = myScale.myThighComEdit[3] + myDis - myScale.myCalfDisEdit
		)

		biped.setTransform myBip #pos [myTrans[1], myTrans[2], myDist] false
		
		val = sld_calf.value
		myLen = sld_calfLength.value
		$pt_calf_l.scale = [myLen,val,val]
		$pt_calf_r.scale = [myLen,val,val]

		myScale.myCalfComEdit = biped.getTransform myBip #pos
	)
	on btn_calfLength pressed do
	(
		val = sld_calfLength.value = 1
		myList = #("LCalf","RCalf")
		for i in myList do
		(
			myBip = execute("$"+edt_name.text+i)
			biped.setTransform myBip #scale [myScale.LCalfEdit[1]*val, myScale.LCalfEdit[2], myScale.LCalfEdit[3]] false
		)
	
		myBip = execute("$"+edt_name.text)
		myTrans = myScale.myComEdit
		-- if myScale.myComEdit != myScale.myThighComEdit then
		-- (
		-- 	myTrans = myScale.myThighComEdit
		-- )
		biped.setTransform myBip #pos [myTrans[1], myTrans[2], myTrans[3]] false
		
		val = sld_calf.value
		myLen = sld_calfLength.value
		$pt_calf_l.scale = [myLen,val,val]
		$pt_calf_r.scale = [myLen,val,val]
	)
	on sld_foot changed val do
	(
		$pt_foot_l.scale = [1,val,val]
		$pt_foot_r.scale = [1,val,val]
		$pt_ball_l.scale = [val,1,val]
		$pt_ball_r.scale = [val,1,val]
	)
	on btn_foot pressed do
	(
		val = sld_foot.value = 1
		$pt_foot_l.scale = [val,val,val]
		$pt_foot_r.scale = [val,val,val]
		$pt_ball_l.scale = [val,val,val]
		$pt_ball_r.scale = [val,val,val]
	)
	on sld_body changed val do
	(
		myHeight = edt_height.text as float
		myBip = execute ("$"+ edt_name.text)
	
		myBip.controller.height = myHeight * sld_body.value
		edt_heightChange.text = myBip.controller.height as string
		
		myScale.LThighEdit = [val,val,val]
		myScale.LCalfEdit = [val,val,val]
		myTrans = myScale.myCom
		myScale.myComEdit = [myTrans[1], myTrans[2], (biped.getTransform myBip #pos)[3]]
		
		sld_foot.value = val
		$pt_foot_l.scale = [val,val,val]
		$pt_foot_r.scale = [val,val,val]
		$pt_ball_l.scale = [val,val,val]
		$pt_ball_r.scale = [val,val,val]
		
		sld_calf.value = val
		$pt_calf_l.scale = [val,val,val]
		$pt_calf_r.scale = [val,val,val]
		
		sld_thigh.value = val
		$pt_thigh_l.scale = [val,val,val]
		$pt_thigh_r.scale = [val,val,val]
		
		sld_hip.value = val
		--$pt_hip_l.scale = [val,val,val]
		--$pt_hip_r.scale = [val,val,val]
		
		sld_hand.value = val
		myList = #($pt_hand_l,$pt_thumb_01_l,$pt_thumb_02_l,$pt_thumb_03_l,
			$pt_index_01_l,$pt_index_02_l,$pt_index_03_l,$pt_middle_01_l,$pt_middle_02_l,$pt_middle_03_l,
			$pt_ring_01_l,$pt_ring_02_l,$pt_ring_03_l,$pt_pinky_01_l,$pt_pinky_02_l,$pt_pinky_03_l,
			$pt_hand_r,$pt_thumb_01_r,$pt_thumb_02_r,$pt_thumb_03_r,
			$pt_index_01_r,$pt_index_02_r,$pt_index_03_r,$pt_middle_01_r,$pt_middle_02_r,$pt_middle_03_r,
			$pt_ring_01_r,$pt_ring_02_r,$pt_ring_03_r,$pt_pinky_01_r,$pt_pinky_02_r,$pt_pinky_03_r)
		for i in myList do
		(
			i.scale = [val,val,val]
		)
		biped.setTransform (execute("$"+edt_name.text+"LHand")) #scale [myScale.LHand[1]*val, myScale.LHand[2]*val, myScale.LHand[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger0")) #scale [myScale.LFinger0[1]*val, myScale.LFinger0[2]*val, myScale.LFinger0[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger01")) #scale [myScale.LFinger01[1]*val, myScale.LFinger01[2]*val, myScale.LFinger01[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger02")) #scale [myScale.LFinger02[1]*val, myScale.LFinger02[2]*val, myScale.LFinger02[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger1")) #scale [myScale.LFinger1[1]*val, myScale.LFinger1[2]*val, myScale.LFinger1[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger11")) #scale [myScale.LFinger11[1]*val, myScale.LFinger11[2]*val, myScale.LFinger11[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger12")) #scale [myScale.LFinger12[1]*val, myScale.LFinger12[2]*val, myScale.LFinger12[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger2")) #scale [myScale.LFinger2[1]*val, myScale.LFinger2[2]*val, myScale.LFinger2[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger21")) #scale [myScale.LFinger21[1]*val, myScale.LFinger21[2]*val, myScale.LFinger21[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger22")) #scale [myScale.LFinger22[1]*val, myScale.LFinger22[2]*val, myScale.LFinger22[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger3")) #scale [myScale.LFinger3[1]*val, myScale.LFinger3[2]*val, myScale.LFinger3[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger31")) #scale [myScale.LFinger31[1]*val, myScale.LFinger31[2]*val, myScale.LFinger31[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger32")) #scale [myScale.LFinger32[1]*val, myScale.LFinger32[2]*val, myScale.LFinger32[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger4")) #scale [myScale.LFinger4[1]*val, myScale.LFinger4[2]*val, myScale.LFinger4[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger41")) #scale [myScale.LFinger41[1]*val, myScale.LFinger41[2]*val, myScale.LFinger41[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger42")) #scale [myScale.LFinger42[1]*val, myScale.LFinger42[2]*val, myScale.LFinger42[3]*val] false
		
		biped.setTransform (execute("$"+edt_name.text+"RHand")) #scale [myScale.LHand[1]*val, myScale.LHand[2]*val, myScale.LHand[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger0")) #scale [myScale.LFinger0[1]*val, myScale.LFinger0[2]*val, myScale.LFinger0[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger01")) #scale [myScale.LFinger01[1]*val, myScale.LFinger01[2]*val, myScale.LFinger01[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger02")) #scale [myScale.LFinger02[1]*val, myScale.LFinger02[2]*val, myScale.LFinger02[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger1")) #scale [myScale.LFinger1[1]*val, myScale.LFinger1[2]*val, myScale.LFinger1[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger11")) #scale [myScale.LFinger11[1]*val, myScale.LFinger11[2]*val, myScale.LFinger11[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger12")) #scale [myScale.LFinger12[1]*val, myScale.LFinger12[2]*val, myScale.LFinger12[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger2")) #scale [myScale.LFinger2[1]*val, myScale.LFinger2[2]*val, myScale.LFinger2[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger21")) #scale [myScale.LFinger21[1]*val, myScale.LFinger21[2]*val, myScale.LFinger21[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger22")) #scale [myScale.LFinger22[1]*val, myScale.LFinger22[2]*val, myScale.LFinger22[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger3")) #scale [myScale.LFinger3[1]*val, myScale.LFinger3[2]*val, myScale.LFinger3[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger31")) #scale [myScale.LFinger31[1]*val, myScale.LFinger31[2]*val, myScale.LFinger31[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger32")) #scale [myScale.LFinger32[1]*val, myScale.LFinger32[2]*val, myScale.LFinger32[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger4")) #scale [myScale.LFinger4[1]*val, myScale.LFinger4[2]*val, myScale.LFinger4[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger41")) #scale [myScale.LFinger41[1]*val, myScale.LFinger41[2]*val, myScale.LFinger41[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger42")) #scale [myScale.LFinger42[1]*val, myScale.LFinger42[2]*val, myScale.LFinger42[3]*val] false
		
		sld_foreArm.value = val
		myLen = sld_foreArmLength.value
		$pt_lowerArm_l.scale = [myLen,val,val]
		$pt_lowerArm_r.scale = [myLen,val,val]
		
		sld_upperArm.value = val
		myLen = sld_upperArmLength.value
		$pt_upperarm_l.scale = [myLen,val,val]
		$pt_upperarm_r.scale = [myLen,val,val]
		
		sld_clavicle.value = val
		myLen = sld_clavicleLength.value
		$pt_clavicle_l.scale = [myLen,val,val]
		$pt_clavicle_r.scale = [myLen,val,val]
		
		sld_pelvis.value = val
		$pt_pelvis.scale = [1,val,val]
		$thigh_l.transform = $pt_thigh_l.transform
		
		sld_spine1.value = val
		$pt_spine_02.scale = [1,val,val]
		
		sld_spine2.value = val
		$pt_spine_03.scale = [1,val,val]
		
		sld_spine3.value = val
		$pt_spine_04.scale = [1,val,val]
		$pt_spine_05.scale = [1,val,val]
		--$pt_link_breast.scale = [val,val,val]
		
		sld_breast.value = val
		--$pt_breast_l.scale = [val * $pt_link_breast.scale[1],val * $pt_link_breast.scale[2],val * $pt_link_breast.scale[3]]
		--$pt_breast_r.scale = [val * $pt_link_breast.scale[1],val * $pt_link_breast.scale[2],val * $pt_link_breast.scale[3]]
		
		sld_neck.value = val
		$pt_neck_01.scale = [1,val,val]
		
		sld_head.value = val
		$pt_head.scale = [val,val,val]

		getBipTransform()

		-- print(myScale.myComEdit)
	)
	on btn_body pressed do
	(
		myHeight = edt_height.text as float
		myBip = execute ("$"+ edt_name.text)
		sld_body.value = 1
	
		myBip.controller.height = myHeight * sld_body.value
		edt_heightChange.text = myBip.controller.height as string
		
		myScale.LThighEdit = [myScale.LThigh[1],myScale.LThigh[2],myScale.LThigh[3]]
		myScale.LCalfEdit = [myScale.LCalf[1],myScale.LCalf[2],myScale.LCalf[3]]
		myTrans = myScale.myCom
		myScale.myComEdit = [myTrans[1], myTrans[2], myTrans[3]]
		
		val = sld_foot.value = 1
		$pt_foot_l.scale = [val,val,val]
		$pt_foot_r.scale = [val,val,val]
		$pt_ball_l.scale = [val,val,val]
		$pt_ball_r.scale = [val,val,val]
		
		val = sld_calf.value = 1
		myLen = sld_calfLength.value
		$pt_calf_l.scale = [myLen,val,val]
		$pt_calf_r.scale = [myLen,val,val]
		
		val = sld_thigh.value = 1
		myLen = sld_thighLength.value
		$pt_thigh_l.scale = [myLen,val,val]
		$pt_thigh_r.scale = [myLen,val,val]
		
		val = sld_hip.value = 1
		--$pt_hip_l.scale = [val,val,val]
		--$pt_hip_r.scale = [val,val,val]
		
		val = sld_hand.value = 1
		myList = #($pt_hand_l,$pt_thumb_01_l,$pt_thumb_02_l,$pt_thumb_03_l,
			$pt_index_01_l,$pt_index_02_l,$pt_index_03_l,$pt_middle_01_l,$pt_middle_02_l,$pt_middle_03_l,
			$pt_ring_01_l,$pt_ring_02_l,$pt_ring_03_l,$pt_pinky_01_l,$pt_pinky_02_l,$pt_pinky_03_l,
			$pt_hand_r,$pt_thumb_01_r,$pt_thumb_02_r,$pt_thumb_03_r,
			$pt_index_01_r,$pt_index_02_r,$pt_index_03_r,$pt_middle_01_r,$pt_middle_02_r,$pt_middle_03_r,
			$pt_ring_01_r,$pt_ring_02_r,$pt_ring_03_r,$pt_pinky_01_r,$pt_pinky_02_r,$pt_pinky_03_r)
		for i in myList do
		(
			i.scale = [val,val,val]
		)
		biped.setTransform (execute("$"+edt_name.text+"LHand")) #scale [myScale.LHand[1]*val, myScale.LHand[2]*val, myScale.LHand[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger0")) #scale [myScale.LFinger0[1]*val, myScale.LFinger0[2]*val, myScale.LFinger0[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger01")) #scale [myScale.LFinger01[1]*val, myScale.LFinger01[2]*val, myScale.LFinger01[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger02")) #scale [myScale.LFinger02[1]*val, myScale.LFinger02[2]*val, myScale.LFinger02[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger1")) #scale [myScale.LFinger1[1]*val, myScale.LFinger1[2]*val, myScale.LFinger1[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger11")) #scale [myScale.LFinger11[1]*val, myScale.LFinger11[2]*val, myScale.LFinger11[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger12")) #scale [myScale.LFinger12[1]*val, myScale.LFinger12[2]*val, myScale.LFinger12[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger2")) #scale [myScale.LFinger2[1]*val, myScale.LFinger2[2]*val, myScale.LFinger2[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger21")) #scale [myScale.LFinger21[1]*val, myScale.LFinger21[2]*val, myScale.LFinger21[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger22")) #scale [myScale.LFinger22[1]*val, myScale.LFinger22[2]*val, myScale.LFinger22[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger3")) #scale [myScale.LFinger3[1]*val, myScale.LFinger3[2]*val, myScale.LFinger3[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger31")) #scale [myScale.LFinger31[1]*val, myScale.LFinger31[2]*val, myScale.LFinger31[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger32")) #scale [myScale.LFinger32[1]*val, myScale.LFinger32[2]*val, myScale.LFinger32[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger4")) #scale [myScale.LFinger4[1]*val, myScale.LFinger4[2]*val, myScale.LFinger4[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger41")) #scale [myScale.LFinger41[1]*val, myScale.LFinger41[2]*val, myScale.LFinger41[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"LFinger42")) #scale [myScale.LFinger42[1]*val, myScale.LFinger42[2]*val, myScale.LFinger42[3]*val] false
		
		biped.setTransform (execute("$"+edt_name.text+"RHand")) #scale [myScale.LHand[1]*val, myScale.LHand[2]*val, myScale.LHand[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger0")) #scale [myScale.LFinger0[1]*val, myScale.LFinger0[2]*val, myScale.LFinger0[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger01")) #scale [myScale.LFinger01[1]*val, myScale.LFinger01[2]*val, myScale.LFinger01[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger02")) #scale [myScale.LFinger02[1]*val, myScale.LFinger02[2]*val, myScale.LFinger02[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger1")) #scale [myScale.LFinger1[1]*val, myScale.LFinger1[2]*val, myScale.LFinger1[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger11")) #scale [myScale.LFinger11[1]*val, myScale.LFinger11[2]*val, myScale.LFinger11[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger12")) #scale [myScale.LFinger12[1]*val, myScale.LFinger12[2]*val, myScale.LFinger12[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger2")) #scale [myScale.LFinger2[1]*val, myScale.LFinger2[2]*val, myScale.LFinger2[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger21")) #scale [myScale.LFinger21[1]*val, myScale.LFinger21[2]*val, myScale.LFinger21[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger22")) #scale [myScale.LFinger22[1]*val, myScale.LFinger22[2]*val, myScale.LFinger22[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger3")) #scale [myScale.LFinger3[1]*val, myScale.LFinger3[2]*val, myScale.LFinger3[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger31")) #scale [myScale.LFinger31[1]*val, myScale.LFinger31[2]*val, myScale.LFinger31[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger32")) #scale [myScale.LFinger32[1]*val, myScale.LFinger32[2]*val, myScale.LFinger32[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger4")) #scale [myScale.LFinger4[1]*val, myScale.LFinger4[2]*val, myScale.LFinger4[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger41")) #scale [myScale.LFinger41[1]*val, myScale.LFinger41[2]*val, myScale.LFinger41[3]*val] false
		biped.setTransform (execute("$"+edt_name.text+"RFinger42")) #scale [myScale.LFinger42[1]*val, myScale.LFinger42[2]*val, myScale.LFinger42[3]*val] false
		
		val = sld_foreArm.value = 1
		myLen = sld_foreArmLength.value
		$pt_lowerArm_l.scale = [myLen,val,val]
		$pt_lowerArm_r.scale = [myLen,val,val]
		
		val = sld_upperArm.value = 1
		myLen = sld_upperArmLength.value
		$pt_upperarm_l.scale = [myLen,val,val]
		$pt_upperarm_r.scale = [myLen,val,val]
		
		val = sld_clavicle.value = 1
		myLen = sld_clavicleLength.value
		$pt_clavicle_l.scale = [myLen,val,val]
		$pt_clavicle_r.scale = [myLen,val,val]
		
		val = sld_pelvis.value = 1
		$pt_pelvis.scale = [val,val,val]
		
		val = sld_spine1.value = 1
		$pt_spine_02.scale = [val,val,val]
		
		val = sld_spine2.value = 1
		$pt_spine_03.scale = [val,val,val]
		
		val = sld_spine3.value = 1
		$pt_spine_04.scale = [val,val,val]
		$pt_spine_05.scale = [val,val,val]
		--$pt_link_breast.scale = [val,val,val]
		
		val = sld_breast.value = 1
		--$pt_breast_l.scale = [val,val,val]
		--$pt_breast_r.scale = [val,val,val]
		
		val = sld_neck.value = 1
		$pt_neck_01.scale = [val,val,val]
		
		val = sld_head.value = 1
		$pt_head.scale = [val,val,val]

		getBipTransform()

		print(myScale.myCom)
	)
)
createdialog YG_customizingTool
