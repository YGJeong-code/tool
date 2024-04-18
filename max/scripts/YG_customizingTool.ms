/*
Customizing Tool
since 2019.10.10
last updated 2024.04.16
by YeonGyun,Jeong
lupinxyz@gmail.com
*/

(
	
	struct bipScale
	(
		Neck=[1,1,1],
		Spine3=[1,1,1],
		Spine2=[1,1,1],
		Spine1=[1,1,1],
		Spine=[1,1,1],
		Pelvis=[1,1,1],
		LClavicle=[1,1,1],
		LUpperArm=[1,1,1],
		LForeArm=[1,1,1],
		LHand=[1,1,1],
		LFinger0=[1,1,1], LFinger01=[1,1,1], LFinger02=[1,1,1],
		LFinger1=[1,1,1], LFinger11=[1,1,1], LFinger12=[1,1,1],
		LFinger2=[1,1,1], LFinger21=[1,1,1], LFinger22=[1,1,1],
		LFinger3=[1,1,1], LFinger31=[1,1,1], LFinger32=[1,1,1],
		LFinger4=[1,1,1], LFinger41=[1,1,1], LFinger42=[1,1,1],
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
	
	myScale = bipScale()
	myVersion = "v2.0"
	myRange = [0.7, 1.3, 1]

	global theNewFloater
	global rollout_character
	global rollout_length
	global rollout_volume

	try (closeRolloutFloater theNewFloater) catch ()

	rollout rollout_character "Character" width:520 height:40
	(
		edittext 'edt_name' "Name :" pos:[8,8] width:110 height:24 align:#left
		edittext 'edt_height' "Height : " pos:[128,8] width:120 height:24 align:#left
		edittext 'edt_heightChange' "---> " pos:[256,8] width:104 height:24 align:#left
		label 'lbl1' "Figure : " pos:[368,8] width:40 height:24 align:#left
		button 'btn_on' "ON" pos:[408,8] width:48 height:24 align:#left
		button 'btn_off' "OFF" pos:[464,8] width:48 height:24 align:#left

		on btn_on pressed do
		(
			myBip = execute ("$"+ edt_name.text)
			select myBip
			myBip.controller.figuremode = true

			edt_height.text = myBip.controller.height as string
			edt_heightChange.text = myBip.controller.height as string

			rollout_length.uiEnabled(True)
			rollout_volume.uiEnabled(True)
		)
		on btn_off pressed do
		(
			myBip = execute ("$"+ edt_name.text)
			select myBip
			myBip.controller.figuremode = false

			edt_height.text = myBip.controller.height as string

			rollout_length.uiEnabled(False)
			rollout_volume.uiEnabled(False)
		)
	)
	
	rollout rollout_length "Length" width:520 height:600
	(
		GroupBox 'grp_all' "All" pos:[8,8] width:248 height:120 align:#left
		slider 'sld_height' "00 Body Height" pos:[16,24] width:112 height:44 range:myRange align:#left
		spinner 'spn_height' "" pos:[128,40] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_height' "All\nReset" pos:[200,28] width:48 height:40 align:#left

		button 'btn_210' "210" pos:[40,80] width:30 height:20 align:#left
		button 'btn_200' "200" pos:[72,80] width:30 height:20 align:#left
		button 'btn_195' "195" pos:[104,80] width:30 height:20 align:#left
		button 'btn_190' "190" pos:[136,80] width:30 height:20 align:#left
		button 'btn_185' "185" pos:[168,80] width:30 height:20 align:#left
		button 'btn_180' "180" pos:[72,104] width:30 height:20 align:#left
		button 'btn_175' "175" pos:[104,104] width:30 height:20 align:#left
		button 'btn_170' "170" pos:[136,104] width:30 height:20 align:#left
		button 'btn_165' "165" pos:[168,104] width:30 height:20 align:#left
		button 'btn_160' "160" pos:[200,104] width:30 height:20 align:#left

		GroupBox 'grp_torso' "Torso" pos:[8,136] width:248 height:260 align:#left
		slider 'sld_head_length' "01 Head Length" pos:[16,152] width:112 height:44 range:myRange align:#left
		spinner 'spn_head_length' "" pos:[128,168] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_head_length' "Reset" pos:[200,160] width:48 height:32 Enable:false align:#left

		slider 'sld_neck_length' "02 Neck Length" pos:[16,200] width:112 height:44 range:myRange align:#left
		spinner 'spn_neck_length' "" pos:[128,216] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_neck_length' "Reset" pos:[200,208] width:48 height:32 align:#left

		slider 'sld_chest_length' "03 Chest Length" pos:[16,248] width:112 height:44 range:myRange align:#left
		spinner 'spn_chest_length' "" pos:[128,264] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_chest_length' "Reset" pos:[200,256] width:48 height:32 align:#left

		slider 'sld_waist_length' "04 Waist Length" pos:[16,296] width:112 height:44 range:myRange align:#left
		spinner 'spn_waist_length' "" pos:[128,312] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_waist_length' "Reset" pos:[200,304] width:48 height:32 align:#left

		slider 'sld_pelvis_length' "05 Pelvis Length" pos:[16,344] width:112 height:44 range:myRange align:#left
		spinner 'spn_pelvis_length' "" pos:[128,360] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_pelvis_length' "Reset" pos:[200,352] width:48 height:32 align:#left
	
		GroupBox 'grp_arm' "Arm" pos:[264,8] width:248 height:216 align:#left
		slider 'sld_clavicle_length' "06 Clavicle Length" pos:[272,24] width:112 height:44 range:myRange align:#left
		spinner 'spn_clavicle_length' "" pos:[384,40] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_clavicle_length' "Reset" pos:[456,32] width:48 height:32 align:#left

		slider 'sld_upperarm_length' "07 Upperarm Length" pos:[272,72] width:112 height:44 range:myRange align:#left
		spinner 'spn_upperarm_length' "" pos:[384,88] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_upperarm_length' "Reset" pos:[456,80] width:48 height:32 align:#left

		slider 'sld_lowerarm_length' "08 Lowerarm Length" pos:[272,120] width:112 height:44 range:myRange align:#left
		spinner 'spn_lowerarm_length' "" pos:[384,136] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_lowerarm_length' "Reset" pos:[456,128] width:48 height:32 align:#left
	
		slider 'sld_hand_length' "09 Hand Length" pos:[272,168] width:112 height:44 range:myRange align:#left
		spinner 'spn_hand_length' "" pos:[384,184] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_hand_length' "Reset" pos:[456,176] width:48 height:32 align:#left
	
		GroupBox 'grp_leg' "Leg" pos:[264,236] width:248 height:160 align:#left
		slider 'sld_thigh_length' "10 Thigh Length" pos:[272,248] width:112 height:44 range:myRange align:#left
		spinner 'spn_thigh_length' "" pos:[384,264] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_thigh_length' "Reset" pos:[456,256] width:48 height:32 align:#left

		slider 'sld_calf_length' "11 Calf Length" pos:[272,296] width:112 height:44 range:myRange align:#left
		spinner 'spn_calf_length' "" pos:[384,312] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_calf_length' "Reset" pos:[456,304] width:48 height:32 align:#left
	
		slider 'sld_foot_length' "12 Foot" pos:[272,344] width:112 height:44 range:myRange align:#left
		spinner 'spn_foot_length' "" pos:[384,360] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_foot_length' "Reset" pos:[456,352] width:48 height:32 align:#left
		
		/*----------------------------------------------------------------------------------------------------
		function
		*/----------------------------------------------------------------------------------------------------
		fn uiEnabled val =
		(
			myList = #(
				sld_head_length, btn_head_length,
				sld_neck_length, btn_neck_length,
				sld_chest_length, btn_chest_length,
				sld_waist_length, btn_waist_length,
				sld_pelvis_length, btn_pelvis_length,
				sld_clavicle_length, btn_clavicle_length,
				sld_upperarm_length, btn_upperarm_length,
				sld_lowerarm_length, btn_lowerarm_length,
				sld_hand_length, btn_hand_length,
				sld_thigh_length, btn_thigh_length,
				sld_calf_length, btn_calf_length,
				sld_foot_length, btn_foot_length,
				sld_height, btn_height
			)
			for i in myList do
			(
				i.enabled = val
			)
		)
		fn getBipTransform =
		(
			myBip = rollout_character.edt_name.text

			myScale.LThighEdit = biped.getTransform (execute("$"+myBip+"LThigh")) #scale
			myScale.LCalfEdit = biped.getTransform (execute("$"+myBip+"LCalf")) #scale

			myScale.myThighDisEdit = execute("$"+myBip+"LThigh.transform.pos[3]") - execute("$"+myBip+"LCalf.transform.pos[3]")
			myScale.myCalfDisEdit = execute("$"+myBip+"LCalf.transform.pos[3]") - execute("$"+myBip+"LFoot.transform.pos[3]")

			myBip = execute("$"+myBip)
			myScale.myComEdit = biped.getTransform myBip #pos

			myScale.myThighComEdit = biped.getTransform myBip #pos
			myScale.myCalfComEdit = biped.getTransform myBip #pos
		)
		fn bodyHeight val =
		(
			-- height
			myHeight = rollout_character.edt_height.text as float

			-- bip
			myBip = execute ("$"+ rollout_character.edt_name.text)
			
			-- edit height
			myBip.controller.height = myHeight * sld_height.value
			rollout_character.edt_heightChange.text = myBip.controller.height as string			

			-- com
			myTrans = myScale.myCom

			-- edit com
			myScale.myComEdit = [myTrans[1], myTrans[2], (biped.getTransform myBip #pos)[3]]
			
			-- foot, ball
			$pt_foot_l.scale = [val, val, val]
			$pt_foot_r.scale = [val, val, val]
			$pt_ball_l.scale = [val, val, val]
			$pt_ball_r.scale = [val, val, val]
			
			-- calf
			myVol = rollout_volume.sld_body.value * rollout_volume.sld_calf_volume.value * val --calf volume
			$pt_calf_l.scale = [val, myVol, myVol]
			$pt_calf_r.scale = [val, myVol, myVol]

			-- thigh
			$pt_thigh_l.scale = [val, val, val]
			$pt_thigh_r.scale = [val, val, val]

			myVol = rollout_volume.sld_body.value * rollout_volume.sld_thigh_volume.value * val --thigh volume
			$thigh_twist_01_l.scale = [val, myVol, myVol]
			$thigh_twist_02_l.scale = [val, myVol, myVol]
			$thigh_twist_01_r.scale = [val, myVol, myVol]
			$thigh_twist_02_r.scale = [val, myVol, myVol]			
			
			-- hand
			myList = #($pt_hand_l,$pt_thumb_01_l,$pt_thumb_02_l,$pt_thumb_03_l,
				$pt_index_01_l,$pt_index_02_l,$pt_index_03_l,$pt_middle_01_l,$pt_middle_02_l,$pt_middle_03_l,
				$pt_ring_01_l,$pt_ring_02_l,$pt_ring_03_l,$pt_pinky_01_l,$pt_pinky_02_l,$pt_pinky_03_l,
				$pt_hand_r,$pt_thumb_01_r,$pt_thumb_02_r,$pt_thumb_03_r,
				$pt_index_01_r,$pt_index_02_r,$pt_index_03_r,$pt_middle_01_r,$pt_middle_02_r,$pt_middle_03_r,
				$pt_ring_01_r,$pt_ring_02_r,$pt_ring_03_r,$pt_pinky_01_r,$pt_pinky_02_r,$pt_pinky_03_r)
			
			myLen = spn_height.value * spn_hand_length.value
			for i in myList do
			(
				i.scale = [val,val,myLen]
			)
			
			-- lowerarm
			myVol = rollout_volume.sld_body.value * rollout_volume.sld_lowerarm_volume.value * val --lowerarm volume
			$pt_lowerArm_l.scale = [val, myVol, myVol]
			$pt_lowerArm_r.scale = [val, myVol, myVol]

			-- upperarm
			$pt_upperarm_l.scale = [val, val, val]
			$pt_upperarm_r.scale = [val, val, val]

			-- clavicle
			myVol = rollout_volume.sld_body.value * rollout_volume.sld_trapezoidal_volume.value * val --neck volume
			$pt_clavicle_l.scale = [val, myVol, myVol]
			$pt_clavicle_r.scale = [val, myVol, myVol]
			
			-- pelvis
			$pt_pelvis.scale = [val, val, val]

			-- waist
			myVol = rollout_volume.sld_body.value * rollout_volume.sld_waist_volume.value * val --waist volume
			$pt_spine_02.scale = [val, myVol, myVol]
			$pt_spine_03.scale = [val, val, val]

			-- chest
			myVol = rollout_volume.sld_body.value * rollout_volume.sld_chest_volume.value * val --chest volume
			$pt_spine_04.scale = [val, myVol, myVol]
			$pt_spine_05.scale = [val, myVol, myVol]

			-- neck, head
			$pt_neck_01.scale = [sld_neck_length.value * val, val, val]
			$pt_head.scale = [sld_head_length.value * val, sld_head_length.value * val, sld_head_length.value * val]
			
			-- save edit
			getBipTransform()
		)
		fn btn_bodyHeight val =
		(
			sld_height.value = spn_height.value = val
			bodyHeight(val)
		)
		fn neckLength myLen =
		(
			myBip = execute("$" + rollout_character.edt_name.text + "Neck")
			biped.setTransform myBip #scale [myScale.Neck[1]*myLen, myScale.Neck[2]*spn_height.value, myScale.Neck[3]*spn_height.value] false
		)
		fn chestLength myLen =
		(
			myVol = spn_height.value * rollout_volume.sld_body.value * rollout_volume.sld_chest_volume.value

			$pt_spine_04.scale = [myLen, myVol, myVol]
			$pt_spine_05.scale = [myLen, myVol, myVol]

			myBip = execute("$" + rollout_character.edt_name.text + "Spine2")
			biped.setTransform myBip #scale [myScale.Spine2[1]*myLen, myScale.Spine2[2]*myVol, myScale.Spine2[3]*myVol] false

			myBip = execute("$" + rollout_character.edt_name.text + "Spine3")
			biped.setTransform myBip #scale [myScale.Spine3[1]*myLen, myScale.Spine3[2]*myLen, myScale.Spine3[3]*myLen] false
		)
		fn waistLength myLen =
		(
			myBip = execute("$" + rollout_character.edt_name.text + "Spine")
			biped.setTransform myBip #scale [myScale.Spine[1]*myLen, myScale.Spine[2]*spn_height.value, myScale.Spine[3]*spn_height.value] false
		)
		fn pelvisLength myLen =
		(
			myBip = execute("$" + rollout_character.edt_name.text + "Pelvis")
			biped.setTransform myBip #scale [myScale.Pelvis[1]*spn_height.value, myScale.Pelvis[2]*spn_height.value, myScale.Pelvis[3]*myLen] false
		)
		fn clavicleLength myLen =
		(
			myList = #("LClavicle","RClavicle")
			for i in myList do
			(
				myBip = execute("$"+rollout_character.edt_name.text+i)
				biped.setTransform myBip #scale [myScale.LClavicle[1]*myLen, myScale.LClavicle[2]*spn_height.value, myScale.LClavicle[3]*spn_height.value] false
			)
		)
		fn upperarmLength myLen =
		(
			myList = #("LUpperArm","RUpperArm")
			for i in myList do
			(
				myBip = execute("$"+rollout_character.edt_name.text+i)
				biped.setTransform myBip #scale [myScale.LUpperArm[1]*myLen, myScale.LUpperArm[2]*spn_height.value, myScale.LUpperArm[3]*spn_height.value] false
			)
		)
		fn lowerarmLength myLen =
		(
			myList = #("LForeArm","RForeArm")
			for i in myList do
			(
				myBip = execute("$"+rollout_character.edt_name.text+i)
				biped.setTransform myBip #scale [myScale.LForeArm[1]*myLen, myScale.LForeArm[2]*spn_height.value, myScale.LForeArm[3]*spn_height.value] false
			)
		)
		fn handLength myLen =
		(
			$pt_hand_l.scale = [spn_height.value, spn_height.value, myLen]
			$pt_hand_r.scale = [spn_height.value, spn_height.value, myLen]

			myList = #("LHand","RHand")
			for i in myList do
			(
				myBip = execute("$"+rollout_character.edt_name.text+i)

				biped.setTransform myBip #scale [myScale.LHand[1]*myLen, myScale.LHand[2]*spn_height.value, myScale.LHand[3]*myLen] false
			)

			myList = #("LFinger","RFinger")
			for i in myList do
			(
				myBip = rollout_character.edt_name.text + i

				biped.setTransform (execute("$"+ myBip +"0")) #scale [myScale.LFinger0[1]*myLen, myScale.LFinger0[2]*spn_height.value, myScale.LFinger0[3]*spn_height.value] false
				biped.setTransform (execute("$"+ myBip +"01")) #scale [myScale.LFinger01[1]*myLen, myScale.LFinger01[2]*spn_height.value, myScale.LFinger01[3]*spn_height.value] false
				biped.setTransform (execute("$"+ myBip +"02")) #scale [myScale.LFinger02[1]*myLen, myScale.LFinger02[2]*spn_height.value, myScale.LFinger02[3]*spn_height.value] false
				biped.setTransform (execute("$"+ myBip +"1")) #scale [myScale.LFinger1[1]*myLen, myScale.LFinger1[2]*spn_height.value, myScale.LFinger1[3]*spn_height.value] false
				biped.setTransform (execute("$"+ myBip +"11")) #scale [myScale.LFinger11[1]*myLen, myScale.LFinger11[2]*spn_height.value, myScale.LFinger11[3]*spn_height.value] false
				biped.setTransform (execute("$"+ myBip +"12")) #scale [myScale.LFinger12[1]*myLen, myScale.LFinger12[2]*spn_height.value, myScale.LFinger12[3]*spn_height.value] false
				biped.setTransform (execute("$"+ myBip +"2")) #scale [myScale.LFinger2[1]*myLen, myScale.LFinger2[2]*spn_height.value, myScale.LFinger2[3]*spn_height.value] false
				biped.setTransform (execute("$"+ myBip +"21")) #scale [myScale.LFinger21[1]*myLen, myScale.LFinger21[2]*spn_height.value, myScale.LFinger21[3]*spn_height.value] false
				biped.setTransform (execute("$"+ myBip +"22")) #scale [myScale.LFinger22[1]*myLen, myScale.LFinger22[2]*spn_height.value, myScale.LFinger22[3]*spn_height.value] false
				biped.setTransform (execute("$"+ myBip +"3")) #scale [myScale.LFinger3[1]*myLen, myScale.LFinger3[2]*spn_height.value, myScale.LFinger3[3]*spn_height.value] false
				biped.setTransform (execute("$"+ myBip +"31")) #scale [myScale.LFinger31[1]*myLen, myScale.LFinger31[2]*spn_height.value, myScale.LFinger31[3]*spn_height.value] false
				biped.setTransform (execute("$"+ myBip +"32")) #scale [myScale.LFinger32[1]*myLen, myScale.LFinger32[2]*spn_height.value, myScale.LFinger32[3]*spn_height.value] false
				biped.setTransform (execute("$"+ myBip +"4")) #scale [myScale.LFinger4[1]*myLen, myScale.LFinger4[2]*spn_height.value, myScale.LFinger4[3]*spn_height.value] false
				biped.setTransform (execute("$"+ myBip +"41")) #scale [myScale.LFinger41[1]*myLen, myScale.LFinger41[2]*spn_height.value, myScale.LFinger41[3]*spn_height.value] false
				biped.setTransform (execute("$"+ myBip +"42")) #scale [myScale.LFinger42[1]*myLen, myScale.LFinger42[2]*spn_height.value, myScale.LFinger42[3]*spn_height.value] false
			)
		)
		fn thighLength myLen =
		(
			myVol = spn_height.value * rollout_volume.sld_body.value * rollout_volume.sld_thigh_volume.value
			-- myVol = rollout_volume.sld_body.value * rollout_volume.sld_thigh_volume.value

			myList = #("LThigh","RThigh")
			for i in myList do
			(
				myBip = execute("$"+rollout_character.edt_name.text+i)
				biped.setTransform myBip #scale [myScale.LThigh[1]*myLen, myScale.LThigh[2]*myVol, myScale.LThigh[3]*myVol] false
			)
			
			-- thigh length
			myThigh = execute("$"+rollout_character.edt_name.text+"LThigh")
			myThighPos = biped.getTransform myThigh #pos
		
			myCalf = execute("$"+rollout_character.edt_name.text+"LCalf")
			myCalfPos = biped.getTransform myCalf #pos
		
			myDis = myThighPos[3] - myCalfPos[3]
			
			-- com xy
			myBip = execute("$"+rollout_character.edt_name.text)
			myTrans = biped.getTransform myBip #pos

			-- com z
			myDist = myScale.myComEdit[3] + myDis - myScale.myThighDisEdit

			-- com pos
			biped.setTransform myBip #pos [myTrans[1], myTrans[2], myDist] false
			
			-- myLen = sld_thigh_length.value
			-- $pt_thigh_l.scale = [myLen, myVol, myVol]
			-- $pt_thigh_r.scale = [myLen, myVol, myVol]
			
			-- myThighComEdit
			myBip = execute("$"+rollout_character.edt_name.text)
			myScale.myThighComEdit = biped.getTransform myBip #pos
		)
		fn calfLenght myLen =
		(
			myList = #("LCalf","RCalf")
			myVol = rollout_volume.sld_calf_volume.value * spn_height.value
			for i in myList do
			(
				myBip = execute("$"+rollout_character.edt_name.text+i)
				biped.setTransform myBip #scale [myScale.LCalf[1]*myLen, myScale.LCalf[2]*myVol, myScale.LCalf[3]*myVol] false
			)
			
			-- calf length
			myCalf = execute("$"+rollout_character.edt_name.text+"LCalf")
			myCalfPos = biped.getTransform myCalf #pos
		
			myFoot = execute("$"+rollout_character.edt_name.text+"LFoot")
			myFootPos = biped.getTransform myFoot #pos
		
			myDis = myCalfPos[3] - myFootPos[3]
			
			-- com xy
			myBip = execute("$"+rollout_character.edt_name.text)
			myTrans = biped.getTransform myBip #pos

			-- com z
			myDist = myScale.myComEdit[3] + myDis - myScale.myCalfDisEdit
			if myScale.myComEdit != myScale.myThighComEdit then
			(
				myDist = myScale.myThighComEdit[3] + myDis - myScale.myCalfDisEdit
			)

			-- com
			biped.setTransform myBip #pos [myTrans[1], myTrans[2], myDist] false
			
			-- myLen = sld_calf_length.value
			$pt_calf_l.scale = [myLen, myVol, myVol]
			$pt_calf_r.scale = [myLen, myVol, myVol]

			-- myCalfComEdit
			myBip = execute("$"+rollout_character.edt_name.text)
			myScale.myCalfComEdit = biped.getTransform myBip #pos
		)
		fn footLength myLen =
		(
			$pt_foot_l.scale = [spn_height.value, myLen, myLen]
			$pt_foot_r.scale = [spn_height.value, myLen, myLen]
			$pt_ball_l.scale = [myLen, spn_height.value, myLen]
			$pt_ball_r.scale = [myLen, spn_height.value, myLen]

			myList = #("LFoot","RFoot")
			for i in myList do
			(
				myBip = execute("$"+rollout_character.edt_name.text+i)
				
				biped.setTransform myBip #scale [myScale.LFoot[1]*spn_height.value, myScale.LFoot[2]*myLen, myScale.LFoot[3]*myLen] false
			)
		)
		
		/*----------------------------------------------------------------------------------------------------
		open
		*/----------------------------------------------------------------------------------------------------
		on rollout_length open do
		(
			gc()
			clearListener()
		
			uiEnabled(False)
			rollout_character.edt_name.text = "Bip001"
			
			myScale = bipScale()
			myBip = rollout_character.edt_name.text
			
			myScale.Neck = biped.getTransform (execute("$"+ myBip +"Neck")) #scale
			myScale.Spine3 = biped.getTransform (execute("$"+ myBip +"Spine3")) #scale
			myScale.Spine2 = biped.getTransform (execute("$"+ myBip +"Spine2")) #scale
			myScale.Spine1 = biped.getTransform (execute("$"+ myBip +"Spine1")) #scale
			myScale.Spine = biped.getTransform (execute("$"+ myBip +"Spine")) #scale
			myScale.Pelvis = biped.getTransform (execute("$"+ myBip +"Pelvis")) #scale

			myScale.LClavicle = biped.getTransform (execute("$"+ myBip +"LClavicle")) #scale
			myScale.LUpperArm = biped.getTransform (execute("$"+ myBip +"LUpperArm")) #scale
			myScale.LForearm = biped.getTransform (execute("$"+ myBip +"LForearm")) #scale
			myScale.LHand = biped.getTransform (execute("$"+ myBip +"LHand")) #scale
			myScale.LFinger0 = biped.getTransform (execute("$"+ myBip +"LFinger0")) #scale
			myScale.LFinger01 = biped.getTransform (execute("$"+ myBip +"LFinger01")) #scale
			myScale.LFinger02 = biped.getTransform (execute("$"+ myBip +"LFinger02")) #scale
			myScale.LFinger1 = biped.getTransform (execute("$"+ myBip +"LFinger1")) #scale
			myScale.LFinger11 = biped.getTransform (execute("$"+ myBip +"LFinger11")) #scale
			myScale.LFinger12 = biped.getTransform (execute("$"+ myBip +"LFinger12")) #scale
			myScale.LFinger2 = biped.getTransform (execute("$"+ myBip +"LFinger2")) #scale
			myScale.LFinger21 = biped.getTransform (execute("$"+ myBip +"LFinger21")) #scale
			myScale.LFinger22 = biped.getTransform (execute("$"+ myBip +"LFinger22")) #scale
			myScale.LFinger3 = biped.getTransform (execute("$"+ myBip +"LFinger3")) #scale
			myScale.LFinger31 = biped.getTransform (execute("$"+ myBip +"LFinger31")) #scale
			myScale.LFinger32 = biped.getTransform (execute("$"+ myBip +"LFinger32")) #scale
			myScale.LFinger4 = biped.getTransform (execute("$"+ myBip +"LFinger4")) #scale
			myScale.LFinger41 = biped.getTransform (execute("$"+ myBip +"LFinger41")) #scale
			myScale.LFinger42 = biped.getTransform (execute("$"+ myBip +"LFinger42")) #scale

			myScale.LThigh = biped.getTransform (execute("$"+ myBip +"LThigh")) #scale
			myScale.LThighEdit = biped.getTransform (execute("$"+ myBip +"LThigh")) #scale
			myScale.LCalf = biped.getTransform (execute("$"+ myBip +"LCalf")) #scale
			myScale.LCalfEdit = biped.getTransform (execute("$"+ myBip +"LCalf")) #scale
			myScale.LFoot = biped.getTransform (execute("$"+ myBip +"LFoot")) #scale

			myScale.myThighDis = execute("$"+ myBip +"LThigh.transform.pos[3]") - execute("$"+ myBip +"LCalf.transform.pos[3]")
			myScale.myCalfDis = execute("$"+ myBip +"LCalf.transform.pos[3]") - execute("$"+ myBip +"LFoot.transform.pos[3]")
			
			myBip = execute("$"+ myBip )
			myScale.myCom = biped.getTransform myBip #pos
			myScale.myComEdit = biped.getTransform myBip #pos
		
			getBipTransform()
		)

		/*----------------------------------------------------------------------------------------------------
		00 body height
		*/----------------------------------------------------------------------------------------------------
		on sld_height changed val do
		(
			spn_height.value = val
			bodyHeight(val)
		)
		on spn_height changed val do
		(
			sld_height.value = val
			bodyHeight(val)
		)
		on btn_height pressed do
		(
			---- reset all
			-- head
			val = sld_head_length.value = spn_head_length.value = 1
			myLen = spn_height.value * val
			$pt_head.scale = [myLen,myLen,myLen]

			-- neck
			val = sld_neck_length.value = spn_neck_length.value = 1
			myLen = spn_height.value * val
			neckLength(myLen)

			-- chest
			val = sld_chest_length.value = spn_chest_length.value = 1
			myLen = spn_height.value * val			
			chestLength(myLen)

			-- waist
			val = sld_waist_length.value = spn_waist_length.value = 1
			myLen = spn_height.value * val			
			waistLength(myLen)

			-- pelvis
			val = sld_pelvis_length.value = spn_pelvis_length.value = 1
			myLen = spn_height.value * val
			pelvisLength(myLen)

			-- clavicle
			val = sld_clavicle_length.value = spn_clavicle_length.value = 1
			myLen = spn_height.value * val
			clavicleLength(myLen)

			-- upperarm
			val = sld_upperarm_length.value = spn_upperarm_length.value = 1
			myLen = spn_height.value * val
			upperarmLength(myLen)

			-- lowerarm
			val = sld_lowerarm_length.value = spn_lowerarm_length.value = 1
			myLen = spn_height.value * val
			lowerarmLength(myLen)

			-- hand
			sld_hand_length.value = spn_hand_length.value = val = 1
			myLen = spn_height.value * val
			handLength(myLen)

			-- thigh
			sld_thigh_length.value = spn_thigh_length.value = val = 1
			myLen = spn_height.value * val
			thighLength(myLen)

			-- calf
			sld_calf_length.value = spn_calf_length.value = val = 1
			myLen = spn_height.value * val
			calfLenght(myLen)

			-- foot
			sld_foot_length.value = spn_foot_length.value = val = 1
			myLen = spn_height.value * val
			footLength(myLen)
			
			-- reset height
			btn_bodyHeight(1.0)

			-- com
			myBip = execute("$"+rollout_character.edt_name.text)
			biped.setTransform myBip #pos [myScale.myCom[1], myScale.myCom[2], myScale.myCom[3]] false
		)
		on btn_210 pressed do btn_bodyHeight(1.162)
		on btn_200 pressed do btn_bodyHeight(1.107)
		on btn_195 pressed do btn_bodyHeight(1.079)
		on btn_190 pressed do btn_bodyHeight(1.051)
		on btn_185 pressed do btn_bodyHeight(1.024)
		on btn_180 pressed do btn_bodyHeight(1.0)
		on btn_175 pressed do btn_bodyHeight(0.968)
		on btn_170 pressed do btn_bodyHeight(0.941)
		on btn_165 pressed do btn_bodyHeight(0.913)
		on btn_160 pressed do btn_bodyHeight(0.885)

		/*----------------------------------------------------------------------------------------------------
		01 head length
		*/----------------------------------------------------------------------------------------------------
		on sld_head_length changed val do
		(
			spn_head_length.value = val
			myLen = spn_height.value * val
			$pt_head.scale = [myLen,myLen,myLen]
		)
		on spn_head_length changed val do
		(
			sld_head_length.value = val
			myLen = spn_height.value * val
			$pt_head.scale = [myLen,myLen,myLen]
		)
		on btn_head_length pressed do
		(
			val = sld_head_length.value = spn_head_length.value = 1
			myLen = spn_height.value * val
			$pt_head.scale = [myLen,myLen,myLen]
		)

		/*----------------------------------------------------------------------------------------------------
		02 neck length
		*/----------------------------------------------------------------------------------------------------
		on sld_neck_length changed val do
		(
			spn_neck_length.value = val
			myLen = spn_height.value * val			
			neckLength(myLen)
		)
		on spn_neck_length changed val do
		(
			sld_neck_length.value = val
			myLen = spn_height.value * val
			neckLength(myLen)
		)
		on btn_neck_length pressed do
		(
			val = sld_neck_length.value = spn_neck_length.value = 1
			myLen = spn_height.value * val
			neckLength(myLen)
		)

		/*----------------------------------------------------------------------------------------------------
		03 chest length
		*/----------------------------------------------------------------------------------------------------
		on sld_chest_length changed val do
		(
			spn_chest_length.value = val
			myLen = spn_height.value * val
			chestLength(myLen)
		)
		on spn_chest_length changed val do
		(
			sld_chest_length.value = val
			myLen = spn_height.value * val			
			chestLength(myLen)
		)
		on btn_chest_length pressed do
		(
			val = sld_chest_length.value = spn_chest_length.value = 1
			myLen = spn_height.value * val			
			chestLength(myLen)
		)

		/*----------------------------------------------------------------------------------------------------
		04 waist length
		*/----------------------------------------------------------------------------------------------------
		on sld_waist_length changed val do
		(
			spn_waist_length.value = val
			myLen = spn_height.value * val
			waistLength(myLen)
		)
		on spn_waist_length changed val do
		(
			sld_waist_length.value = val
			myLen = spn_height.value * val
			waistLength(myLen)
		)
		on btn_waist_length pressed do
		(
			val = sld_waist_length.value = spn_waist_length.value = 1
			myLen = spn_height.value * val			
			waistLength(myLen)
		)

		/*----------------------------------------------------------------------------------------------------
		05 pelvis length
		*/----------------------------------------------------------------------------------------------------
		on sld_pelvis_length changed val do
		(
			spn_pelvis_length.value = val
			myLen = spn_height.value * val
			pelvisLength(myLen)
		)
		on spn_pelvis_length changed val do
		(
			sld_pelvis_length.value = val
			myLen = spn_height.value * val
			pelvisLength(myLen)
		)
		on btn_pelvis_length pressed do
		(
			val = sld_pelvis_length.value = spn_pelvis_length.value = 1
			myLen = spn_height.value * val
			pelvisLength(myLen)
		)

		/*----------------------------------------------------------------------------------------------------
		06 clavicle length
		*/----------------------------------------------------------------------------------------------------
		on sld_clavicle_length changed val do
		(
			spn_clavicle_length.value = val
			myLen = spn_height.value * val
			clavicleLength(myLen)
		)
		on spn_clavicle_length changed val do
		(
			sld_clavicle_length.value = val
			myLen = spn_height.value * val
			clavicleLength(myLen)
		)
		on btn_clavicle_length pressed do
		(
			val = sld_clavicle_length.value = spn_clavicle_length.value = 1
			myLen = spn_height.value * val
			clavicleLength(myLen)
		)
		/*----------------------------------------------------------------------------------------------------
		07 upperarm length
		*/----------------------------------------------------------------------------------------------------
		on sld_upperarm_length changed val do
		(
			spn_upperarm_length.value = val
			myLen = spn_height.value * val
			upperarmLength(myLen)
		)
		on spn_upperarm_length changed val do
		(
			sld_upperarm_length.value = val
			myLen = spn_height.value * val
			upperarmLength(myLen)
		)
		on btn_upperarm_length pressed do
		(
			val = sld_upperarm_length.value = spn_upperarm_length.value = 1
			myLen = spn_height.value * val
			upperarmLength(myLen)
		)
		/*----------------------------------------------------------------------------------------------------
		08 lowerarm length
		*/----------------------------------------------------------------------------------------------------
		on sld_lowerarm_length changed val do
		(
			spn_lowerarm_length.value = val
			myLen = spn_height.value * val
			lowerarmLength(myLen)
		)
		on spn_lowerarm_length changed val do
		(
			sld_lowerarm_length.value = val
			myLen = spn_height.value * val
			lowerarmLength(myLen)
		)
		on btn_lowerarm_length pressed do
		(
			val = sld_lowerarm_length.value = spn_lowerarm_length.value = 1
			myLen = spn_height.value * val
			lowerarmLength(myLen)
		)
		/*----------------------------------------------------------------------------------------------------
		09 hand length
		*/----------------------------------------------------------------------------------------------------
		on sld_hand_length changed val do
		(
			spn_hand_length.value = val
			myLen = spn_height.value * val
			handLength(myLen)
		)
		on spn_hand_length changed val do
		(
			sld_hand_length.value = val
			myLen = spn_height.value * val
			handLength(myLen)
		)
		on btn_hand_length pressed do
		(
			sld_hand_length.value = spn_hand_length.value = val = 1
			myLen = spn_height.value * val
			handLength(myLen)
		)
		/*----------------------------------------------------------------------------------------------------
		10 thigh length
		*/----------------------------------------------------------------------------------------------------
		on sld_thigh_length changed val do
		(
			spn_thigh_length.value = val
			myLen = spn_height.value * val
			thighLength(myLen)
		)
		on spn_thigh_length changed val do
		(
			sld_thigh_length.value = val
			myLen = spn_height.value * val
			thighLength(myLen)
		)
		on btn_thigh_length pressed do
		(
			sld_thigh_length.value = spn_thigh_length.value = val = 1
			myLen = spn_height.value * val
			thighLength(myLen)
		)
		/*----------------------------------------------------------------------------------------------------
		11 calf length
		*/----------------------------------------------------------------------------------------------------
		on sld_calf_length changed val do
		(
			spn_calf_length.value = val
			myLen = spn_height.value * val
			calfLenght(myLen)
		)
		on spn_calf_length changed val do
		(
			sld_calf_length.value = val
			myLen = spn_height.value * val
			calfLenght(myLen)
		)
		on btn_calf_length pressed do
		(
			sld_calf_length.value = spn_calf_length.value = val = 1
			myLen = spn_height.value * val
			calfLenght(myLen)
		)
		/*----------------------------------------------------------------------------------------------------
		12 foot length
		*/----------------------------------------------------------------------------------------------------
		on sld_foot_length changed val do
		(
			spn_foot_length.value = val
			myLen = spn_height.value * val
			footLength(myLen)
		)
		on spn_foot_length changed val do
		(
			sld_foot_length.value = val
			myLen = spn_height.value * val
			footLength(myLen)
		)
		on btn_foot_length pressed do
		(
			sld_foot_length.value = spn_foot_length.value = val = 1
			myLen = spn_height.value * val
			footLength(myLen)
		)
	)
	
	rollout rollout_volume "Volume" width:520 height:336
	(
		GroupBox 'grp_all' "All" pos:[8,8] width:248 height:160 align:#left
		slider 'sld_body' "00 Body Volume" pos:[16,40] width:112 height:44 range:myRange align:#left
		spinner 'spn_body' "" pos:[128,56] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_body' "Reset" pos:[200,48] width:48 height:32 align:#left

		button 'btn_2' "2" pos:[16,104] width:33 height:40 align:#left
		button 'btn_3' "3" pos:[48,104] width:33 height:40 align:#left
		button 'btn_4' "4" pos:[80,104] width:33 height:40 align:#left
		button 'btn_5' "5" pos:[112,96] width:41 height:56 align:#left
		button 'btn_6' "6" pos:[152,104] width:33 height:40 align:#left
		button 'btn_7' "7" pos:[184,104] width:33 height:40 align:#left
		button 'btn_8' "8" pos:[216,104] width:33 height:40 align:#left

		GroupBox 'grp_torso' "Torso" pos:[8,168] width:248 height:164 align:#left
		slider 'sld_trapezoidal_volume' "01 Trapezoidal Volume" pos:[16,184] width:112 height:44 range:myRange align:#left
		spinner 'spn_trapezoidal_volume' "" pos:[128,200] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_trapezoidal_volume' "Reset" pos:[200,192] width:48 height:32 align:#left

		slider 'sld_chest_volume' "02 Chest Volume" pos:[16,232] width:112 height:44 range:myRange align:#left
		spinner 'spn_chest_volume' "" pos:[128,248] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_chest_volume' "Reset" pos:[200,240] width:48 height:32 align:#left

		slider 'sld_waist_volume' "03 Waist Volume" pos:[16,280] width:112 height:44 range:myRange align:#left
		spinner 'spn_waist_volume' "" pos:[128,296] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_waist_volume' "Reset" pos:[200,288] width:48 height:32 align:#left
	
		GroupBox 'grp_arm' "Arm" pos:[264,8] width:248 height:160 align:#left
		slider 'sld_shoulder_volume' "04 Shoulder Volume" pos:[272,24] width:112 height:44 range:myRange align:#left
		spinner 'spn_shoulder_volume' "" pos:[384,40] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_shoulder_volume' "Reset" pos:[456,32] width:48 height:32 align:#left

		slider 'sld_upperarm_volume' "05 Upperarm Volume" pos:[272,72] width:112 height:44 range:myRange align:#left
		spinner 'spn_upperarm_volume' "" pos:[384,88] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_upperarm_volume' "Reset" pos:[456,80] width:48 height:32 align:#left

		slider 'sld_lowerarm_volume' "06 Lowerarm Volume" pos:[272,120] width:112 height:44 range:myRange align:#left
		spinner 'spn_lowerarm_volume' "" pos:[384,136] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_lowerarm_volume' "Reset" pos:[456,128] width:48 height:32 align:#left
	
		GroupBox 'grp_leg' "Leg" pos:[264,168] width:248 height:164 align:#left
		slider 'sld_hip_volume' "07 Hip Volume" pos:[271,184] width:112 height:44 range:myRange align:#left
		spinner 'spn_hip_volume' "" pos:[384,200] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_hip_volume' "Reset" pos:[456,192] width:48 height:32 align:#left

		slider 'sld_thigh_volume' "08 Thigh Volume" pos:[272,232] width:112 height:44 range:myRange align:#left
		spinner 'spn_thigh_volume' "" pos:[384,248] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_thigh_volume' "Reset" pos:[456,240] width:48 height:32 align:#left

		slider 'sld_calf_volume' "09 Calf Volume" pos:[272,280] width:112 height:44 range:myRange align:#left
		spinner 'spn_calf_volume' "" pos:[384,296] width:64 height:16 range:myRange scale:0.001 align:#left
		button 'btn_calf_volume' "Reset" pos:[456,288] width:48 height:32 align:#left

		/*----------------------------------------------------------------------------------------------------
		function
		*/----------------------------------------------------------------------------------------------------
		fn uiEnabled val =
		(
			myList = #(
				sld_trapezoidal_volume, btn_trapezoidal_volume,
				sld_chest_volume, btn_chest_volume,
				sld_waist_volume, btn_waist_volume,
				sld_shoulder_volume, btn_shoulder_volume,
				sld_upperarm_volume, btn_upperarm_volume,
				sld_lowerarm_volume, btn_lowerarm_volume,
				sld_hip_volume, btn_hip_volume,
				sld_thigh_volume, btn_thigh_volume,
				sld_calf_volume, btn_calf_volume,
				sld_body, btn_body
			)
			for i in myList do
			(
				i.enabled = val
			)
		)
		fn bodyVolume val =
		(
			-- neck
			myLen = rollout_length.sld_height.value
			myVol = rollout_length.sld_height.value * sld_trapezoidal_volume.value * val
			$pt_clavicle_l.scale = [myLen, myVol, myVol]
			$pt_clavicle_r.scale = [myLen, myVol, myVol]

			-- myLen = rollout_length.sld_height.value * rollout_length.sld_clavicle_length.value
			-- myList = #("LClavicle","RClavicle")
			-- for i in myList do
			-- (
			-- 	myBip = execute("$"+rollout_character.edt_name.text+i)
			-- 	biped.setTransform myBip #scale [myScale.LClavicle[1]*myLen, myScale.LClavicle[2]*myVol, myScale.LClavicle[3]*myVol] false
			-- )

			-- chest
			myLen = rollout_length.sld_height.value * rollout_length.sld_chest_length.value
			myVol = rollout_length.sld_height.value * sld_chest_volume.value * val
			$pt_spine_04.scale = [myLen, myVol, myVol]
			$pt_spine_05.scale = [myLen, myVol, myVol]

			-- myBip = execute("$" + rollout_character.edt_name.text + "Spine2")
			-- biped.setTransform myBip #scale [myScale.Spine2[1]*myLen, myScale.Spine2[2]*myVol, myScale.Spine2[3]*myVol] false

			-- myVol = rollout_length.sld_height.value * rollout_length.sld_chest_length.value * sld_chest_volume.value * val
			-- myBip = execute("$" + rollout_character.edt_name.text + "Spine3")
			-- biped.setTransform myBip #scale [myScale.Spine3[1]*myLen, myScale.Spine3[2]*myVol, myScale.Spine3[3]*myVol] false

			-- waist
			myLen = rollout_length.sld_height.value
			myVol = rollout_length.sld_height.value * sld_waist_volume.value * val
			$pt_spine_02.scale = [myLen, myVol, myVol]

			-- myBip = execute("$" + rollout_character.edt_name.text + "Spine1")
			-- biped.setTransform myBip #scale [myScale.Spine1[1]*myLen, myScale.Spine1[2]*myVol, myScale.Spine1[3]*myVol] false

			-- myLen = rollout_length.sld_height.value * rollout_length.sld_waist_length.value
			-- myBip = execute("$" + rollout_character.edt_name.text + "Spine")
			-- biped.setTransform myBip #scale [myScale.Spine[1]*myLen, myScale.Spine[2]*myVol, myScale.Spine[3]*myVol] false

			-- shoulder
			myLen = rollout_length.sld_height.value
			myVol = rollout_length.sld_height.value * sld_shoulder_volume.value * val
			$upperarm_correctiveRoot_l.scale = [myLen, myVol, myVol]
			$upperarm_correctiveRoot_r.scale = [myLen, myVol, myVol]

			-- upperarm
			myLen = rollout_length.sld_height.value
			myVol = rollout_length.sld_height.value * sld_upperarm_volume.value * val
			$upperarm_twist_02_l.scale = [myLen, myVol, myVol]
			$upperarm_twist_02_r.scale = [myLen, myVol, myVol]

			-- lowerarm
			myLen = rollout_length.sld_height.value
			myVol = rollout_length.sld_height.value * sld_lowerarm_volume.value * val
			$pt_lowerarm_l.scale = [myLen, myVol, myVol]
			$pt_lowerarm_r.scale = [myLen, myVol, myVol]

			-- myLen = rollout_length.sld_height.value * rollout_length.sld_lowerarm_length.value
			-- myList = #("LForeArm","RForeArm")
			-- for i in myList do
			-- (
			-- 	myBip = execute("$"+rollout_character.edt_name.text + i)
			-- 	biped.setTransform myBip #scale [myScale.LForeArm[1]*myLen, myScale.LForeArm[2]*myVol, myScale.LForeArm[3]*myVol] false
			-- )

			-- hip
			myVol = rollout_length.sld_height.value * sld_hip_volume.value * val
			$thigh_bck_lwr_l.scale = [myVol, myVol, myVol]
			$thigh_bck_lwr_r.scale = [myVol, myVol, myVol]

			-- thigh
			myLen = rollout_length.sld_height.value
			myVol = rollout_length.sld_height.value * sld_thigh_volume.value * val
			$thigh_twist_01_l.scale = [myLen, myVol, myVol]
			$thigh_twist_02_l.scale = [myLen, myVol, myVol]
			$thigh_twist_01_r.scale = [myLen, myVol, myVol]
			$thigh_twist_02_r.scale = [myLen, myVol, myVol]

			-- print("sld_height.value")
			-- print(myLen)
			
			-- myList = #("LThigh","RThigh")
			-- for i in myList do
			-- (
			-- 	myBip = execute("$"+rollout_character.edt_name.text + i)
			-- 	biped.setTransform myBip #scale [myScale.LThigh[1]*myLen, myScale.LThigh[2]*myVol, myScale.LThigh[3]*myVol] false
			-- )

			-- calf
			myLen = rollout_length.sld_height.value
			myVol = rollout_length.sld_height.value * sld_calf_volume.value * val
			$pt_calf_l.scale = [myLen, myVol, myVol]
			$pt_calf_r.scale = [myLen, myVol, myVol]
		)
		fn btn_bodyVolume val =
		(
			sld_body.value = spn_body.value = val
			bodyVolume(val)
		)
		fn trapezoidalVolume myVol =
		(
			myLen = rollout_length.sld_height.value --* rollout_length.sld_clavicle_length.value
			$pt_clavicle_l.scale = [myLen, myVol, myVol]
			$pt_clavicle_r.scale = [myLen, myVol, myVol]

			-- myLen = rollout_length.sld_height.value * rollout_length.sld_clavicle_length.value
			-- myList = #("LClavicle","RClavicle")
			-- for i in myList do
			-- (
			-- 	myBip = execute("$"+rollout_character.edt_name.text+i)
			-- 	biped.setTransform myBip #scale [myScale.LClavicle[1]*myLen, myScale.LClavicle[2]*myVol, myScale.LClavicle[3]*myVol] false
			-- )
		)
		fn chestVolume myVol =
		(
			myLen = rollout_length.sld_height.value * rollout_length.sld_chest_length.value
			$pt_spine_04.scale = [myLen, myVol, myVol]
			$pt_spine_05.scale = [myLen, myVol, myVol]

			-- myBip = execute("$" + rollout_character.edt_name.text + "Spine2")
			-- biped.setTransform myBip #scale [myScale.Spine2[1]*myLen, myScale.Spine2[2]*myVol, myScale.Spine2[3]*myVol] false

			-- myVol = rollout_length.sld_height.value * rollout_length.sld_chest_length.value * sld_chest_volume.value * myVol			
			-- myBip = execute("$" + rollout_character.edt_name.text + "Spine3")
			-- biped.setTransform myBip #scale [myScale.Spine3[1]*myLen, myScale.Spine3[2]*myVol, myScale.Spine3[3]*myVol] false
		)
		fn waistVolume myVol =
		(
			myLen = rollout_length.sld_height.value
			$pt_spine_02.scale = [myLen, myVol, myVol]

			-- myBip = execute("$" + rollout_character.edt_name.text + "Spine1")
			-- biped.setTransform myBip #scale [myScale.Spine1[1]*myLen, myScale.Spine1[2]*myVol, myScale.Spine1[3]*myVol] false

			-- myLen = rollout_length.sld_height.value * rollout_length.sld_waist_length.value
			-- myBip = execute("$" + rollout_character.edt_name.text + "Spine")
			-- biped.setTransform myBip #scale [myScale.Spine[1]*myLen, myScale.Spine[2]*myVol, myScale.Spine[3]*myVol] false
		)
		fn shoulderVolume myVol =
		(
			myLen = rollout_length.sld_height.value
			$upperarm_correctiveRoot_l.scale = [myLen, myVol, myVol]
			$upperarm_correctiveRoot_r.scale = [myLen, myVol, myVol]
		)
		fn upperarmVolume myVol =
		(
			myLen = rollout_length.sld_height.value
			$upperarm_twist_02_l.scale = [myLen, myVol, myVol]
			$upperarm_twist_02_r.scale = [myLen, myVol, myVol]
		)
		fn lowerarmVolume myVol =
		(
			myLen = rollout_length.sld_height.value
			$pt_lowerarm_l.scale = [myLen, myVol, myVol]
			$pt_lowerarm_r.scale = [myLen, myVol, myVol]

			-- myLen = rollout_length.sld_height.value * rollout_length.sld_lowerarm_length.value
			-- myList = #("LForeArm","RForeArm")
			-- for i in myList do
			-- (
			-- 	myBip = execute("$"+rollout_character.edt_name.text + i)
			-- 	biped.setTransform myBip #scale [myScale.LForeArm[1]*myLen, myScale.LForeArm[2]*myVol, myScale.LForeArm[3]*myVol] false
			-- )
		)
		fn hipVolume myVol =
		(
			$thigh_bck_lwr_l.scale = [myVol, myVol, myVol]
			$thigh_bck_lwr_r.scale = [myVol, myVol, myVol]
		)
		fn thighVolume myVol =
		(
			-- myLen = rollout_length.sld_height.value * rollout_length.sld_thigh_length.value
			myLen = rollout_length.sld_height.value
			myVol = rollout_length.sld_height.value * myVol

			$thigh_twist_01_l.scale = [myLen, myVol, myVol]
			$thigh_twist_02_l.scale = [myLen, myVol, myVol]
			$thigh_twist_01_r.scale = [myLen, myVol, myVol]
			$thigh_twist_02_r.scale = [myLen, myVol, myVol]

			-- print("sld_height.value")
			-- print(myLen)

			-- myLen = rollout_length.sld_height.value * rollout_length.sld_thigh_length.value
			-- myList = #("LThigh","RThigh")
			-- for i in myList do
			-- (
			-- 	myBip = execute("$"+rollout_character.edt_name.text + i)
			-- 	biped.setTransform myBip #scale [myScale.LThigh[1]*myLen, myScale.LThigh[2]*myVol, myScale.LThigh[3]*myVol] false
			-- )
		)
		fn calfVolume myVol =
		(
			myLen = rollout_length.sld_height.value * rollout_length.sld_calf_length.value
			myVol = rollout_length.sld_height.value * myVol

			$pt_calf_l.scale = [myLen, myVol, myVol]
			$pt_calf_r.scale = [myLen, myVol, myVol]
		)
		/*----------------------------------------------------------------------------------------------------
		open
		*/----------------------------------------------------------------------------------------------------
		on rollout_volume open do
		(
			uiEnabled(False)
		)

		/*----------------------------------------------------------------------------------------------------
		00 body volume
		*/----------------------------------------------------------------------------------------------------
		on sld_body changed val do
		(
			spn_body.value = val
			bodyVolume(val)
		)
		on spn_body changed val do
		(
			sld_body.value = val
			bodyVolume(val)
		)
		on btn_body pressed do
		(
			val = sld_body.value = spn_body.value = 1			
			bodyVolume(val)
		)
		on btn_2 pressed do btn_bodyVolume(0.7)
		on btn_3 pressed do btn_bodyVolume(0.8)
		on btn_4 pressed do btn_bodyVolume(0.9)
		on btn_5 pressed do btn_bodyVolume(1.0)
		on btn_6 pressed do btn_bodyVolume(1.1)
		on btn_7 pressed do btn_bodyVolume(1.2)
		on btn_8 pressed do btn_bodyVolume(1.3)

		/*----------------------------------------------------------------------------------------------------
		01 trapezoidal volume
		*/----------------------------------------------------------------------------------------------------
		on sld_trapezoidal_volume changed val do
		(
			spn_trapezoidal_volume.value = val
			myVol = rollout_length.sld_height.value * sld_body.value * val
			trapezoidalVolume(myVol)
		)
		on spn_trapezoidal_volume changed val do
		(
			sld_trapezoidal_volume.value = val
			myVol = rollout_length.sld_height.value * sld_body.value * val
			trapezoidalVolume(myVol)
		)
		on btn_trapezoidal_volume pressed do
		(
			val = sld_trapezoidal_volume.value = spn_trapezoidal_volume.value = 1
			myVol = rollout_length.sld_height.value * sld_body.value * val			
			trapezoidalVolume(myVol)
		)
		/*----------------------------------------------------------------------------------------------------
		02 chest volume
		*/----------------------------------------------------------------------------------------------------
		on sld_chest_volume changed val do
		(
			spn_chest_volume.value = val
			myVol = rollout_length.sld_height.value * sld_body.value * val
			chestVolume(myVol)
		)
		on spn_chest_volume changed val do
		(
			sld_chest_volume.value = val
			myVol = rollout_length.sld_height.value * sld_body.value * val			
			chestVolume(myVol)
		)
		on btn_chest_volume pressed do
		(
			val = sld_chest_volume.value = spn_chest_volume.value = 1
			myVol = rollout_length.sld_height.value * sld_body.value * val			
			chestVolume(myVol)
		)
		/*----------------------------------------------------------------------------------------------------
		03 waist volume
		*/----------------------------------------------------------------------------------------------------
		on sld_waist_volume changed val do
		(
			spn_waist_volume.value = val
			myVol = rollout_length.sld_height.value * sld_body.value * val
			waistVolume(myVol)
		)
		on spn_waist_volume changed val do
		(
			sld_waist_volume.value = val
			myVol = rollout_length.sld_height.value * sld_body.value * val			
			waistVolume(myVol)
		)
		on btn_waist_volume pressed do
		(
			val = sld_waist_volume.value = spn_waist_volume.value = 1
			myVol = rollout_length.sld_height.value * sld_body.value * val			
			waistVolume(myVol)
		)
		/*----------------------------------------------------------------------------------------------------
		04 shoulder volume
		*/----------------------------------------------------------------------------------------------------
		on sld_shoulder_volume changed val do
		(
			spn_shoulder_volume.value = val
			myVol = rollout_length.sld_height.value * sld_body.value * val
			shoulderVolume(myVol)
		)
		on spn_shoulder_volume changed val do
		(
			sld_shoulder_volume.value = val
			myVol = rollout_length.sld_height.value * sld_body.value * val			
			shoulderVolume(myVol)
		)
		on btn_shoulder_volume pressed do
		(
			val = sld_shoulder_volume.value = spn_shoulder_volume.value = 1
			myVol = rollout_length.sld_height.value * sld_body.value * val			
			shoulderVolume(myVol)
		)
		/*----------------------------------------------------------------------------------------------------
		05 upperarm volume
		*/----------------------------------------------------------------------------------------------------
		on sld_upperarm_volume changed val do
		(
			spn_upperarm_volume.value = val
			myVol = rollout_length.sld_height.value * sld_body.value * val
			upperarmVolume(myVol)
		)
		on spn_upperarm_volume changed val do
		(
			sld_upperarm_volume.value = val
			myVol = rollout_length.sld_height.value * sld_body.value * val			
			upperarmVolume(myVol)
		)
		on btn_upperarm_volume pressed do
		(
			val = sld_upperarm_volume.value = spn_upperarm_volume.value = 1
			myVol = rollout_length.sld_height.value * sld_body.value * val			
			upperarmVolume(myVol)
		)
		/*----------------------------------------------------------------------------------------------------
		06 lowerarm volume
		*/----------------------------------------------------------------------------------------------------
		on sld_lowerarm_volume changed val do
		(
			spn_lowerarm_volume.value = val
			myVol = rollout_length.sld_height.value * sld_body.value * val
			lowerarmVolume(myVol)
		)
		on spn_lowerarm_volume changed val do
		(
			sld_lowerarm_volume.value = val
			myVol = rollout_length.sld_height.value * sld_body.value * val			
			lowerarmVolume(myVol)
		)
		on btn_lowerarm_volume pressed do
		(
			val = sld_lowerarm_volume.value = spn_lowerarm_volume.value = 1
			myVol = rollout_length.sld_height.value * sld_body.value * val			
			lowerarmVolume(myVol)
		)
		/*----------------------------------------------------------------------------------------------------
		07 hip volume
		*/----------------------------------------------------------------------------------------------------
		on sld_hip_volume changed val do
		(
			spn_hip_volume.value = val
			myVol = rollout_length.sld_height.value * sld_body.value * val
			hipVolume(myVol)
		)
		on spn_hip_volume changed val do
		(
			sld_hip_volume.value = val
			myVol = rollout_length.sld_height.value * sld_body.value * val			
			hipVolume(myVol)
		)
		on btn_hip_volume pressed do
		(
			val = sld_hip_volume.value = spn_hip_volume.value = 1
			myVol = rollout_length.sld_height.value * sld_body.value * val			
			hipVolume(myVol)
		)
		/*----------------------------------------------------------------------------------------------------
		08 thigh volume
		*/----------------------------------------------------------------------------------------------------
		on sld_thigh_volume changed val do
		(
			spn_thigh_volume.value = val
			myVol = sld_body.value * val
			thighVolume(myVol)
		)
		on spn_thigh_volume changed val do
		(
			sld_thigh_volume.value = val
			myVol = sld_body.value * val
			thighVolume(myVol)
		)
		on btn_thigh_volume pressed do
		(
			val = sld_thigh_volume.value = spn_thigh_volume.value = 1
			myVol = sld_body.value * val			
			thighVolume(myVol)
		)
		/*----------------------------------------------------------------------------------------------------
		09 calf volume
		*/----------------------------------------------------------------------------------------------------
		on sld_calf_volume changed val do
		(
			spn_calf_volume.value = val
			myVol = sld_body.value * val
			calfVolume(myVol)
		)
		on spn_calf_volume changed val do
		(
			sld_calf_volume.value = val
			myVol = sld_body.value * val			
			calfVolume(myVol)
		)
		on btn_calf_volume pressed do
		(
			val = sld_calf_volume.value = spn_calf_volume.value = 1
			myVol = sld_body.value * val			
			calfVolume(myVol)
		)
	)
	
	floaterName = "YG_customizingTool_" + myVersion
	theNewFloater = newRolloutFloater floaterName 530 848

	addRollout rollout_character theNewFloater
	addRollout rollout_length theNewFloater
	addRollout rollout_volume theNewFloater
	
)
	