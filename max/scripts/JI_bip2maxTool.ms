

/*
JI_bip2maxTool.ms
since 2023.06.15
last updated 2024.03.20
by Jung-In, Park
jade2713@gmail.com

*/


try destroyDialog BipSaveLoad catch ()
	
(
	
	clearListener()
	global array_FileList = #()
	global array_TargetMaxFile = #()	
	global array_FileName = #()
	global in_Dir
	
	rollout BipSaveLoad "Biped Animation Export / Import" 
   (
	groupBox grp1 "FileList"  width:475 height:230 --pos:[10,10]
	groupBox grp2 "Save"  width:475 height:80	--pos:[10,210]
	groupBox grp3 "Target MaxFile"  width:475 height:51	--offset:[0,0]
------------------------------------------------------------------------------------------------------------------------------------------------ groupBox01
	
	button adddir "add Files..." pos: [20,25]
	label  filecount " ----- Files: 0 " width:60 height:15 pos:[100,30] style_sunkenedge:false 	
	button btn_remove "Remove" pos:[427,22]	   
	checkbox frame60_CB "60 frame" checked:true pos: [200,28]	
	checkbox SaveBip_CB "Save Bip" checked:true pos: [270,28]
	checkbox LoadBip_CB "Load Bip" pos: [340,28]

	--radioButtons 'rdoB' "" pos:[270,28] width:218 height:16 enabled:true labels:#("Save Bip", "Load Bip") default:1 columns:2 align:#left
	   
	multilistbox multibox_Files items:array_FileList width:462 height:13 offset:[7,2]
------------------------------------------------------------------------------------------------------------------------------------------------ groupBox02	
	button dirSaveOut_bn "..." pos: [20,260]
	edittext dirSaveOut "" text:"<Without Any Changes Files Save to Each Folder>"  width:375 height:20 pos: [50,260]	-- label dirSaveOut "C:\\"
	button reset_bn "RESET" pos:[430,260]
	button btn_openFolder "Open Folder" pos:[20,290]	
	--button btn_SaveBip "Save" pos:[320,290] width:75
	button btn_SaveLoadBip "Run" pos:[402,290] width:75
	progressBar precesstime "ProgressBar" color:orange   width:475 height:10 pos:[13,385]
	
------------------------------------------------------------------------------------------------------------------------------------------------ groupBox03	
	button adddir_targetMax "TargetMaxFile" pos:[20,347]	
	multilistbox multibox_TargetMax items:array_TargetMaxFile width:372 height:1.5 pos:[110, 348]	
	   
	fn FileCounter filename_array multibox_Files fileNum filecount = 
	(
		filename_array = #()
		for fbxitemlist = 1 to  multibox_Files.items.count do
		(
			filesname = multibox_Files.items[fbxitemlist] + "\*.max" -- 3dmax file dir
			filesname = getFiles filesname -- 3dmax file array 
			print filesname
			filename_array = filename_array + filesname
		)
		fileNum = filename_array.count
		filecount.caption = " Files : " + (fileNum as string)
	)
	
	fn filenumbers fcount filecount =
	(
		fcount = array_FileList.count
		if fcount != 0 then (filecount.caption = " Files : " + fcount as string) else (filecount.caption = "Files : 0" ) 
	)
	
		fn _makeFileName itemFile = --풀네임에서 이름값만 뽑기
	(
		itempath = getFilenamepath itemFile
		itemName = getfilenamefile itemFile
		itemName = itemName
		return itemName
	)
	
	
	
	
	mapped fn Display_ByObject_ByLayer node state: =
	(
		if isValidNode node do node.displaybylayer = state
	)
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	on adddir pressed do -- 리스트 박스 항목 추가
	(
		comparioncount = 0 -- 같은 폴더 중복 등록 방지 카운터
		getmaxdir = getSavePath caption:"3D Max File 불러오기" initialDir:maxFilePath			
		
		
		if getmaxdir != undefined then
		(	
			if SaveBip_CB.checked == true  and LoadBip_CB.checked == false do
			(
				maxfiles = getmaxdir + "\*.max"
				getmaxfiles = getFiles maxfiles
			)
			
			if SaveBip_CB.checked == false  and LoadBip_CB.checked == true do
			(
				maxfiles = getmaxdir + "\*.bip"
				getmaxfiles = getFiles maxfiles
			)
				
			if SaveBip_CB.checked == false  and LoadBip_CB.checked == false do
			(
				messagebox "Save Bip, Load Bip 체크 버튼을 확인하세요." title:"알림"
				return false
			)
			
			if SaveBip_CB.checked == true  and LoadBip_CB.checked == true do
			(
				messagebox "Save Bip, Load Bip 체크 버튼을 확인하세요." title:"알림"
				return false
			)
											
			if getmaxdir != () do
			(
				for Dircomparison = 1 to multibox_Files.items.count do 
				(
					if getmaxdir == multibox_Files.items[Dircomparison] do
					(
						comparioncount = comparioncount + 1
					)
				)
				if comparioncount == 0 do
				(
					for i in getmaxfiles do
					(
						print i
						append array_FileList i
						
						
						if SaveBip_CB.checked == true  and LoadBip_CB.checked == false do
						(
							fileType = ".max"
						)
						
						if SaveBip_CB.checked == false  and LoadBip_CB.checked == true do
						(
							fileType = ".bip"
						)
						
						in_Dir = getFilenamepath maxfiles
						maxname = (_makeFileName i)
						maxname = maxname + fileType
						
						append array_FileName maxname
						multibox_Files.items = sort array_FileName
					)
										
				)
			)				
		
			filenumbers fcount filecount	
			startdir = getmaxdir
			precesstime.value = 1					
			return startdir
		)
		else()
	)
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ?? ????
    
	on dirSaveOut_bn pressed do 
			(
				getmaxdir = getSavePath caption:"FBX저장경로" initialDir:maxFilePath
				if getmaxdir != () do 
				(
					dirSaveOut.text = getmaxdir
					return true
				)
			 )
	
	on reset_bn pressed do
		(
			precesstime.value = 1
			if dirSaveOut.text != undefined do
			(
			dirSaveOut.text = "<Without Any Changes Files Save to Each Folder>"
			)
			filenumbers fcount filecount			
		)
	
	on btn_remove pressed do
	(
		
-- 		in_Dir = maxfilepath
-- 		in_Dir = (in_Dir + "\\")
		
		items = (multibox_Files.items as array)
		for o = (multibox_Files.items as array).count to 1 by -1 where ( findItem (multibox_Files.selection as array) o ) != 0 do deleteItem items o
        multibox_Files.items = items
	
		filenumbers fcount filecount
			
		
		
		print "-----in_Dir-----"
		print in_Dir
		print "-----array_Filelist 삭제 전 -----"
		print array_Filelist
		
		
		
		
		for i = 1 to items.count do 
		(
			items[i] = _makeFileName items[i]
			items[i] = in_Dir + items[i]
			
		)
		array_Filelist = items
		filenumbers fcount filecount	-- 이건 파일 갯수 확인해주는 녀석이지.


		print "----------Remove Button TEST :: array_filelist 삭제 후 -----------"
		print array_Filelist
	)
	
	on adddir_targetMax pressed do
	(
		comparioncount = 0 
		targetMaxdir = getSavePath caption:"3D Max File 불러오기" initialDir:maxFilePath		
	
		if targetMaxdir != undefined then
		(
			maxfiles = targetMaxdir + "\*.max"
			getmaxfiles = getFiles maxfiles
								
			if targetMaxdir != () do
			(
				for Dircomparison = 1 to multibox_TargetMax.items.count do
				(
					if targetMaxdir == multibox_TargetMax.items[Dircomparison] do
					(
						comparioncount = comparioncount + 1
					)
				)
				if comparioncount == 0 do
				(
					for i in getmaxfiles do
					(
						print i
						append array_TargetMaxFile i
					)
					multibox_TargetMax.items = sort array_TargetMaxFile		
				)
			)				
		
			filenumbers fcount filecount	
			startdir = targetMaxdir
			precesstime.value = 1					
			return startdir
		)
		else()
	)
	
	on btn_openFolder pressed do
	(
		print dirSaveOut
		if dirSaveOut.text != "<Without Any Changes Files Save to Each Folder>" then
		(
			shellLaunch dirSaveOut.text "c:\\"
		)
		else(messagebox "각각의 폴더로 저장되었습니다. 각각의 폴더를 확인하세요." title:"알림" )
		)
-------------------------------------------------------------------------------------------------------------------------------------------------------	
	on btn_SaveLoadBip pressed do 
	(
		
		
		if (checkForSave()) do 
		(
	    	resetMaxFile() #noPrompt
		    precesstime.value = 1
		    filename_array = #()
	
			if SaveBip_CB.checked == true then
			(
					for filesmax = 1 to array_FileList.count do
					(	
						loadMaxFile (array_FileList[filesmax] ) missingExtFilesAction:#logmsg useFileUnits:true quiet:true 	
				
						if dirSaveOut.text == "<Without Any Changes Files Save to Each Folder>" then
						(
							getmaxdir = getFilenamePath array_FileList[filesmax]
						)
						else
						(
							getmaxdir = dirSaveOut.text
						)								
					
						if frame60_CB.checked == true then
						(	
							rate = 60
							framerate = rate 
						)
						else
						(	
							rate = 30
							framerate = rate 
						)
							
						bipName = getFileNameFile array_FileList[filesmax]
						savebipName =  getmaxdir + "\\" + bipName + ".bip"				
					
						------------------ 왜 remove를 누르면 컨트롤러를 찾지 못 할까 ????
						local bip = getNodeByName "bip001"
						biped.saveBipFile bip.Controller savebipName
					
						
						
						
						
						end_a = animationRange.End
						start_a = animationRange.Start					
						animationRange = interval start_a end_a
				
						p = array_FileList.count as float
						i = (filesmax + 1) as float
						precesstime.value = 100.*i/p							
					)
				
				
			)
			else
			(
				if array_TargetMaxFile[1] != undefined then (
					
					for filesmax = 1 to array_FileList.count do
					(	
						if array_TargetMaxFile[1] != undefined then
						(
						
							loadMaxFile (array_TargetMaxFile[1] ) missingExtFilesAction:#logmsg useFileUnits:true quiet:true
						)
						else
						(
							messagebox "타겟 파일이 없습니다."
						)
												
				
						if dirSaveOut.text == "<Without Any Changes Files Save to Each Folder>" then
						(
							getmaxdir = getFilenamePath array_FileList[filesmax]
						)
						else
						(
							getmaxdir = dirSaveOut.text
						)								
					
						if frame60_CB.checked == true then
						(	
							rate = 60
							framerate = rate 
						)
						else
						(	
							rate = 30
							framerate = rate 
						)					
						
							loadBipName = getFileNameFile array_FileList[filesmax]
							saveFileName =  getmaxdir + "\\" + loadBipName + ".Max"
						
						
						animationRange = interval 0 1
						
						local bip = $Bip001
						bip.transform.controller.figureMode = false
						biped.loadBipFile bip.controller array_FileList[filesmax]
						/*	
						end_a = animationRange.End
						start_a = animationRange.Start
						sliderTime = start_a
						animationRange = interval start_a end_a
						*/
						saveMaxFile saveFileName
				
						p = array_FileList.count as float
						i = (filesmax + 1) as float
						precesstime.value = 100.*i/p							
					)
				)
				else (
					messagebox "타겟 파일이 없습니다. "
				)
			)
	
			print array_FileList.count				
			messagebox "작업이 종료 되었습니다." title:"알림"					
			print "완료"
		)
	)	
	)
)
createDialog BipSaveLoad 500 410
