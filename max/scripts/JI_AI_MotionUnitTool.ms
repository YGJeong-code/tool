

/*
JI_AI_MotionUnitTool.ms
since 2023.07.13
last updated 2024.07.16
by Jung-In, Park
jade2713@gmail.com
*/
	
	
try DestroyDialog AI_MotionUnit_script	catch()
(
	global array_filelist = #()	
	global array_filelistMax = #()
	global selTemp = #()
	
	--local rootBone = getNodeByName "Root"
	--local bipedRoot = getNodeByName "Bip001"

	
	local in_Dir = maxfilepath
	local path_String = maxfilepath as string --�������� 'listpath'
	local selBiped = #()
	local Astart = animationrange.start
	local Aend = animationrange.end
	

	
	
	-------------- �Ѿƿ����� ����� �Լ��� �Ѿƿ� ���� ����.
	-------------- ��Ƽ����Ʈ�ڽ��� ���� ������ ���� ���� �־���� ����.
	
	fn fn_startFileListItem dirName fileTypeString wildCardString = 
	(
		files = undefined
		--files_name = #()
		
		if wildCardString == undefined or wildCardString == "" do 
			wildCardString = "*" 
			files = getFiles (dirName+"\\" + wildCardString + "." + fileTypeString)
			--                      ��� \\ **.max
			
		
		for i=1 to files.count do 
			(
				file_name = getfilenamefile files[i] + ".max"
				file_type = getfilenametype files[i]
				append array_filelist file_name
				append array_filelistMax files[i]
			)
			
			return array_filelist		--����Ʈ�� ���� ���� �̸� �迭
	)
	

	
	
	
rollout AI_MotionUnit_script "AI_MotionUnit" 
(

	
	GroupBox 'grp1' "Buttons" pos:[8,8] width:448 height:80 align:#left
	GroupBox 'grp2' "List" pos:[7,96] width:448 height:296 align:#left
	GroupBox 'grp3' "Batch" pos:[8,400] width:448 height:184 align:#left
	
	
	button 'Bs_MakeR' "Make Root" pos:[16,24] width:88 height:24 align:#left
	button 'Bs_delR' "Delete Root" pos:[16,56] width:88 height:24 align:#left
	button 'Bs_Move2zero' "(0, 0, 0)" pos:[112,24] width:88 height:24 toolTip:"���� ��ġ ���� ��ü �������� �̵�, ���̾� ������." align:#left
--	button 'Bs_Rename' "Rename" pos:[112,56] width:88 height:24 align:#left
-- 	button 'Bs_rescale' "rescale" pos:[208,24] width:88 height:24 toolTip:"���� �ڽ��� �Է°� ��ŭ ��������, ���̾� ������." align:#left
--	button 'Bs_rotation' "rotation" pos:[208,56] width:88 height:24 toolTip:"���� �ڽ��� �Է°� ��ŭ ��������" align:#left
	
	
	button 'Bs_MakeZeroRoot' "Make 'Zero' Root" pos: [112,56] width:88 height:24 toolTip:"��ǿ� ���� ����, 0���� ������ ��Ʈ���� ����" align:#left
	
	button 'Bs_Export' "Export" pos:[360,24] width:88 height:24 toolTip:"���� ���ϸ� Fbx�� ����" align:#left
	button 'Bs_saveAs' "save as" pos:[360,56] width:88 height:24 toolTip:"������ ���� '_00'�� �ٿ� ����" align:#left
	
-- 	edittext 'edt_rescaleVal' ""text: "1" pos:[296,26] width:38 height:20 align:#left 
 
	
	
	--multilistbox 'lbx2' "" pos:[16,144] width:344 height:15 align:#left
	multilistbox 'list_Max' "" pos:[16,140] items: (fn_startFileListItem in_Dir "max" "**") width:240 height:16 align:#left
	--multilistbox 'list_Max' "" pos:[16,140] items:array_filelist width:240 height:16 align:#left
	multilistbox 'list_Bone' "" pos:[264,140] width:184 height:16 align:#left
	
	
	
	button 'BList_addFiles' "+ Max Files..." pos:[16,112] width:80 height:24 toolTip:"�ƽ������� �ִ� ������ ����" align:#left
	button 'BList_addBones' "+ Export Bone..." pos:[352,112] width:96 height:24 toolTip:"������ ���� �����ϰ� ����Ʈ ��" align:#left
	button 'BList_RemoveFiles' "Remove" pos:[16,360] width:56 height:24 toolTip:"" align:#left
--	button 'BList_addABone' "add" pos:[350,360] width:40 height:24 toolTip:"���õ� ���� ���� ��Ͽ� �߰� �մϴ�." align:#left
	button 'BList_RemoveBones' "Remove" pos:[392,360] width:56 height:24 toolTip:"" align:#left
	
	
	
	button 'Bbatch_address' "..." pos:[16,552] width:32 height:24 toolTip:"�����θ� �����ϼ���." align:#left
	button 'Bbatch_reset' "reset" pos:[395,552] width:48 height:24 toolTip:"��� ����" align:#left
	button 'Bbatch_fbx' "export FBX" pos:[344,424] width:100 height:40 align:#left
	button 'Bbatch_max' "save MAX" pos:[344,472] width:100 height:40 align:#left
	button 'Bbatch_FolderOpen' "Folder Open" pos:[16,526] width:72 height:24 toolTip:"����� ������ ����" align:#left

	edittext 'edt_name' ""text: "" pos:[406,514] width:38 height:18 align:#left 
	edittext 'edt_dic' ""text:"<��� ������ ������ ���� ���� ��ο� ����˴ϴ�.>" pos:[48,552] width:336 height:24 align:#left
	
	
	

	checkbox 'chk_MakeR' "Make Root" pos:[16,424] width:88 height:16 checked:true align:#left
	checkbox 'chk_DelR' "delete Root" pos:[16,448] width:88 height:16 align:#left

	checkbox 'chk_SaveMax' "Save Max" pos:[200,424] width:88 height:16 enabled:true checked:false align:#left
	checkbox 'chk_Move2zero' "(0, 0)" pos:[200,448] width:88 height:16 enabled:true checked:false align:#left
	checkbox 'chk_pos0' "idle�� 0�� �ƴ� ��" pos:[200,472] width:130 height:16 enabled:true checked:false align:#left
-- 	checkbox 'chk_rescale' "rescale" pos:[120,424] width:60 height:16 enabled:true checked:false align:#left	
-- 	edittext 'edt_rescaleCB' ""text: "1" pos:[175,424] width:38 height:18 align:#left 
	
	
	checkbox 'chk_MakeZR' "Make Zero Root" pos:[16,472] width:98 height:16 align:#left
-- 	checkbox 'chk_rename' "Bone rename" pos:[120,496] width:88 height:16 align:#left
-- 	checkbox 'chk_rotate' "rotate -90" pos:[120,472] width:88 height:16 align:#left

-- 	checkbox 'chk_moveWP' "move WP Bone" pos:[233,424] width:104 height:16 checked:true align:#left
-- 	checkbox 'chk_grappling' "Grappling Bone" pos:[233,448] width:104 height:16 checked:true align:#left	
-- 	

	progressBar 'precesstime' "ProgressBar" pos:[8,592] width:448 height:8 color:(color 255 255 0) align:#left
	label 'lbl3' "jade2713" pos:[403,600] width:112 height:16 align:#left
	label 'filecount' "Files: 0 " pos:[80,368] width:60 height:20 style_sunkenedge:false align:#left 
 

	
	
	-----------------------------------------------------------------------------------------------------------------------      �Լ�

	-- ���� ���� �Լ���
	fn filenumbers fcount filecount =
	(
		fcount = array_filelist.count
		if fcount != 0 then (filecount.caption = " Files : " + fcount as string) else (filecount.caption = "Files : 0" ) 
	)

	fn FileCounter filename_array dirlist_fldr fileNum filecount = 
	(
		filename_array = #()
		for fbxitemlist = 1 to  lbx1.items.count do
		(
			filesname = lbx1.items[fbxitemlist] + "\*.max" -- max file dir
			filesname = getFiles filesname -- 3dmax file array 
			--print filesname
			filename_array = filename_array + filesname
		)
		fileNum = filename_array.count
		filecount.caption = " Files : " + (fileNum as string)
	)

	fn _makeFileName itemFile = --Ǯ���ӿ��� �̸����� �̱�
	(
		itempath = getFilenamepath itemFile
		itemName = getfilenamefile itemFile
		itemName = itemName + ".max"
		return itemName
	)

	fn _makeFullname _dir _string = (
		itemFile = (_dir + _string + "." + "max")
		return itemFile
	)
	
	-- ��ɵ�, ���۵�
	fn moveToOrigin =
	(
		
		local com = getNodeByName "Bip001"
		local layerNum = biped.numLayers com.controller
		-- �����е� ���̾� ���� ���ۿ�
		
		
		sliderTime = 0f
		
		if ( layerNum != 0 ) do ( 
			biped.setCurrentLayer com.controller 0 )
		-- �����е� ���̾� ������ 0�� �ƴ϶�� 0��°�� �����

		val_xyz = $'Bip001'.controller.horizontal.controller

		val_x = -(val_xyz.value[4][1] as float)
		val_y = -(val_xyz.value[4][2] as float)
		-- x, y ��ǥ�� (-)������ �޾Ƶ�

		com.controller.moveAllMode = true   --moveAllmode on
		move com [val_x, val_y, 0]
		
		biped.collapseMoveAllMode com.controller
		com.controller.moveAllMode = false    --moveAllmode off
		
		
		if ( layerNum != 0 ) do biped.setCurrentLayer com.controller layerNum
		-- ���� �� �����е� ���̾ 0���� �ֱ� ���̾� ��ȣ�� �Űܶ�
		

	)
	
	fn renameV =
	(

		if select $ValveBiped* != 0 do 
			(
				
				for obj in selection where matchPattern obj.name pattern:"ValveBiped*" do
					obj.name = substituteString obj.name "ValveBiped." ""
				
				for obj in selection where matchPattern obj.name pattern:"Bip01*" do
					obj.name = substituteString obj.name "Bip01" "Bip001"
			)
	)
	
	fn rescale =
	(
		com = getNodeByName "Bip001"
		layerNum = biped.numLayers com.controller
		
		if layerNum != 0 then
		(
			biped.collapseAtLayer com.controller 0
		)
		
		_val = (edt_rescaleCB.text) as float
		units.SystemType = #Centimeters
		-- �������� �ι�
		rescaleWorldUnits(_val)
		rescaleWorldUnits(1)
	)
	
	fn _Move_WPbone bipedRoot rootBone =
	(
		local bipedRoot = getNodeByName "Bip001"
		local rootBone = getNodeByName "root"
		
		RH_Move = getNodeByName "Anim_Attachment_RH_Move"
		LF_Move = getNodeByName "Anim_Attachment_LF_Move"
		LH_Move = getNodeByName "Anim_Attachment_LH_Move"
		
		-- ���� ���꺻�� �ִٸ�!
		if RH_Move != undefined do 
		(
			--���� �ֻ����� rootBone
			RH_Move.parent = $Root
			LF_Move.parent = $Root
			LH_Move.parent = $Root
			
			bipedRoot.parent = $Root
			$Root.boneEnable=true
			$Root.boneScaleType=#none
			$Root.boneAutoAlign=false
			-- rootBone.boneEnable=false
			-- �� ��� Correct Negative Stretch Ȯ�� �ʿ�.
		)

	)
	
	fn _Grappling_bone =
	(
		local _grappling = getNodeByName "Anim_Attachment_Grappling"
		local bipedRoot = getNodeByName "Bip001"
		local rootBone = getNodeByName "root"

		
		-- �׷��ø� ���� �ִٸ�!
		if _grappling != undefined do (

-- 			_grappling = Orientation_Constraint()
-- 			_grappling.constraints.appendTarget  rootBone 50
-- 			_grappling.constraints.relative false
-- 			
-- 			_grappling = Position_Constraint()
-- 			_grappling.constraints.appendTarget  rootBone 50
				
			_grappling.rotation.controller.Orientation_Constraint.controller.appendTarget rootBone 50
			_grappling.pos.controller.Position_Constraint.controller.appendTarget rootBone 50

			_grappling.pos = [0,0,0]
			_grappling.rotation = quat 0 0 0 1
		)
		
		--tempRootController.constraints.appendTarget bipedRoot 1.0
	)

	fn rotationX =
	(
		com = getNodeByName "Bip001"

		com.controller.moveAllMode = true
			
		rotate com (angleaxis 90.0 [0,0,1])
		biped.collapseMoveAllMode com.controller
			
		com.controller.moveAllMode = false
	)	

	-- ���̾� ��ĥ��
	fn layerCollapse  =
	(
		com = getNodeByName "Bip001"
		layerNum = biped.numLayers com.controller
		
		if layerNum != 0 then
		(
			biped.collapseAtLayer com.controller 0
		)
	)
	
	-- ���̾� �����Ҷ��� com, layerNum ���� �ҷ��ְ�
	-- �ֽ� ���̾� �ϳ��� ����
	fn layerDelete com layerNum =
	(
		if layerNum != 0 then (
		
		sliderTime = 0f

		--for i = 1 to layerNum do
		--(	
		biped.deleteLayer com.controller layerNum
			--layerNum = layerNum - 1
		--)
		)
		else (
			return 0
		)

	)
	
	fn MakeRoot =
	(	
		-- ��Ʈ�� ����, �ִ��۾�
		-- �����е��� ��ġ Ȯ��

		slidertime = 0f
		

		layer = LayerManager.getLayerFromName "Bone_No_Ani"
		local rootBone = BoneSys.createBone [ 0,0,0 ] [ 20,0,0 ] [ 0,0,1 ]
		rootBone.name = "root"
		layer.addNode rootBone -- "Bone_No_Ani ���̾ ��Ʈ�� �ֱ�"
		
		
		local bipedRoot = getNodeByName "Bip001"
		local horzController = bipedRoot.controller.horizontal.controller

		clearSelection()
		select rootBone
		

		-- 1. ��Ʈ�� ���̾ ���� �����.
		rootMotionLayerId = biped.numLayers bipedRoot.controller + 1
		biped.createLayer bipedRoot.controller rootMotionLayerId "RootMotionLayer"
		biped.setCurrentLayer bipedRoot.controller rootMotionLayerId
		
		
		
		

		
		if chk_pos0.checked == true then 
		(
			local dumR = Dummy()
			dumR.name = "dummy_root"
			
			local dumB = Dummy()
			dumB.name = "dummy_bip"
			
			local comN = getnodebyname "Bip001"
		
			animate on -- �� �� ���̷� �� ����
			(
		
				print "-------------------------------------------- call func"
		
				for i = Astart to Aend do-- ������ ���� �ݺ�
				(
					slidertime = i
					
					--���̷� �İ� �� ����.
					--dumR.transform = comN.transform
					dumB.transform = bipedRoot.transform
					dumR.transform = bipedRoot.transform
					
				)
			)
			

			slidertime = Astart
			dumR.rotation = eulerAngles 0 0 0
			dumR.pos = [0,0,0]
			-- dumR ���� ������

			deleteKeys $dummy_root.position.z_position.controller
			deleteKeys $dummy_root.rotation.x_rotation.controller
			deleteKeys $dummy_root.rotation.y_rotation.controller
			deleteKeys $dummy_root.rotation.z_rotation.controller
			-- ��Ʈ�� �� �����
			
			
			
			
			--���� �ֻ����� rootBone
			bipedRoot.parent = rootBone
			
			
			animate on
			(
		
				for i = Astart to Aend do
				(
					slidertime = i
					
					rootBone.transform = dumR.transform
					-- ���̵� �� com, rootbone�� ��°�� ����ũ.
				)
				
				for i = Astart to Aend do
				(
					slidertime = i
					
					biped.setTransform comN #pos dumB.transform.position true
					biped.setTransform comN #rotation dumB.transform.rotation true
					
					if dumB != undefined then (
						biped.setTransform comN #pos dumB.transform.position true
						biped.setTransform comN #rotation dumB.transform.rotation true
						)					
					-- ���̵� �� com, rootbone�� ��°�� ����ũ.
				)
				
				delete $dummy_root
				delete $dummy_bip
		
			)
		)
		else
		(

		--2. �� ���̾�� ���� ���� ǮŰ���.
		for t = animationRange.start to animationRange.end do
		(
			biped.addNewKey horzController t
		)

		
		
		-- bip001 ���̰� ���� �� addNewKey
		bipRootHoriKeys = bipedRoot.controller.horizontal.controller.keys

		rootBone.position.controller = Position_XYZ()
		
-- 			for i = 1 to bipRootHoriKeys.count do
-- 			(
-- 			   at time bipRootHoriKeys[i].time
-- 			   (
-- 					addNewKey rootBone.position.controller bipRootHoriKeys[i].time
-- 				)
-- 			)
		
		-- bip001�� ������ ����Ʈ���� �ϴ� tempRootController
		-- bipedRoot = Bip001�� getNodebyName
		local tempRootController = Position_Constraint()
		tempRootController.constraints.appendTarget bipedRoot 1.0
		
		-- com���� ���� ���� ������ ��Ʈ���� com���� ����
		animate on
		(
			for i = 1 to bipRootHoriKeys.count do
			(
				at time bipRootHoriKeys[i].time
				(
					rootBone.position.controller.value.x = tempRootController.value.x
					rootBone.position.controller.value.y = tempRootController.value.y
					rootBone.position.controller.value.z = 0.0 --Ÿ animate on�� �ִ� �༮. üũ�ڽ���(x,y,z)�� �Բ�
					
				)
			)
		)
		
		-- create biped layer 
		-- remove Bip001 X,Y keys
		-- collapse layer


		clearSelection()
		select bipedRoot
		
		horzController = bipedRoot.controller.horizontal.controller
		local rootBoneKeys = rootBone.position.controller.keys
		

		
		for i = 1 to rootBoneKeys.count do
		(
			at time rootBoneKeys[i].time
			(
				biped.addNewKey horzController rootBoneKeys[i].time
			)
		)
		   
		animate on
		(
			for i = 1 to rootBoneKeys.count do
			(  
				at time rootBoneKeys[i].time
				(
					newPos = horzController.value[4]
					newPos.x = 0.0
					newPos.y = 0.0
					   
					biped.setTransform bipedRoot #pos newPos false
				)
			)
		)
		-- ǮŰ �ƴ� ��ũ��Ʈ�� ���� "FBX Export Tool_20191203.ms"
		
		
			--���� �ֻ����� rootBone
			bipedRoot.parent = rootBone
		
		)
		   
		
		
		
		
		
		
		local ckLayer = biped.numLayers bipedRoot.controller
		if ckLayer > 1 then
		(
		
			
			for i = 1 to rootBoneKeys.count do
			(
				at time rootBoneKeys[i].time
				(
					biped.addNewKey horzController rootBoneKeys[i].time
				)
			)
			   
			animate on
			(
				for i = 1 to rootBoneKeys.count do
				(  
					at time rootBoneKeys[i].time
					(
						newPos = horzController.value[4]
						newPos.x = 0.0
						newPos.y = 0.0
						   
						biped.setTransform bipedRoot #pos newPos false
					)
				)
			)
		
			
			
		)

		
		rootbone = getnodebyname "root"
		return true
	)

	
	fn MakeZRoot =
	(	
		-- ��Ʈ�� ����, �ִ��۾�
		-- �����е��� ��ġ Ȯ��



		slidertime = Astart

			
		-- ��Ʈ���� �Ʒ� ���̾ �����մϴ�.
		--layer = LayerManager.getLayer 0
		local layer = LayerManager.getLayerFromName "Bone_No_Ani"

		
		
		local rootBone = BoneSys.createBone [ 0,0,0 ] [ 20,0,0 ] [ 0,0,1 ]
		rootBone.name = "root"
		layer.addNode rootBone -- "Bone_No_Ani ���̾ ��Ʈ�� �ֱ�"
		
		
		local bipedRoot = getNodeByName "Bip001"
		

			
		select rootBone
		

		-- 1. ��Ʈ�� ���̾ ���� �����.
		local rootMotionLayerId = biped.numLayers bipedRoot.controller + 1
		biped.createLayer bipedRoot.controller rootMotionLayerId "RootMotionLayer"
		biped.setCurrentLayer bipedRoot.controller rootMotionLayerId
		
	
		--���� �ֻ����� rootBone
		bipedRoot.parent = rootBone

	
			   
		return true
		
	)
	
	fn removeDuplicates arr =
	(
		print "------- call!!!"
		uniqueArr = #()
		for item in arr do
		(
			if findItem uniqueArr item == 0 do
			(
				append uniqueArr item
			)
		)
		
		uniqueArr
	)

 ------------------------------------------------------------------------ ��ư ���� �ൿ�� : Buttons
	on Bs_MakeR pressed do
	(
		--layerCollapse()
		
		local rBone = getNodeByName "root"
		local com = getNodeByName "Bip001"
		if (rBone != undefined) then (
			messagebox ("�̹� ��Ʈ���� �ֽ��ϴ�!?")
		)
		else (
			MakeRoot()
		)

	)	

	on Bs_delR pressed do -- ��Ʈ�� ���� �ൿ ���
	(
		com = getNodeByName "Bip001"
		layerNum = biped.numLayers com.controller
		rBone = getNodeByName "root"
	
				--��Ʈ�� �����
		if (rBone == undefined) then (
			messagebox ("���� ��Ʈ���� �����ϴ�?!")
		)
		else (
			layerDelete com layerNum
			sliderTime = 0f	
			delete $root
		)
	)
		
	on Bs_Move2zero pressed do -- �������� ������
	(
		moveToOrigin()
	)

	on Bs_Rename pressed do -- ������ ����
	(
		renameV()
		messagebox "Done!"
	)

	on Bs_rescale pressed do -- �������� ����
	(
		layerCollapse()
		
		_val = (edt_rescaleVal.text) as float
		-- ���ּ¾� �湮 ��
		units.SystemType = #Centimeters
		
		-- �������� �ι�
		rescaleWorldUnits(_val)
		rescaleWorldUnits(1)
	)

	on Bs_rotation pressed do
	(
		layerCollapse()
		rotationX()	
	)
	
	
	on Bs_MakeZeroRoot pressed do
	(
		
		local rBone = getNodeByName "root"
		local com = getNodeByName "Bip001"
		if (rBone != undefined) then (
			messagebox ("��Ʈ���� �̹� �ֳ׿�!?")
		)
		else (
			MakeZRoot()
		)
	
	)
	
	
	-- �������� ����
	on Bs_Export pressed do
	(
		--getMaxdir = getFilenamePath filename
		--filename = getFilenameFile filename
		
		if list_Bone.items.count == 0 then
		(messagebox "�ͽ���Ʈ �� ���� ��Ͽ� �߰����ּ���!")
		
		else (
		
		selTemp = #()
		for i in 1 to (list_Bone.items.count) do
		(
			btemp = getNodeByName list_Bone.items[i]
			append selTemp btemp
			selTemp = removeDuplicates selTemp
		)	
		
		print "-------------BS_Export 2�� �� ����Ʈ -----------"
		print selTemp
			
		select selTemp -- ����� ������ ������ ���·�
			

		local maxname = substituteString maxfileName ".max" ""
		--maxname = substituteString maxfileName ".Max" " "


			--local maxname = substituteString maxfileName ".max" " "	-- ".max"�� ���� //230705
			
			print "--------------"
			print maxname 
			
			
			nameCK = in_Dir + "\\" + maxname + ".fbx"
			exportfile nameCK selectedOnly:true -- ���� 
		)
	)
	
	on Bs_saveAs pressed do
	(
		local maxnameCk = undefined 
		maxnameCK = substituteString maxfileName ".max" ""
		local destinationFileEX =  in_Dir + "\\" + maxnameCk + "_00.max"
		
		saveMaxFile(destinationFileEX)
	)
	
--------------------------------------------------------------------------------------- ��ư ���� �ൿ�� : BList
	on BList_addFiles pressed do -- ����Ʈ �ڽ��� ���� �߰�
	(
		files_Max = #()
		files_Max_name = #()
		in_Dir = getSavePath caption:"MAX File �ҷ�����" initialDir: in_Dir
		--local in_Dir = maxfilepath
		
		
		if in_Dir == undefined do
			in_Dir = maxfilepath
		
		
		in_Dir = (in_Dir + "\\")
		--format "%\n" in_Dir
		files_Max = getFiles (in_Dir + "\*.max") -- ������ �ƽ����� ����
		
		
		if in_Dir == theDirDefault and files_Max == undefined do continue
			for i = 1 to files_Max.count do
			(
				append array_filelistMax files_Max[i]
				append files_Max_name (_makeFileName files_Max[i]) --�����̸� ����� �Լ� ȣ��
				)
		
		--print in_Dir
		--edtT_IN_path.text = in_Dir
		list_Max.items = files_Max_name
	)

	-- ������ ���� ����Ʈ ��
	on BList_addBones pressed do
	(
		selBiped = #() --reset
		
		selBiped = selection as array
		
		
		listup = sort(for i in selBiped collect i.name) -- �� �̸��� ����
		listup = removeDuplicates listup -- �ߺ�����
		
		list_Bone.items = listup
		print "-------------------------list's bone list-------------------------"
		print listup
		
-- 		for i in 1 to (list_Bone.items.count) do
-- 		(
-- 			btemp = getNodeByName list_Bone.items[i]
-- 			append selTemp btemp
-- 			selTemp = removeDuplicates selTemp
-- 		)

		--select selTemp
-- 		print "-------------------------addBones's bone list-------------------------"
-- 		print selTemp
	)

	

	
	
	
	
	------------------------------------------------------------------ remove ��ư�� ( �ƽ����� ����Ʈ, �� ����Ʈ )
	on BList_RemoveBones pressed do 
	(
		items = (list_Bone.items as array)
		for o = (list_Bone.items as array).count to 1 by -1 where ( findItem (list_Bone.selection as array) o ) != 0 do deleteItem items o
        list_Bone.items = items
	)

		on BList_RemoveFiles pressed do 
	(
		items = (list_Max.items as array)
		for o = (list_Max.items as array).count to 1 by -1 where ( findItem (list_Max.selection as array) o ) != 0 do deleteItem items o
        list_Max.items = items
		
		in_Dir = maxfilepath
		in_Dir = (in_Dir + "\\")
		
		
		for i = 1 to items.count do 
		(
			items[i] = _makeFileName items[i]
			items[i] = in_Dir + items[i]
		)
		array_filelistMax = items
		
-- 		print "---------------------------------Array FilelistMax items-------"
-- 		print array_filelistMax
-- 		print "-------------------------------------listBox's items----------"
-- 		print list_Max.items
-- 		print "------------------------------------------------------------"
-- 	
		filenumbers fcount filecount	
	)

	---------------------------------------------------------------- ����Ʈ �ڽ� ���� �ൿ��
	on list_Max doubleClicked nameIndex do -- ����Ʈ�� �ƽ� ����Ŭ���ϸ� �ε��϶�.
	(
		
		--loadMaxFile (array_filelist[nameIndex])
		filename = list_Max.items[nameindex]
		
		--local in_Dir = maxfilepath
		--fn_maybe_LoadFile in_Dir file_max_name "max"
		
		filename = getfilenameFile filename
		if getfilenamepath in_Dir == "" do
			in_Dir = maxfilepath
		if (getfilenamepath in_Dir) != "" do
			in_Dir = in_Dir + "\\"
		
		filename = in_Dir + filename + "." + "max"
		--print "Check4Save"
		
		loadMaxFile filename useFileunits:true quiet:true
	)
	
	on Bbatch_FolderOpen pressed do
	(
		--print edt_dic
		if edt_dic.text != "<��� ������ ������ ���� ���� ��ο� ����˴ϴ�.>" then (
			shellLaunch edt_dic.text "c:\\" )
		else (messagebox "������ �������ּ���." title:"Notice")
	)
	
	on Bbatch_address pressed do
	(
		getAdd = getSavePath caption: "..." initialDir: maxFilePath
		if getAdd != () do
		(
			edt_dic.text = getAdd
			return true
		)
	)
	
	on Bbatch_reset pressed do
	(
		if edt_dic.text != undefined do (
			edt_dic.text = "<��� ������ ������ ���� ���� ��ο� ����˴ϴ�.>"
			)
			filenumbers fcount filecount
	)

	
	
	------------------------------------------------------------------------ ��ġ ���� �ൿ�� : Batch buttons
	on Bbatch_fbx pressed do
	(
		
		#noPrompt
		

		--Pluginmanager.loadclass FBXExporter
		if list_Bone.items.count == 0 then
		(messagebox "�ͽ���Ʈ �� ���� ��Ͽ� �߰����ּ���!")

		else (
			
		if (checkForSave()) do
		(
			--resetMaxFile() #noPrompt
			precesstime.value = 1
			--filename_array = #()
					
			-- ���ϸ�ϵ��� ����.
			for i = 1 to array_filelistMax.count do 
			(
				filelistMax = array_filelistMax[i] as string
				loadMaxFile filelistMax missingExtFilesAction:#logmsg useFileUnits:true quiet:true -- �ε� �ƽ�����

				local com = getNodeByName "Bip001"
				local rBone = getNodeByName "root"
				local layerNum = biped.numLayers com.controller
				
								
				if chk_DelR.checked == true then
				(
					--��Ʈ�� �����
					if rBone != undefined then (
						
						layerDelete com layerNum
						--biped.deleteLayer com.controller layerNum
						sliderTime = 0f	
						delete $root
					)
				)

				if chk_Move2zero.checked == true then
				(
					--���� ������
					moveToOrigin()
				)
			
-- 				if chk_rescale.checked == true then
-- 				(
-- 					--layerCollapse()
-- 					rescale()
-- 				)
-- 				
				if chk_MakeR.checked == true then
				(
					if (rBone != undefined) then (
						--���� ��Ʈ���� �ִٸ� ����������
						
						--messagebox ("��Ʈ���� �ִ�?!")
						sliderTime = 0f
						layerDelete com layerNum
						delete $root
						
						--���� ������.
						MakeRoot()
						
					)
					else (
						MakeRoot()
					)

				)
				
				if chk_MakeZR.checked == true then
				(
					if (rBone != undefined) then (
						--���� ��Ʈ���� �ִٸ� ����������
						
						--messagebox ("��Ʈ���� �ִ�?!")
						sliderTime = 0f
						layerDelete com layerNum
						delete $root
						
						--���� ������.
						MakeZRoot()
						
					)
					else (
						MakeZRoot()
					)

				)
				
				if chk_SaveMax.checked == true then
				(
					if edt_dic.text == "<��� ������ ������ ���� ���� ��ο� ����˴ϴ�.>" then (
					getMaxdir = getFileNamePath array_filelistMax[1]
					)
					else (
						getMaxdir = edt_dic.text
					)
					print getMaxdir
					

					nameCK = getFilenameFile array_filelistMax[i]
					print nameCK
					
					if edt_name.text != undefined then (
						editName = edt_name.text
						destinationFileEX = getMaxdir + "\\" + nameCK + editName + ".max"
						saveMaxFile destinationFileEX
					)
					else
					(
						destinationFileEX = getMaxdir + "\\" + nameCK + ".max"
						saveMaxFile destinationFileEX
					)
				)
				
				
				
			
			timeDisplayMode = #frames
			
				-- ������ ��� ������ ����
				if edt_dic.text == "<��� ������ ������ ���� ���� ��ο� ����˴ϴ�.>" then 
					(
						getMaxdir = getFileNamePath array_filelistMax[i]
					)
				else 
					(
						getMaxdir = edt_dic.text
					)
				print getMaxdir

				---------------------------------------------------------------------------------------------------------------	
				nameCK = getFilenameFile array_filelistMax[i]
					print nameCK
				---------------------------------------------------------------------------------------------------------------
				destinationFileEX = getMaxdir + "\\" + nameCK + ".fbx"

					
				selTemp = #() --�迭 ����
				for i in 1 to (list_Bone.items.count) do
				(
					btemp = getNodeByName list_Bone.items[i]
					append selTemp btemp
				)
				
				-- export �� ��Ͽ� root�� �����ٸ� �߰����ֱ�.
				if list_Bone.items != rBone then (
					rBone = getnodebyname "root"
					append selTemp rBone 
					)
					
					
				selTemp = removeDuplicates selTemp -- �ߺ�ó��
				print "-------------------------batch export bone list-------------------------"
				print selTemp -- Ȯ��
					
					
					
				select selTemp -- ����� ������ ������ ���·�

				-- ù ���Ͽ����� ������Ʈ ����
				if i == 1 then 
				(
					exportfile destinationFileEX selectedOnly:true --using:FBXEXP -- ����
				)
				else
				(
					exportfile destinationFileEX #noPrompt selectedOnly:true --using:FBXEXP -- ����
				)
			
-- 			else if list_Bone.items.count == 0 then
-- 			(messagebox "���õ� ���� �����ϴ�?!")
			
				p = array_filelist.count as float
				j = (i + 1) as float
				precesstime.value = 100.*i/p
				
		)--for
		messagebox "fbx ������ �Ϸ��մϴ�." title: "Notice"

		)	--if check for save
	)
	)

	on Bbatch_max pressed do
	(
		
		

	if (checkForSave()) do
	(
		--resetMaxFile() #noPrompt
		precesstime.value = 1
		--filename_array = #()

				
		-- ���ϸ�ϵ��� ����.
		for i = 1 to array_filelistMax.count do 
		(
			filelistMax = array_filelistMax[i]
			loadMaxFile filelistMax missingExtFilesAction:#logmsg useFileUnits:true quiet:true -- �ε� �ƽ�����
		

			local com = getNodeByName "Bip001"
			local rBone = getNodeByName "root"
			local layerNum = biped.numLayers com.controller

			
			
			if chk_DelR.checked == true then
			(
				--��Ʈ�� �����
				if rBone != undefined then (
					
					layerDelete com layerNum
					--biped.deleteLayer com.controller layerNum
					sliderTime = 0f	
					delete $root
				)
			)
			
			
-- 			if chk_Move2zero.checked == true then
-- 			(
-- 				--���� ������
-- 				moveToOrigin()
-- 			)

-- 			if chk_rescale.checked == true then
-- 			(
-- 				--layerCollapse()
-- 				rescale()
-- 			)
-- 			


			if chk_MakeR.checked == true then
			(
				
				if (rBone != undefined) then (
					--���� ��Ʈ���� �ִٸ� ����������
					
					--messagebox ("��Ʈ���� �ִ�?!")
					sliderTime = 0f
					layerDelete com layerNum
					delete $root
					
					--���� ������.
					MakeRoot()
				)
				else (
					MakeRoot()
				)
				
			)

			if chk_MakeZR.checked == true then
			(
				if (rBone != undefined) then (
					--���� ��Ʈ���� �ִٸ� ����������
					
					--messagebox ("��Ʈ���� �ִ�?!")
					sliderTime = 0f
					layerDelete com layerNum
					delete $root
					
					--���� ������.
					MakeZRoot()
					
				)
				else (
					MakeZRoot()
				)
				
				
-- 				
-- 				if chk_moveWP.checked == true then
-- 				(
-- 				--���⺻ ����
-- 					_Move_WPbone com rBone
-- 				)
-- 				if chk_grappling.checked == true then
-- 				(
-- 				--�׷��ø��� ����
-- 					_Grappling_bone()
-- 				)
			)

			
			timeDisplayMode = #frames
			
			
			
	
			
			if edt_dic.text == "<��� ������ ������ ���� ���� ��ο� ����˴ϴ�.>" then (
				getMaxdir = getFileNamePath array_filelistMax[1]
			)
			else (
				getMaxdir = edt_dic.text
			)
			print getMaxdir
			

			nameCK = getFilenameFile array_filelistMax[i]
			print nameCK
			
			if edt_name.text != undefined then (
				editName = edt_name.text
				destinationFileEX = getMaxdir + "\\" + nameCK + editName + ".max"
				saveMaxFile destinationFileEX
			)
			else
			(
				destinationFileEX = getMaxdir + "\\" + nameCK + ".max"
				saveMaxFile destinationFileEX
			)
			
			p = array_filelist.count as float
			j = (i + 1) as float
			precesstime.value = 100.*j/p
			
		) --for��
		messagebox ("max ���� �Ϸ�!")
	)

	)

)
) -- try catch

CreateDialog AI_MotionUnit_script 464 616