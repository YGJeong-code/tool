

/*
JI_AI_rootpivotTool.ms
since 2023.06.15
last updated 2024.07.03
by Jung-In, Park
jade2713@gmail.com
*/


	
try destroyDialog AI_Root_pivot catch ()
(
rollout AI_Root_pivot "AI_Root_pivot" --width:296 height:288
(



   
	GroupBox 'grp' "Make Pivot Root" pos:[8,3] width:280 height:136 align:#left
	GroupBox 'grp1' "" pos:[8, 140] width:280 height:84 align:#left
   
	-- 버튼, 
	button 'btn_step1' "1단계: 더미생성" pos:[178,20] width:100 height:50 align:#left
 --align:#center
	button 'btn_step2' "2단계: Align" pos:[178,80] width:100 height:50 align:#left
 --align:#center
	--progressbar animateAlign "AnimateAlign" color:yellow pos:[13,100]

	button 'btn_Makeroot' "Make Root bone" pos:[16,162] width:100 height:24 align:#left
	button 'btn_export' "Export selected" pos:[123,192] width:100 height:24 align:#left
	button 'btn_delroot' "Delete Root bone" pos:[16,192] width:100 height:24 align:#left
 --align:#center	
	
	label 'madeby' "jade2713" pos:[235,152] width:50 height:13 style_sunkenedge:false align:#left 
 
 
 
 
 
	--button 'btn_Delroot' "Delete Root" pos:[128,24] width:100 height:24 align:#left
 
	
	


	-- 추가한 체크박스들.
	checkbox 'chk_pos_x' "x" pos:[24,36] width:40 height:24 checked:true align:#left
	checkbox 'chk_pos_y' "y" pos:[64,36] width:40 height:24 checked:true align:#left
	checkbox 'chk_pos_z' "z" pos:[104,36] width:40 height:24 checked:false align:#left
	label 'lbl3' "Position" pos:[24,26] width:104 height:16 align:#left
	
	checkbox 'chk_rot_x' "x" pos:[22,80] width:40 height:24 checked:false align:#left
	checkbox 'chk_rot_y' "y" pos:[62,80] width:40 height:24 checked:false align:#left
	checkbox 'chk_rot_z' "z" pos:[102,80] width:40 height:24 checked:false align:#left
	label 'lbl4' "Rotation" pos:[24,70] width:104 height:16 align:#left
	label 'lbl20' "루트본에 필요한 값을 선택" pos:[20,115] width:150 height:16 align:#left
	
	
		
	groupBox 'grp3' "" pos:[8,224] width:280 height:120 align:#left
	
	checkbox 'chk_motion_pos' "모션 시작이 x:0 y:0 아닐 때 체크해주세요" pos:[32,240] width:240 height:24 align:#left
	checkbox 'chk_4legs' "4족의 pivot 모션에 체크해주세요" pos:[32,260] width:240 height:24 align:#left

	label 'lbl5' "체크하고 나서 1단계 실행" pos:[128,305] width:136 height:16 align:#left
	label 'lbl6' "AutoKey 끄고 진행" pos:[128,320] width:136 height:16 align:#left

	fn MakeRoot =
		(	
			-- 루트본 생성, 애니작업
			-- 바이패드의 위치 확인

			slidertime = 0f

			-- 루트본을 아래 레이어에 생성합니다.
			--layer = LayerManager.getLayer 0
			layer = LayerManager.getLayerFromName "Bone_No_Ani"

			local rootBone = BoneSys.createBone [ 0,0,0 ] [ 20,0,0 ] [ 0,0,1 ]
			rootBone.name = "root"
			layer.addNode rootBone -- "Bone_No_Ani 레이어에 루트본 넣기"
			
			local bipedRoot = getNodeByName "Bip001"
			
				
			select rootBone
			

			-- 1. 루트본 레이어를 먼저 만들고.
			rootMotionLayerId = biped.numLayers bipedRoot.controller + 1
			biped.createLayer bipedRoot.controller rootMotionLayerId "RootMotionLayer"
			biped.setCurrentLayer bipedRoot.controller rootMotionLayerId
			
		
			--계층 최상위로 rootBone
			bipedRoot.parent = rootBone

		
				   
			return true
			
		)
		
	fn layerDelete com layerNum =
	(
		if layerNum != 1 then (
			messagebox "레이어를 <RootMotionLayer>만 남겨주세요!"
		)
		else (
		sliderTime = 0f	
		biped.deleteLayer com.controller layerNum
		)
	)		

	
	
	

	on btn_step1 pressed do
	(
		
		local Astart = animationrange.start
		local Aend = animationrange.end
	
		local dumRR = getNodeByName "dummy_root"
		local dumBB = getNodeByName "dummy_bip"
		
		
		--더미가 이미 있다면, 제거.
		if (dumRR != undefined ) then (
			delete dumRR
		)
		if (dumBB != undefined ) then (
			delete dumBB
		)
	
		local comN = getNodeByName "Bip001"
	
		--새 더미 생성.
		local dumR = Dummy()
		dumR.name = "dummy_root"
		
		local dumB = Dummy()
		dumB.name = "dummy_bip"
	
	
		animate on
		(
	
			print "-------------------------------------------- call func"
	
			for i = Astart to Aend do-- 프레임 구간 반복
			(
				slidertime = i
				
				--더미로 컴값 다 복사.
				--dumR.transform = comN.transform
				dumB.transform = comN.transform
				dumR.transform = comN.transform
				
			)
			
		)
		
		
		if chk_4legs.checked == true then --4족일 때,
		(
			slidertime = Astart

			local dumC = getNodeByName "dummy_constraint"
			if (dumC != undefined) then (
				delete dumC
			)

			local dumCons = Dummy()  -- 컨스트레인 용도
			dumCons.name = "dummy_constraint"
			addNewkey dumCons.controller 0

			lc = Link_Constraint()
			
			dumCons.Transform.controller = lc
			dumCons.position.value.x = dumB.position.value.x
			dumCons.position.value.y = dumB.position.value.y
			dumCons.position.value.z = dumB.position.value.z
			lc.addTarget dumB 0
			-- 컴의 자리로 제대로 된 축으로 더미Cons 세팅
			
			
			
			-- 새 더미 만들어서 더미Cons값 죄다 복사 후 z축 0값 처리
			local dumCC = getNodeByName "dummy_copy"
			if (dumCC != undefined) then (
				delete dumCC
			)
			local dumCopy = Dummy()
			dumCopy.name = "dummy_copy" 
			
			animate on 
			(
				for i = Astart to Aend do
				(
					slidertime = i
					dumCopy.transform = dumCons.transform
					
				)
			)

			-- 이 더미에서 체크 리스트 값 삭제 ---------------------------
			if chk_pos_x.checked  == false then
			(
				deleteKeys $dummy_copy.position.x_position.controller
			)
			if chk_pos_y.checked  == false then
			(
				deleteKeys $dummy_copy.position.y_position.controller
			)	
			if chk_pos_z.checked  == false then
			(
				deleteKeys $dummy_copy.position.z_position.controller
			)
			if chk_rot_x.checked  == false then
			(
				deleteKeys $dummy_copy.rotation.x_rotation.controller
			)
			if chk_rot_y.checked  == false then
			(
				deleteKeys $dummy_copy.rotation.y_rotation.controller
			)	
			if chk_rot_z.checked == false then
			(
				deleteKeys $dummy_copy.rotation.z_rotation.controller
			)
			dumCopy.position.value.z = 0
			

			slidertime = Astart
			local dumR2 = getNodeByName "dummy_rootC"
			if (dumR2 != undefined) then (
				delete dumR2
			)
			local dumR2 = Dummy()  -- 컨스트레인 용도
			dumR2.name = "dummy_rootC"

			lc2 = Link_Constraint()
			dumR2.Transform.controller = lc2
			dumR2.position.value.x = 0
			dumR2.position.value.y = 0
			lc2.addTarget dumCopy 0
			
			
			
			
		
			local dumRR = getNodeByName "dummy_root"
			if (dumRR != undefined) then (
				delete dumRR
			)
			local dumR = Dummy()  -- 컨스트레인 용도
			dumR.name = "dummy_root"
			
			animate on 
			(
				for i = Astart to Aend do
				(
					slidertime = i
					dumR.transform = dumR2.transform
					
				)
			)

			delete dumCons
			delete dumCopy
			delete dumR2

		)
		else
		(
			slidertime = Astart
			dumR.rotation = eulerAngles 0 0 0
			dumR.pos = [0,0,0]
			
			
			if chk_pos_x.checked  == false then
			(
				deleteKeys $dummy_root.position.x_position.controller
			)
			if chk_pos_y.checked  == false then
			(
				deleteKeys $dummy_root.position.y_position.controller
			)	
			if chk_pos_z.checked  == false then
			(
				deleteKeys $dummy_root.position.z_position.controller
			)
			if chk_rot_x.checked  == false then
			(
				deleteKeys $dummy_root.rotation.x_rotation.controller
			)
			if chk_rot_y.checked  == false then
			(
				deleteKeys $dummy_root.rotation.y_rotation.controller
			)	
			if chk_rot_z.checked == false then
			(
				deleteKeys $dummy_root.rotation.z_rotation.controller
			)
			if chk_motion_pos.checked == true then --모션 시작값 0이 아닐 때, 
			(
				slidertime = Astart
				dumR.position.value.x = dumB.position.value.x
				dumR.position.value.y = dumB.position.value.y
			)
	-- 		

		)

	)
	
	
	
	on btn_step2 pressed do
	(
		
		local Astart = animationrange.start
		local Aend = animationrange.end
		
		local rBone = getNodeByName "root"
		local com = getNodeByName "Bip001"
		if (rBone == undefined) then (
			messagebox ("루트본이 없네요!?")
		)
		else (
			
			comN = getNodeByName "Bip001"
		
			dumR = getNodebyName "dummy_root"
			dumB = getNodebyName "dummy_bip"
			
			rootBone = getNodebyName "Root"
			
			
			
			LayerId = biped.numLayers comN.controller + 1
			biped.createLayer comN.controller LayerId "DumLayer"
			
			
			
			animate on
			(
		
				for i = Astart to Aend do
				(
					slidertime = i
					
				rootBone.transform = dumR.transform
				)
				
			--	delete $dummy_root
			--	delete $dummy_bip
		
			)		
			
		
					
			animate on
			(
				for i = Astart to Aend do
				(
					slidertime = i
					
					biped.setTransform comN #pos dumB.transform.position true
					biped.setTransform comN #rotation dumB.transform.rotation true
					
					if dumB != undefined then (
						biped.setTransform comN #pos dumB.transform.position true
						biped.setTransform comN #rotation dumB.transform.rotation true
						)
					
					-- 더미들 값 com, rootbone에 통째로 베이크.
					
					
				)
				
			--	delete $dummy_root
			--	delete $dummy_bip
		
			)	
		)			
			
		
	
		
		
	)
	on btn_Makeroot pressed do
	(
		
		local rBone = getNodeByName "root"
		local com = getNodeByName "Bip001"
		if (rBone != undefined) then (
			messagebox ("루트본이 이미 있네요!?")
		)
		else (
			MakeRoot()
		)
	
	)
	
	on btn_delroot pressed do 
	(
		com = getNodeByName "Bip001"
		layerNum = biped.numLayers com.controller
		
		rBone = getNodeByName "root"
	
		--루트본 지우기
		if (rBone == undefined) then (
			messagebox ("지울 루트본이 없습니다?!")
		)
		else (
			layerDelete com layerNum
			sliderTime = 0f	
			delete $root
		)
			
	)
	
	
	on btn_export pressed do
	(
		--select #() -- 목록의 내용을 선택한 상태로
		local maxname = substituteString maxfileName ".max" ""
		local in_Dir = maxfilepath
		
		nameCK = in_Dir + "\\" + maxname + ".fbx"
		exportfile nameCK selectedOnly:true -- 추출 
	)
)
) --try, catch
createDialog AI_Root_pivot 296 350
