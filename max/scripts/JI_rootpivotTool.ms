

/*
JI_rootpivotTool.ms
since 2023.06.15
last updated 2023.11.22
by Jung-In, Park
jade2713@gmail.com
*/



try( destroydialog root_pivot_new ) catch()
	
rollout root_pivot_new "root_pivot"
(

	
	GroupBox 'grp' "" pos:[10,30] width:210 height:175 align:#left
	
	label 'lbl1' "position" pos:[40,47] width:50 height:24 align:#left
	checkbox 'pos_x' "x" pos:[50,72] width:40 height:32 align:#left
	checkbox 'pos_y' "y" pos:[50,104] width:40 height:32 align:#left
	checkbox 'pos_z' "z" pos:[50,136] width:40 height:32 align:#left

	label 'lbl2' "rotation" pos:[144,47] width:50 height:24 align:#left
	checkbox 'rot_x' "x" pos:[152,72] width:40 height:32 align:#left
	checkbox 'rot_y' "y" pos:[152,104] width:40 height:32 align:#left
	checkbox 'rot_z' "z" pos:[152,136] width:40 height:32 align:#left

	button 'btn1' "1 : make dummy!" pos:[16,216] width:200 height:40 align:#left
	button 'btn2' "2 : go to Root" pos:[16,260] width:200 height:40 align:#left
	
	
	
	label 'lbl5' "------ 필요한 값을 선택하세요" pos:[50,10] width:288 height:20 align:#left

	
	
	
	
	
	checkbox 'chk_motion_pos' "모션의 시작이 0점이 아님" pos:[40,170] width:160 height:32 align:#left
	


	
	
	on btn1 pressed do
	(	
		local Astart = animationRange.start
		local Aend = animationRange.end	
		local rootBone = getNodeByName "root"
		local com = getNodeByName "pt_pelvis"
		

		if $'dummy_root' != undefined then
		(
			delete $'dummy_root'
			)
		
		
		dumR = Dummy()
		dumR.name = "dummy_root"

		animate on
		(
	
			for i = Astart to Aend do
			(
				slidertime = i
				dumR.transform = com.transform
			)
			
		)

		slidertime = 0
		dumR.rotation = eulerAngles 0 0 0
		dumR.pos = [0,0,0] 
		
		if pos_x.checked  == false then
		(
			deleteKeys dumR.position.x_position.controller
		)
		if pos_y.checked  == false then
		(
			deleteKeys dumR.position.y_position.controller
		)	
		if pos_z.checked  == false then
		(
			deleteKeys dumR.position.z_position.controller
		)
	
		if rot_x.checked  == false then
		(
			deleteKeys dumR.rotation.x_rotation.controller
		)
		if rot_y.checked  == false then
		(
			deleteKeys dumR.rotation.y_rotation.controller
		)	
		if rot_z.checked == false then
		(
			deleteKeys dumR.rotation.z_rotation.controller
		)

		if chk_motion_pos.checked == true then
		(
			dumR.position.value.x = com.position.value.x
			dumR.position.value.y = com.position.value.y
		)

	)
	
	
	
	
	on btn2 pressed do
	(
		local Astart = animationRange.start
		local Aend = animationRange.end	
		local rootBone = getNodeByName "root"
		local dumR = getNodebyName "dummy_root"

		slidertime = 0
		animate on
		(
			for i = Astart to Aend do
			(
				slidertime = i
				rootBone.transform = dumR.transform
			)
		)

		--delete dumR
	

		slidertime = 0f
		clearSelection()
	)
)
createDialog root_pivot_new 230 310

