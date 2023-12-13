/*
YG_fileTool
since 2023.11.10
last updated 2023.12.04
by YeonGyun,Jeong
lupinxyz@gmail.com
*/

myVersion = "v1.0"
myMainFolder = ""
myFolder = ""
myFile = ""
	
try( destroydialog YG_fileTool ) catch()

rollout YG_fileTool "YG_fileTool v1.0" width:528 height:320
(
	listbox 'list_category_1' "Category1" pos:[8,8] width:96 height:10 align:#left
	listbox 'list_category_2' "Category2" pos:[112,8] width:96 height:10 align:#left
	listbox 'list_category_3' "Category3" pos:[216,8] width:96 height:10 align:#left
	listbox 'list_category_4' "Category4" pos:[320,8] width:96 height:10 align:#left
	listbox 'list_category_5' "Category5" pos:[424,8] width:96 height:10 align:#left
	
	spinner 'spn_category3' "" pos:[216,168] width:96 height:16 range:[1,999,1] type:#integer scale:1 align:#left
	spinner 'spn_category4' "" pos:[320,168] width:96 height:16 range:[1,999,1] type:#integer scale:1 align:#left
	spinner 'spn_category5' "" pos:[424,168] width:96 height:16 range:[1,999,1] type:#integer scale:1 align:#left
	
	edittext 'text_FolderPath' "Folder" pos:[8,192] width:512 height:24 align:#left

	radiobuttons 'rdo_Prefix' "" pos:[15,224] width:295 height:16 labels:#("SM", "Rig", "Proxy", "FBX") columns:5 align:#left
	edittext 'text_fileName' "File" pos:[8,249] width:512 height:24 align:#left

	button 'btn_openFolder' "Open Folder" pos:[8,280] width:128 height:32 align:#left
	button 'btn_openFile' "Open File" pos:[136,280] width:128 height:32 align:#left
	button 'btn_saveFile' "Save File" pos:[264,280] width:128 height:32 align:#left
	button 'btn_exportFBX' "Export FBX" pos:[392,280] width:128 height:32 align:#left

--------------------------------------------------------------------------------------------------------
--function-------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
	fn selectCategory=
	(
		--category1
		mylist_category_1 = #("PC", "Outfit", "Monster")
		-- mylist_category_1 = #("PC", "NPC", "Monster")
		list_category_1.items = mylist_category_1
		
		--category2
		if list_category_1.selected == "PC" then
		(
			mylist_category_2 = #("BaseBody_PCF", "BaseBody_PCM", "PC_Hair", "Fiona", "Lethita", "", "", "", "")
			myMainFolder = "Z:\VindictusGFX\Content\VindictusRoot\Character\Player\\"
		)
		if list_category_1.selected == "Outfit" then
		(
			mylist_category_2 = #("PCF_Outfit", "PCM_Outfit", "", "", "", "", "", "", "")
			myMainFolder = "Z:\VindictusGFX\Content\VindictusRoot\Character\Outfit\\"
		)
		-- if list_category_1.selected == "NPC" then
		-- (
		-- 	mylist_category_2 = #("NPC_Face", "NPC_Outfit", "NPC_Weapon")
		-- 	myMainFolder = "Z:\VindictusGFX\Content\VindictusRoot\Character\NPC\\"
		-- )
		if list_category_1.selected == "Monster" then
		(
			mylist_category_2 = #("Gnoll","Goblin","Kobold", "", "", "", "", "", "")
			-- mylist_category_2 = #("Gnoll", "Goblin", "Kobold")
			myMainFolder = "Z:\VindictusGFX\Content\VindictusRoot\Character\Monster\\"
		)
		list_category_2.items = mylist_category_2
		
		--category3
		mylist_category_3 = #("")
		if list_category_2.selected == "Fiona" or list_category_2.selected == "Lethita" then
		(
			mylist_category_3 = #("Armor", "Face", "Weapon")
		)
		if list_category_2.selected == "PC_Hair" then
		(
			mylist_category_3 = #("PCF_Hair", "PCM_Hair", "")
		)
		if list_category_1.selected == "Monster" then
		(
			mylist_category_3 = #("Public", "Type", "")
		)
		if list_category_2.selected == "BaseBody_PCF" or list_category_2.selected == "BaseBody_PCM" then
		(
			mylist_category_3 = #("", "Face", "Foot", "Hand", "Lower", "Upper")
		)
		list_category_3.items = mylist_category_3

		--category4
		mylist_category_4 = #("")
		if list_category_3.selected == "Type" then
		(
			mylist_category_4 = #("Public", "Normal", "Elite", "FieldBoss", "NamedBoss", "TribeBoss")
		)
		if list_category_3.selected == "Face" then
		(
			mylist_category_4 = #("", "Hair")
		)
		list_category_4.items = mylist_category_4
		if list_category_3.selected == "Armor" then
		(
			mylist_category_4 = #("", "Foot", "Hand", "Head", "Lower", "Upper")
		)
		list_category_4.items = mylist_category_4
		
		--category5
		mylist_category_5 = #("")
		if list_category_1.selected == "PC" then
		(
			mylist_category_5 = #("01","02","03","04","05","06","07","08","09","10")
		)
		if list_category_1.selected == "Monster" then
		(
			mylist_category_5 = #("", "Weapon", "", "", "", "", "", "", "", "")
		)
		if list_category_1.selected == "Outfit" then
		(
			mylist_category_5 = #("", "Foot", "Hand", "Head", "Lower", "Upper")
		)
		list_category_5.items = mylist_category_5
		
		--folder path & file naming
		myPrefix = case rdo_Prefix.state of
		(
			1: "SM_"
			2: "Rig_"
			3: "Proxy_"
			4: "SK_"
		)

		mySubfix = ".max"
		if rdo_Prefix.state == 4 then
		(
			mySubfix = ".fbx"
		)

		myFolder = myMainFolder + list_category_2.selected + "\Model"
		myFile = myPrefix + list_category_2.selected + mySubfix

		if list_category_3.selected != "" and list_category_3.selected != undefined then
		(
			-- print (list_category_3.selected)
			myFolder = myMainFolder + list_category_2.selected + "\\" + list_category_3.selected + "\Model"

			if list_category_3.selected == "Type" then
			(
				temp3 = list_category_3.selected + spn_category3.value as string

				spn4 = formattedPrint YG_fileTool.spn_category4.value format:"02d"
				temp4 = list_category_4.selected + spn4

				myFolder = myMainFolder + list_category_2.selected + "\\" + temp3 + "\\" + temp4 + "\Model"
			)

			if list_category_2.selected == "BaseBody_PCF" or list_category_2.selected == "BaseBody_PCM" then
			(
				myFolder = myMainFolder + list_category_2.selected + "\Model"
			)

			myFile = myPrefix + list_category_2.selected + "_" + list_category_3.selected + list_category_5.selected + mySubfix
		)
		if list_category_1.selected == "Outfit" then
		(
			spn3 = formattedPrint YG_fileTool.spn_category3.value format:"03d"
			-- spn4 = formattedPrint YG_fileTool.spn_category4.value format:"03d"

			if list_category_2.selected == "PCF_Outfit" then
			(
				myFolder = myMainFolder + list_category_2.selected + "\PCF_" + spn3 + "\Model"
			)
			else
			(
				myFolder = myMainFolder + list_category_2.selected + "\PCM_" + spn3 + "\Model"
			)
			
		)
		if list_category_2.selected == "PC_Hair" then
		(
			myFile = myPrefix + list_category_3.selected + list_category_5.selected + mySubfix
		)
		if list_category_2.selected == "BaseBody_PCF" then
		(
			myFile = myPrefix + "PCF_BaseBody" + list_category_5.selected + mySubfix

			if list_category_3.selected != "" then
			(
				myFile = myPrefix + "PCF_" + list_category_3.selected + list_category_5.selected + mySubfix
			)
		)
		if list_category_2.selected == "BaseBody_PCM" then
		(
			myFile = myPrefix + "PCM_BaseBody" + list_category_5.selected + mySubfix

			if list_category_3.selected != "" then
			(
				myFile = myPrefix + "PCM_" + list_category_3.selected + list_category_5.selected + mySubfix
			)
		)
		if list_category_3.selected == "Type" then
		(
			spn4 = formattedPrint YG_fileTool.spn_category4.value format:"02d"
			myFile = myPrefix + list_category_2.selected + "_" + list_category_3.selected + spn_category3.value as string + "_" + list_category_4.selected + spn4 + mySubfix
			if list_category_5.selected != "" then
			(
				spn5 = formattedPrint YG_fileTool.spn_category5.value format:"02d"
				myFile = myPrefix + list_category_2.selected + "_" + list_category_3.selected + spn_category3.value as string + "_" + list_category_4.selected + spn4 + "_" + list_category_5.selected + spn5 + mySubfix
			)
		)
		if list_category_3.selected == "Armor" then
		(
			myFile = myPrefix + list_category_2.selected + "_" + list_category_4.selected + list_category_5.selected + mySubfix

			if list_category_4.selected == "" then
			(
				myFile = myPrefix + list_category_2.selected + "_" + list_category_3.selected + list_category_5.selected + mySubfix
			)
		)
		if list_category_3.selected == "Face" then
		(
			myFile = myPrefix + list_category_2.selected + "_" + list_category_4.selected + list_category_5.selected + mySubfix

			if list_category_4.selected == "" then
			(
				myFile = myPrefix + list_category_2.selected + "_" + list_category_3.selected + list_category_5.selected + mySubfix
			)
		)
		if list_category_1.selected == "Outfit" then
		(
			spn3 = formattedPrint YG_fileTool.spn_category3.value format:"03d"
			-- spn4 = formattedPrint YG_fileTool.spn_category4.value format:"03d"

			myGender = "PCF"
			if list_category_2.selected == "PCM_Outfit" then
			(
				myGender = "PCM"
			)

			myFile = myPrefix + myGender + "_" + spn3 + mySubfix
			
			if list_category_5.selected != "" then
			(
				spn5 = formattedPrint YG_fileTool.spn_category5.value format:"02d"
				myFile = myPrefix + myGender + "_" + spn3 + "_" + list_category_5.selected + spn5 + mySubfix
			)
		)
		
		-- text
		YG_fileTool.text_folderPath.text = myFolder
		YG_fileTool.text_fileName.text = myFile
	)
--------------------------------------------------------------------------------------------------------
--button-------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------	
	on YG_fileTool open do
	(
		gc()
		clearListener()
		selectCategory()
	)
	on list_category_1 selected sel do
		selectCategory()
	on list_category_2 selected sel do
		selectCategory()
	on list_category_3 selected sel do
		selectCategory()
	on list_category_4 selected sel do
		selectCategory()
	on list_category_5 selected sel do
		selectCategory()
	on spn_category3 changed val do
		selectCategory()
	on spn_category4 changed val do
		selectCategory()
	on spn_category5 changed val do
		selectCategory()
	on rdo_Prefix changed stat do
		selectCategory()
	on btn_openFolder pressed do
		ShellLaunch myFolder ""
	on btn_openFile pressed do
	(
		theName = getMAXOpenFileName filename:(myFolder + "\\" + myFile)
		
		print("foler : " + myFolder)
		print("file : " + myFile)
	
		if theName != undefined then
			loadMaxFile theName
		else print("file no")
	)
	on btn_saveFile pressed do
	(
		if doesDirectoryExist myFolder then
		(
			print(myFolder + " ---> exist")
		)
		else
		(
			print(myFolder + " ---> make folder")
			makeDir myFolder all:true
		)
		
		theName = getMAXSaveFileName filename:(myFolder + "\\" + myFile)
		if theName != undefined do saveMaxFile theName
	)
	on btn_exportFBX pressed  do
	(
		--Geometry------------------------------------------------------------------------
		FBXExporterSetParam "SmoothingGroups" true
		FBXExporterSetParam "NormalsPerPoly" false
		FBXExporterSetParam "TangentSpaceExport" true
		FBXExporterSetParam "SmoothMeshExport" false
		FBXExporterSetParam "Preserveinstances" false
		FBXExporterSetParam "SelectionSetExport" false
		FBXExporterSetParam "GeomAsBone" true
		FBXExporterSetParam "ColladaTriangulate" false
		FBXExporterSetParam "PreserveEdgeOrientation" false
		--Animation------------------------------------------------------------------------
		FBXExporterSetParam "Animation" false
		--Cameras------------------------------------------------------------------------
		FBXExporterSetParam "Cameras" false
		--Lights------------------------------------------------------------------------
		FBXExporterSetParam "Lights" false
		--Embed Media--------------------------------------------------------------------
		FBXExporterSetParam "EmbedTextures" false
		--Units----------------------------------------------------------------------------
		FBXExporterSetParam "ConvertUnit" "cm"
		--Axis Conversion-----------------------------------------------------------------
		FBXExporterSetParam "AxisConversionMethod" "None"
		FBXExporterSetParam "UpAxis" "Z"
		--UI----------------------------------------------------------------
		FBXExporterSetParam "ShowWarnings" false
		FBXExporterSetParam "GenerateLog" false
		--FBX File Format----------------------------------------------------------------
		FBXExporterSetParam "ASCII" false
		FBXExporterSetParam "FileVersion" "FBX201300"

		exportFile (myFolder + "\\" + myFile) #noPrompt quiet:true selectedOnly:true
	)
)

createdialog YG_fileTool
