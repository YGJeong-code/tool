

/*
JI_bvh2bip2maxTool.ms
since 2023.03.22
last updated 2024.01.11
by Jung-In, Park
jade2713@gmail.com

*/


try destroyDialog Bvh_loader catch ()

(	
	clearListener()
	global array_filelist = #()
	global array_filelistMax = #()
	global array_filelist2 = #()
	global array_filelistMax2 = #()	
	
	rollout Bvh_loader "Bvh Load Tool ----------- for NV" 
   (
	groupBox grp1 "BvhFileList"  width:475 height:205 --pos:[10,10]
	groupBox grp2 "SaveTo"  width:475 height:80	--pos:[10,210]
	groupBox grp3 "GoTo MAX"  width:475 height:210	--pos:[10,300] -------------- �׷�ڽ� �߰�
	groupBox grp4 "Save To"  width:475 height:80	--pos:[10,300]
	   
	   
	button adddir_bn "+Bvh Files..." pos: [20,25]	
	button selectMax_bn "Select Target File" pos: [20,50]
	button adddir_bn2 "+Bip Files..." pos: [20, 325] -------------- ��ư�߰�
	button selectMax_bn2 "Select Target File" pos: [20,350]   
	
	   
	multilistbox dirlist_fldr items:array_filelist width:462 height:9 pos:[20, 80]
	multilistbox dirlist_fldrMax items:array_filelistMax width:350 height:1 pos: [130, 50]
	label  filecount " ----- Files: 0 " width:60 height:20 pos:[120,29] style_sunkenedge:false 
	   
	   
	multilistbox dirlist_fldr2 items:array_filelist2 width:462 height:9 pos:[20, 380]--------------- ��Ƽ�ڽ� �߰�
	multilistbox dirlist_fldrMax2 items:array_filelistMax2 width:350 height:1 pos: [130, 351]
--	label  filecount2 " ----- Files: 0 " width:60 height:20 pos:[120,325] style_sunkenedge:false -------------- �� �̰� ��ġ���ļ� ����.
	   
	
	checkbox saveMaxFile_CB "Save MaxFile" checked:false pos: [200,28]
	checkbox moveToOrigin_CB "Move to Origin" checked:false pos: [290,28]
	
	checkbox saveMaxFile_CB2 "Save MaxFile" checked:true pos: [200,325]
	
	button btn_remove "Remove" pos:[427,25]	
	button btn_Bvh_loader "Load" pos:[402,265] width:75
	------------***
	button btn_remove2 "Remove" pos:[427,325] -------------- ��ư�߰�	
	button btn_Bip_loader "save" pos:[402,565] width:75
	------------***
	button dirSaveOut_bn "..." pos: [20,235]
	edittext dirSaveOut "" text:"<Without Any Changes Files Save to Each Folder>"  width:375 height:20 pos: [50,235]	-- label dirSaveOut "C:\\"   
	button reset_bn "RESET" pos:[430,235]
	button Exbtn3 "Open Folder" pos:[20,265]	
	
	------------***
	button dirSaveOut_bn2 "..." pos: [20,535] -------------- ��ư�߰�	
	edittext dirSaveOut2 "" text:"<Without Any Changes Files Save to Each Folder>"  width:375 height:20 pos: [50,535]	-- label dirSaveOut "C:\\"   
	button reset_bn2 "RESET" pos:[430,535]
	button Exbtn32 "Open Folder" pos:[20,565]	
	------------***
	
	
	label madeby " by. kt ( j) " width:60 height:20 pos:[13,600] style_sunkenedge:false 
	progressBar precesstime "ProgressBar" color:orange   width:475 height:10 pos:[13,620]
	   
	fn FileCounter filename_array dirlist_fldr fileNum filecount = 
	(
		filename_array = #()
		for fbxitemlist = 1 to  dirlist_fldr.items.count do
		(
			filesname = dirlist_fldr.items[fbxitemlist] + "\*.bvh" -- bvh file dir
			filesname = getFiles filesname -- 3dmax file array 
			print filesname
			filename_array = filename_array + filesname
		)
		fileNum = filename_array.count
		filecount.caption = " Files : " + (fileNum as string)
	)
	
	fn bipSetOrigin =  -- biped �������� ������
	(
		biped.createLayer $Bip001.controller 1 "origin"
				
		veticalController = $Bip001.controller.vertical.controller				
		newPos = veticalController.value[4]			
				
		newPos.x = 0
		newPos.y = 0				
				
		biped.setTransform $Bip001 #pos newPos on
		biped.collapseAtLayer $Bip001.controller 0
	)
	
	fn filenumbers fcount filecount =
	(
		fcount = array_filelist.count
		if fcount != 0 then (filecount.caption = " Files : " + fcount as string) else (filecount.caption = "Files : 0" ) 
	)
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	on adddir_bn pressed do -- ����Ʈ �ڽ� �׸� �߰�
	(
		comparioncount = 0 -- ���� ���� �ߺ� ��� ���� ī����
		getBvhdir = getSavePath caption:"Bvh File �ҷ�����" initialDir:maxFilePath		

		if getBvhdir != undefined then
		(
			Bvhfiles = getBvhdir + "\*.bvh"
			getBvhfiles = getFiles Bvhfiles			
								
			if getBvhdir != () do -- undefind �ƴϸ� ����
			(
				for Dircomparison = 1 to dirlist_fldr.items.count do -- ���� ���� �ߺ�����
				(
					if getBvhdir == dirlist_fldr.items[Dircomparison] do
					(
						comparioncount = comparioncount + 1
					)
				)
				if comparioncount == 0 do
				(
					for i in getBvhfiles do
					(
						print i
						append array_filelist i
					)
					dirlist_fldr.items = sort array_filelist						-- ����Ʈ �������ؼ� ����Ʈ�ڽ�.item ���� ����
				)
			)
			
			filenumbers fcount filecount	
			startdir = getBvhdir
			precesstime.value = 1					
			return startdir
		)else()
	)
	
	on selectMax_bn pressed do -- ����Ʈ �ڽ� �׸� �߰�
	(
		comparioncount = 0 -- ���� ���� �ߺ� ��� ���� ī����
		getTargetFiledir = getSavePath caption:"Select Target File Path"		

		if getTargetFiledir != undefined then
		(
			maxfiles = getTargetFiledir + "\*.max"
			getmaxfiles = getFiles maxfiles	
								
			if getTargetFiledir != () do -- undefind �ƴϸ� ����
			(
				for Dircomparison = 1 to dirlist_fldrMax.items.count do -- ���� ���� �ߺ�����
				(
					if getmaxdir == dirlist_fldrMax.items[Dircomparison] do
					(
						comparioncount = comparioncount + 1
					)
				)
				if comparioncount == 0 do
				(
					for i in getmaxfiles do
					(
						print i
						append array_filelistMax i
					)
					dirlist_fldrMax.items = sort array_filelistMax -- ����Ʈ �������ؼ� ����Ʈ�ڽ�.item ���� ����
				)
			)							
			
			filenumbers fcount filecount	
			startdir = getTargetFiledir
			precesstime.value = 1					
			return startdir
		)else()
	)					
		
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			
	on dirSaveOut_bn pressed do -- ����Ʈ �ڽ� �׸� �߰�
	(
		getBvhdir = getSavePath caption:"Max������" initialDir:maxFilePath
		if getBvhdir != () do -- undefind �ƴϸ� ����
		(
			dirSaveOut.text = getBvhdir
			return true
		)
	 )
	
	on reset_bn pressed do -- ����Ʈ �ڽ� �׸� �߰�
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
		items = (dirlist_fldr.items as array)
		for o = (dirlist_fldr.items as array).count to 1 by -1 where ( findItem (dirlist_fldr.selection as array) o ) != 0 do deleteItem items o
        dirlist_fldr.items = items
		filenumbers fcount filecount			
	)
	
	on Exbtn3 pressed do
	(
		print dirSaveOut
		if dirSaveOut.text != "<Without Any Changes Files Save to Each Folder>" then
		(
			shellLaunch dirSaveOut.text "c:\\"
		)
		else(messagebox "������ ������ ����Ǿ����ϴ�. ������ ������ Ȯ���ϼ���." title:"�˸�" )
	)
	
	on btn_Bvh_loader pressed do 
	(
		if (checkForSave()) do 
		(
			resetMaxFile() #noPrompt
			precesstime.value = 1
			filename_array = #()		
		      
			for filesbvh = 1 to array_filelist.count do
			(
				loadMaxFile (array_filelistMax[1] ) missingExtFilesAction:#logmsg useFileUnits:true quiet:true -- �ε� �ƽ�����				
				
				biped.loadMocapFile $Bip001.controller (array_filelist[filesbvh])  -- Load Mocap File
				framerate = 60
				
				if dirSaveOut.text == "<Without Any Changes Files Save to Each Folder>" then
				(
					getBvhdir = getFilenamePath array_filelist[filesbvh]
				)
				else
				(
					getBvhdir	= dirSaveOut.text
				)
				
				Bvhname = getFilenameFile array_filelist[filesbvh]				
				destinationFile =  getBvhdir + "\\" + Bvhname + ".max"							
				BipFilename =  getBvhdir + "\\" + Bvhname + ".bip"
				
				if moveToOrigin_CB.checked == true then
				(
					bipSetOrigin()
				)
				
				biped.saveBipFile $Bip001.controller BipFilename -- save Bip File
				
				if saveMaxFile_CB.checked == true then
				(
					saveMaxFile destinationFile
				)
				
				p = array_filelist.count as float
				i = (filesbvh + 1) as float
				precesstime.value = 100.*i/p
			)			
		
			print array_filelist.count
			messagebox "Bvh �� Load �Ǿ����ϴ�." title:"�˸�"
			print "�Ϸ�"
		)		
	)
	
	
	
	
	
	
		------------------------------------------------------------------�������������� �߰��Ԥ�����------------------------------------------------------------------------------------------------------
	
	on adddir_bn2 pressed do -- ����Ʈ �ڽ� �׸� �߰�
	(
		comparioncount = 0 -- ���� ���� �ߺ� ��� ���� ī����
		getBipdir = getSavePath caption:"bip File �ҷ�����" initialDir:maxFilePath		

		if getBipdir != undefined then
		(
			Bipfiles = getBipdir + "\*.bip"
			getBipfiles = getFiles Bipfiles			
								
			if getBipdir != () do -- undefind �ƴϸ� ����
			(
				for Dircomparison = 1 to dirlist_fldr2.items.count do -- ���� ���� �ߺ�����
				(
					if getBipdir == dirlist_fldr2.items[Dircomparison] do
					(
						comparioncount = comparioncount + 1
					)
				)
				if comparioncount == 0 do
				(
					for i in getBipfiles do
					(
						print i
						append array_filelist2 i
					)
					dirlist_fldr2.items = sort array_filelist2						-- ����Ʈ �������ؼ� ����Ʈ�ڽ�.item ���� ����
				)
			)
		
			filenumbers fcount filecount	
			startdir = getBipdir
			precesstime.value = 1					
			return startdir
		)else()
	)
	
	on selectMax_bn2 pressed do -- ����Ʈ �ڽ� �׸� �߰�
	(
		comparioncount = 0 -- ���� ���� �ߺ� ��� ���� ī����
		getTargetFiledir = getSavePath caption:"Select Target File Path"		

		if getTargetFiledir != undefined then
		(
			maxfiles = getTargetFiledir + "\*.max"
			getmaxfiles = getFiles maxfiles	
								
			if getTargetFiledir != () do -- undefind �ƴϸ� ����
			(
				for Dircomparison = 1 to dirlist_fldrMax2.items.count do -- ���� ���� �ߺ�����
				(
					if getmaxdir == dirlist_fldrMax2.items[Dircomparison] do
					(
						comparioncount = comparioncount + 1
					)
				)
				if comparioncount == 0 do
				(
					for i in getmaxfiles do
					(
						print i
						append array_filelistMax2 i
					)
					dirlist_fldrMax2.items = sort array_filelistMax2 -- ����Ʈ �������ؼ� ����Ʈ�ڽ�.item ���� ����
				)
			)							
			
			filenumbers fcount filecount	
			startdir = getTargetFiledir
			precesstime.value = 1					
			return startdir
		)else()
	)
	
	
	on dirSaveOut_bn2 pressed do -- ����Ʈ �ڽ� �׸� �߰�
	(
		getBipdir = getSavePath caption:"Max������" initialDir:maxFilePath
		if getBipdir != () do -- undefind �ƴϸ� ����
		(
			dirSaveOut2.text = getBipdir
			return true
		)
	 )
	 
	on reset_bn2 pressed do -- ����Ʈ �ڽ� �׸� �߰�
	(			
		precesstime.value = 1
		if dirSaveOut2.text != undefined do
		(
		dirSaveOut2.text = "<Without Any Changes Files Save to Each Folder>"
		)
		filenumbers fcount filecount
	)	 

	on btn_remove2 pressed do
	(		
		items = (dirlist_fldr2.items as array)
		for o = (dirlist_fldr2.items as array).count to 1 by -1 where ( findItem (dirlist_fldr2.selection as array) o ) != 0 do deleteItem items o
        dirlist_fldr2.items = items
		filenumbers fcount filecount			
	)	
	
	on Exbtn32 pressed do
	(
		print dirSaveOut2
		if dirSaveOut2.text != "<Without Any Changes Files Save to Each Folder>" then
		(
			shellLaunch dirSaveOut2.text "c:\\"
		)
		else(messagebox "������ ������ ����Ǿ����ϴ�. ������ ������ Ȯ���ϼ���." title:"�˸�" )
	)
	

	
	
		on btn_Bip_loader pressed do 
	(
		if (checkForSave()) do 
		(
			resetMaxFile() #noPrompt
			precesstime.value = 1
			filename_array = #()		
		      
			for filesbip = 1 to array_filelist2.count do
			(
				loadMaxFile (array_filelistMax2[1] ) missingExtFilesAction:#logmsg useFileUnits:true quiet:true -- �ε� �ƽ�����				
				
				vip = $'Bip001'.controller -------------------------------------undefine!!!!!!!
				biped.loadBipFile vip (array_filelist2[filesbip])  -- Load bip File
				
				if dirSaveOut2.text == "<Without Any Changes Files Save to Each Folder>" then
				(
					getBipdir = getFilenamePath array_filelist2[filesbip]
				)
				else
				(
					getBipdir	= dirSaveOut2.text
				)
				
				Bipname = getFilenameFile array_filelist2[filesbip]				
				destinationFile =  getBipdir + "\\" + Bipname + ".max"							
				BipFilename =  getBipdir + "\\" + Bipname + ".bip"
				

				
				if saveMaxFile_CB2.checked == true then
				(
					saveMaxFile destinationFile
				)
				
				p = array_filelist2.count as float
				i = (filesbip + 1) as float
				precesstime.value = 100.*i/p
			)			
		
			print array_filelist2.count
			messagebox "bip �� ���������ϴ� X-D" title:"�˸�"
			print "�Ϸ�"
		)		
	)
	
	------------------------------------------------------------------������� ��------------------------------------------------------------------------------------------------------
	
	
		
)
)
createDialog Bvh_loader 500 640  ------------------ ��üũ�� ���� --------------------