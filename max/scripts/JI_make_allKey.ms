try destroyDialog MAK catch ()


rollout MAK "make all Key" width:200 height:120
(
	global astart = animationRange.start
	global aend = animationRange.end
	
	spinner spn_start "start: " range:[-100000, 100000, astart] type:#integer pos:[15,40] width:60 height:16 align:#left
	spinner spn_end "end:  " range:[-100000, 100000, aend] type:#integer pos:[15,60] width:60 height:16 align:#left
	
	button btn1 "make all key" pos:[100,35] width:80 height:48 align:#left
	
	
	on spn_start changed state do
	(
		astart = state
		print astart
	)
	
		
	on spn_end changed state do
	(
		aend = state
		if astart >= aend then
		(	
			aend = astart + 1
		)
		--animationRange = interval astart state
		--실제로 보여지는 구간을 변경함.
		print aend
	)
	
	

	on btn1 pressed do
	(
		print "-------버튼 누름--------"
		
		
		
		local com = getNodeByName "Bip001"
		local L_arm = getNodeByName "Bip001_L_Clavicle"
		local R_arm = getNodeByName "Bip001_R_Clavicle"
		local Head = getNodeByName "Bip001_head"
		local L_leg = getNodeByName "Bip001_L_Foot"
		local R_leg = getNodeByName "Bip001_R_Foot"
		local Spine = getNodeByName "Bip001_Spine"
		local Pelvis = getNodeByName "Bip001_Pelvis"
		
		
		select com
		
		for t = astart to aend do 
		(
			
			biped.addNewKey com.controller.horizontal.controller t
			biped.addNewKey com.controller.vertical.controller t
			biped.addNewKey com.controller.turning.controller t
			
			biped.addNewKey L_arm.controller t
			biped.addNewKey R_arm.controller t
				biped.addNewKey Head.controller t
			biped.addNewKey L_leg.controller t
			biped.addNewKey R_leg.controller t
				biped.addNewKey Spine.controller t
				biped.addNewKey Pelvis.controller t

		)
		
	)
)
CreateDialog MAK
