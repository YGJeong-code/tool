
/*
JI_MotionUnitTool.ms
since 2023.07.13
last updated 2024.07.23
by Jung-In, Park
jade2713@gmail.com

박정인 - PC용 MotionUnitTool 버그 수정 : 루트본에 더미 값 복사 안되던 문제
*/




try DestroyDialog JI_MotionUnitTool	catch()
(
	global array_filelist = #()	
	global array_filelistMax = #()
	global selTemp = #()
	global selBiped = #()
	
	global in_Dir = maxfilepath
	global path_String = maxfilepath as string --다중이의 'listpath'
	
	

	
	-------------- 롤아웃에서 사용할 함수라 롤아웃 위에 선언.
	-------------- 멀티리스트박스에 현재 파일의 폴더 내용 넣어놓고 시작.
	
	fn fn_startFileListItem dirName fileTypeString wildCardString = 
	(
		-- dirName = in_Dir , fileTypeString = "max" , wildCardString = "**"
		local files = #()
		
		if wildCardString == undefined or wildCardString == "" do 
			wildCardString = "*" 
			files = getFiles (dirName + "\\" + wildCardString + "." + fileTypeString)
			--                      경로 \\ **.max
			
		
		for i=1 to files.count do 
			(
				file_name = getfilenamefile files[i] + ".max"
				file_type = getfilenametype files[i]
				append array_filelist file_name
				append array_filelistMax files[i]
			)
			
			return array_filelist		--리스트에 쓰일 파일 이름 배열
	)

	
rollout JI_MotionUnitTool "MotionUnit    [  For PCM, PCF ]" 
(
	GroupBox 'grp1' "Buttons" pos:[8,8] width:448 height:80 align:#left
	GroupBox 'grp2' "List" pos:[7,96] width:448 height:296 align:#left
	GroupBox 'grp3' "Batch" pos:[8,400] width:448 height:184 align:#left
	
	button 'Bs_MakeR' "Make Root" pos:[16,24] width:88 height:24 align:#left
	button 'Bs_Export' "Export" pos:[360,24] width:88 height:24 toolTip:"현재 파일만 Fbx로 추출" align:#left
	button 'Bs_saveAs' "save as" pos:[360,56] width:88 height:24 toolTip:"파일의 끝에 '_00'을 붙여 저장" align:#left

	multilistbox 'list_Max' "" pos:[16,140] items: (fn_startFileListItem in_Dir "max" "**") width:240 height:16 align:#left
	multilistbox 'list_Bone' "" pos:[264,140] width:184 height:16 align:#left
	
	button 'BList_addFiles' "+ Max Files..." pos:[16,112] width:80 height:24 toolTip:"맥스파일이 있는 폴더를 선택" align:#left
	button 'BList_addBones' "+ Export Bone..." pos:[352,112] width:96 height:24 toolTip:"추출할 본을 선택하고 리스트 업" align:#left
	button 'BList_RemoveFiles' "Remove" pos:[16,360] width:56 height:24 toolTip:"" align:#left
	button 'BList_RemoveBones' "Remove" pos:[392,360] width:56 height:24 toolTip:"" align:#left

	button 'Bbatch_address' "..." pos:[16,552] width:32 height:24 toolTip:"저장경로를 선택하세요." align:#left
	button 'Bbatch_reset' "reset" pos:[395,552] width:48 height:24 toolTip:"경로 리셋" align:#left
	button 'Bbatch_fbx' "export FBX" pos:[344,424] width:100 height:40 align:#left
	button 'Bbatch_max' "save MAX" pos:[344,472] width:100 height:40 align:#left
	button 'Bbatch_FolderOpen' "Folder Open" pos:[16,526] width:72 height:24 toolTip:"경로의 폴더를 오픈" align:#left

	edittext 'edt_name' ""text: "" pos:[406,514] width:38 height:18 align:#left 
	edittext 'edt_dic' ""text: "<Without Any Changes Files Save to Each Folder>" pos:[48,552] width:336 height:24 align:#left
	
	checkbox 'chk_MakeR' "Make Root" pos:[16,424] width:88 height:16 checked:true align:#left
	checkbox 'chk_SaveMax' "Save Max" pos:[200,424] width:88 height:16 checked:false align:#left
	
	progressBar 'precesstime' "ProgressBar" pos:[8,592] width:448 height:8 color:(color 255 255 0) align:#left
	label 'filecount' "Files: 0 " pos:[80,368] width:60 height:20 style_sunkenedge:false align:#left 
	label 'lbl3' "jade2713" pos:[403,600] width:112 height:16 align:#left
 

	--	button 'TEST_button' "TEST" pos:[16,360] width:56 height:24 toolTip:"" align:#left

	
	----------------------------------------------------------------------------------------      함수

	-- 파일 관련 함수들
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

	fn _makeFileName itemFile = --풀네임에서 이름값만 뽑기
	(
		itempath = getFilenamepath itemFile
		itemName = getfilenamefile itemFile
		itemName = itemName + ".max"
		return itemName
	)

	fn _makeFullname _dir _string = 
	(
		itemFile = (_dir + _string + "." + "max")
		return itemFile
	)

	-- 레이어 합칠때
	fn layerCollapse  =
	(
		com = getNodeByName "Bip001"
		layerNum = biped.numLayers com.controller
		
		if layerNum != 0 then
		(
			biped.collapseAtLayer com.controller 0
		)
	)
	
	-- 레이어 삭제할때는 com, layerNum 같이 불러주고
	-- 최신 레이어 하나만 삭제
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
	
	fn removeDuplicates arr =
	(
		-- print "------- call!!!"
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

		
	
	

	
 ------------------------------------------------------------------------ 버튼 관련 행동들 : Buttons
	on Bs_MakeR pressed do
	(

		local rootBone = getNodeByName "root"
		local com = getNodeByName "pt_pelvis"
		local Astart = animationRange.start
		local Aend = animationRange.end
		
		if $'dummy_root' != undefined then
		(
			delete $'dummy_root'
			)
		
			dumR = Dummy()
			dumR.name = "dummy_root"
		
		
		animate on
		(
	
			for i = Astart to Aend do-- 프레임 구간 반복
			(
				slidertime = i

				--더미로 컴값 다 복사.
				dumR.transform = com.transform
			)
			
		)
		
		
		slidertime = 0
		dumR.rotation = eulerAngles 0 0 0
		dumR.pos = [0,0,0]

		
		deleteKeys dumR.position.z_position.controller
		deleteKeys dumR.rotation.controller
		
		animate on
		(
			for i = Astart to Aend do
			(
				slidertime = i
				rootBone.transform = dumR.transform
			)
		)

		--rootBone.transform = dumR.transform

		delete dumR
		clearSelection()




-- 		-- 아래 체크박스 상태 확인 후 동작.
-- 		-- 무기본 정리와 그래플링본 정리
-- 		if chk_moveWP.checked == true then
-- 		(
-- 			--무기본 정리
-- 			_Move_WPbone com rBone
-- 		)
-- 		if chk_grappling.checked == true then
-- 		(
-- 			--그래플링본 정리
-- 			_Grappling_bone()
-- 		)
	)	

	-- 현재파일 추출
	on Bs_Export pressed do
	(
		--getMaxdir = getFilenamePath filename
		--filename = getFilenameFile filename
		
		if list_Bone.items.count == 0 then
		(messagebox "익스포트 할 본을 목록에 추가해주세요!")
		
		else (
		
			selTemp = #()
			for i in 1 to (list_Bone.items.count) do
			(
				btemp = getNodeByName list_Bone.items[i]
				append selTemp btemp
				selTemp = removeDuplicates selTemp
			)	
			
			print "-------------BS_Export 2차 본 리스트-----------"
			print selTemp
				
			select selTemp -- 목록의 내용을 선택한 상태로
				

			local maxname = substituteString maxfileName ".max" ""
			print "--------------maxname------------"
			print maxname 
			
			
			nameCK = in_Dir + "\\" + maxname + ".fbx"
			exportfile nameCK selectedOnly:true -- 추출 
		)
	)

	on Bs_saveAs pressed do
	(
		local maxnameCk = undefined 
		maxnameCK = substituteString maxfileName ".max" ""
		local destinationFileEX =  in_Dir + "\\" + maxnameCk + "_00.max"
		
		saveMaxFile(destinationFileEX)
	)
	
--------------------------------------------------------------------------------------- 버튼 관련 행동들 : BList
	on BList_addFiles pressed do -- 리스트 박스에 폴더 추가
	(
		files_Max = #()
		files_Max_name = #()

		
		in_Dir = getSavePath caption:"MAX File 불러오기" initialDir: in_Dir

		if in_Dir == undefined do (
			in_Dir = maxfilepath)

		in_Dir = (in_Dir + "\\")
		files_Max = getFiles (in_Dir + "\*.max") -- 폴더내 맥스파일 얻어내기
			
		if in_Dir == theDirDefault and files_Max == undefined do continue
			for i = 1 to files_Max.count do
			(
				
				files_Max_name[i] =_makeFileName files_Max[i] --파일이름 만드는 함수 호출
				array_filelistMax[i] = files_Max[i]
				
				)
		
		--print in_Dir
		--edtT_IN_path.text = in_Dir
		list_Max.items = files_Max_name

		print "===========addFile files_Max==========="
		print files_Max_name
		print "===========addFile array_fileslistMax==========="
		print array_filelistMax
				

	)

	-- 선택한 본들 리스트 업
	on BList_addBones pressed do
	(
		selBiped = #() --reset
		selBiped = selection as array
		
		listup = sort(for i in selBiped collect i.name) -- 본 이름만 저장
		listup = removeDuplicates listup -- 중복제거
		
		list_Bone.items = listup
	)

------------------------------------------------------------------ remove 버튼들 ( 맥스파일 리스트, 본 리스트 )
	on BList_RemoveBones pressed do 
	(
		items = (list_Bone.items as array)
		for o = (list_Bone.items as array).count to 1 by -1 where ( findItem (list_Bone.selection as array) o ) != 0 do deleteItem items o
        list_Bone.items = items
	)
	
	on BList_RemoveFiles pressed do 
	(
		local items = (list_Max.items as array)
		local items_Rename = #()	
		for o = (list_Max.items as array).count to 1 by -1 where ( findItem (list_Max.selection as array) o ) != 0 do deleteItem items o
        
		
		in_Dir = maxfilepath
		in_Dir = (in_Dir + "\\")
	
		for i = 1 to items.count do 
		(
			items[i] = _makeFileName items[i]
			items[i] = in_Dir + items[i]
			items_Rename[i] = _makeFileName items[i]
			array_filelist = items_Rename
			
		)
		array_filelistMax = items
		list_Max.items = items_Rename
-- 		array_filelist = array_filelistMax
		

		
		filenumbers fcount filecount	-- 이건 파일 갯수 확인해주는 녀석이지.


		print "----------Remove Button TEST :: array_filelist -----------"
		print array_filelist
		print "----------Remove Button TEST :: array_filelistMax -----------"
		print array_filelistMax

	)

	
	---------------------------------------------------------------- 리스트 박스 관련 행동들
	on list_Max doubleClicked nameIndex do -- 리스트에 맥스 더블클릭하면 로드하라.
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
		if edt_dic.text != "<Without Any Changes Files Save to Each Folder>" then (
			shellLaunch edt_dic.text "c:\\" )
		else (messagebox "폴더를 지정해주세요." title:"Notice")
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
			edt_dic.text = "<Without Any Changes Files Save to Each Folder>"
			)
			filenumbers fcount filecount
	)

	

	
	------------------------------------------------------------------------ 배치 관련 행동들 : Batch buttons
	on Bbatch_fbx pressed do
	(
		#noPrompt

		if list_Bone.items.count == 0 then
		(messagebox "익스포트 할 본을 목록에 추가해주세요!")

		else (
	
			if (checkForSave()) do
			(
				
				precesstime.value = 1
						
				-- 파일목록동안 진행.
				for i = 1 to array_filelist.count do 
				(
				
					loadMaxFile array_filelistMax[i] missingExtFilesAction:#logmsg useFileUnits:true quiet:true -- 로드 맥스파일

					print "\n ~~~~~~~~~~~ array_fileListMax ~~~~~~~~~~~~ "
					print array_filelistMax[i]

					local com = getNodeByName "Bip001"
					local rBone = getNodeByName "root"
					local layerNum = biped.numLayers com.controller

					-- 루트본 만들기 체크 되어있다면 루트본 만들어 주고
					if chk_MakeR.checked == true then
					(
						local Astart = animationRange.start
						local Aend = animationRange.end	
						local rootBone = getNodeByName "root"
						local com = getNodeByName "pt_pelvis"
						
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
				
						deleteKeys dumR.position.z_position.controller
						deleteKeys dumR.rotation.controller
				
						animate on
						(
					
							for i = Astart to Aend do
							(
								slidertime = i
				
								rootBone.transform = dumR.transform
							)
							
						)
				
						delete dumR
						
						slidertime = 0f
						clearSelection()
					)
					if chk_SaveMax.checked == true then
					(
						if edt_dic.text == "<Without Any Changes Files Save to Each Folder>" then (
						getMaxdir = maxFilePath
						)
						else (
							getMaxdir = edt_dic.text
						)
						print "\n -----------------------save Max-----------getMaxdir :::: "
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
							
					)




					timeDisplayMode = #frames
				
					-- 지정한 경로 빼오는 동작
					if edt_dic.text == "<Without Any Changes Files Save to Each Folder>" then 
					(
						getMaxdir = maxFilePath
					)
					else 
					(
						
						getMaxdir = edt_dic.text
					)
					print "\n -----------------------Export FBX-----------getMaxdir :::: "
					print getMaxdir


					---------------------------------------------------------------------------------------------------------------	
					nameCK = getFilenameFile array_filelistMax[i]
						print nameCK
					---------------------------------------------------------------------------------------------------------------
					destinationFileEX = getMaxdir + "\\" + nameCK + ".fbx"

						
					selTemp = #() --배열 리셋
					for i in 1 to (list_Bone.items.count) do
					(
						btemp = getNodeByName list_Bone.items[i]
						append selTemp btemp
					)
					
					-- export 본 목록에 root가 없었다면 추가해주기.
					if list_Bone.items != rBone then (
						rBone = getnodebyname "root"
						append selTemp rBone 
						)
					else if list_Bone.items.count == 0 then (
						messagebox "선택된 본이 없습니다?!")
								
						
					selTemp = removeDuplicates selTemp -- 중복처리
					--print "-------------------------batch export bone list-------------------------"
					--print selTemp -- 확인
						
						
						
					select selTemp -- 목록의 내용을 선택한 상태로

					-- fbx 추출.
					if i == 1 then 
					(
						exportfile destinationFileEX selectedOnly:true --using:FBXEXP -- 추출
					)
					else
					(
						exportfile destinationFileEX #noPrompt selectedOnly:true --using:FBXEXP -- 추출
					)
				
				
					/*
					
					-- max 저장.
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
					
					*/
					
					
				
					p = array_filelist.count as float
					i += 1
					j = i as float
					precesstime.value = 100.*i/p
					
				)--for



			messagebox "fbx 추출을 완료합니다." title: "Notice"

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

					
			-- 파일목록동안 진행.
			for i = 1 to array_filelistMax.count do 
			(
				filelistMax = array_filelistMax[i]
				loadMaxFile filelistMax missingExtFilesAction:#logmsg useFileUnits:true quiet:true -- 로드 맥스파일
			

				local com = getNodeByName "Bip001"
				local rBone = getNodeByName "root"
				local layerNum = biped.numLayers com.controller


				if chk_MakeR.checked == true then
				(
					
					local Astart = animationRange.start
					local Aend = animationRange.end	
					local rootBone = getNodeByName "root"
					local com = getNodeByName "pt_pelvis"
					
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
			
					deleteKeys dumR.position.z_position.controller
					deleteKeys dumR.rotation.controller
			
					animate on
					(
				
						for i = Astart to Aend do
						(
							slidertime = i
			
							rootBone.transform = dumR.transform
						)
						
					)
			
					delete dumR

					slidertime = 0f
					clearSelection()


				)

				timeDisplayMode = #frames
				
			
				
		
				
				if edt_dic.text == "<Without Any Changes Files Save to Each Folder>" then (
					getMaxdir = maxFilePath
				)
				else (
					getMaxdir = edt_dic.text
				)
				print "\n -----------------------save Max-----------getMaxdir :::: "
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
				
			) --for문
			messagebox ("max 저장 완료!")
		)

	
	)
)

)-- try catch

CreateDialog JI_MotionUnitTool 464 616
