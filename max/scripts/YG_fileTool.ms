/*
YG_fileTool
since 2023.11.10
last updated 2023.11.10
by YeonGyun,Jeong
lupinxyz@gmail.com
*/

myVersion = "v1.0"
myFolder = ""
myLastFolder = ""
myFile = ""
myFullPath = ""
	
try( destroydialog YG_fileTool ) catch()

rollout YG_fileTool "YG_fileTool v1.0" width:528 height:296
(
	listbox 'category_1' "Category1" pos:[8,8] width:96 height:10 align:#left
	listbox 'category_2' "Category2" pos:[112,8] width:96 height:10 align:#left
	listbox 'category_3' "Category3" pos:[216,8] width:96 height:10 align:#left
	listbox 'category_4' "Category4" pos:[320,8] width:96 height:10 align:#left
	listbox 'category_5' "Category5" pos:[424,8] width:96 height:10 align:#left
	
	edittext 'text_FolderPath' "Folder" pos:[8,168] width:512 height:24 align:#left

	radiobuttons 'rdo_Prefix' "" pos:[15,200] width:108 height:16 labels:#("Model", "Rig") columns:2 align:#left
	edittext 'text_fileName' "File" pos:[8,225] width:512 height:24 align:#left

	button 'btn_openFolder' "Open Folder" pos:[8,257] width:112 height:32 align:#left
	button 'btn_openFile' "Open File" pos:[120,257] width:200 height:32 align:#left
	button 'btn_saveFile' "Save File" pos:[320,257] width:200 height:32 align:#left

--------------------------------------------------------------------------------------------------------
--function-------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
	fn selectCategory=
	(
		--category1
		myCategory_1 = #("PC", "NPC", "Monster")
		category_1.items = myCategory_1
		
		--category2
		if category_1.selected == "PC" or category_1.selected == "NPC" then
		(
			myCategory_2 = #("Female", "Male")
		)
		if category_1.selected == "Monster" then
		(
			myCategory_2 = #("Gnoll", "Goblin", "Kobold")
		)
		category_2.items = myCategory_2
		
		--category3
		if category_1.selected == "PC" and category_2.selected == "Female" then
		(
			myCategory_3 = #("BaseBody", "Hair", "Fiona")
		)
		if category_1.selected == "PC" and category_2.selected == "Male" then
		(
			myCategory_3 = #("BaseBody", "Hair", "Lethita")
		)
		if category_1.selected == "NPC" then
		(
			myCategory_3 = #("Face", "Hair", "Outfit", "Weapon")
		)
		if category_1.selected == "Monster" then
		(
			myCategory_3 = #("Public", "Type1", "Type2", "Type3")
		)
		category_3.items = myCategory_3
		
		--category4
		if category_1.selected == "PC" then
		(
			myCategory_4 = #("")
			
			myFolder = "Z:\VindictusGFX\Content\_Prework\Characters\Player\\"
		)
		
		if category_1.selected == "NPC" then
		(
			myFolder = "Z:\VindictusGFX\Content\_Prework\Characters\NPC\\"
		)
		if category_1.selected == "NPC" and category_2.selected == "Female" then
		(
			myCategory_4 = #("", "Female1")
		)
		if category_1.selected == "NPC" and category_2.selected == "Male" then
		(
			myCategory_4 = #("", "Aidan")
		)
		if category_1.selected == "Monster" then
		(			
			myFolder = "Z:\VindictusGFX\Content\_Prework\Characters\Monster\\"
		)
		if category_1.selected == "Monster" and category_3.selected != "Public" then
		(
			myCategory_4 = #("Public", "Normal", "Elite", "FieldBoss", "NamedBoss", "TribeBoss")
		)
		if category_1.selected == "Monster" and category_3.selected == "Public" then
		(
			myCategory_4 = #("")
		)
		category_4.items = myCategory_4
		
		--makeFileName
		if category_2.selected == "Female" then
		(
			myGender = "F"
		)
		if category_2.selected == "Male" then
		(
			myGender = "M"
		)
		if category_2.selected != "Female" and category_2.selected != "Male" then
		(
			myGender = "_" + category_2.selected
		)
			
			
		if category_3.selected == "BaseBody" then
		(
			myLastFolder = category_3.selected + "_" + category_1.selected + myGender
		)
		else
		(
			myLastFolder = category_1.selected + myGender + "_" + category_3.selected
		)
		
		if category_4.selected != "" then
		(
			myLastFolder = myLastFolder + "_" + category_4.selected
		)
		
		myPrefix = case rdo_Prefix.state of
		(
			1: "Model_"
			2: "Rig_"
		)

		myFile = myPrefix + category_1.selected + myGender + "_" + category_3.selected + ".max"
		myFolder = myFolder + myLastFolder
		
		text_folderPath.text = myFolder
		text_fileName.text = myFile
	)
--------------------------------------------------------------------------------------------------------
--button-------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------	
	



	-- open folder

	-- open file

	-- save file

	on YG_fileTool open do
	(
		gc()
		
		selectCategory()
	)
	on category_1 selected sel do
		selectCategory()
	on category_2 selected sel do
		selectCategory()
	on category_3 selected sel do
		selectCategory()
	on category_4 selected sel do
		selectCategory()
	on category_5 selected sel do
		selectCategory()
	on rdo_Prefix changed stat do
		selectCategory()
	on btn_openFolder pressed do
	(
		ShellLaunch myFolder ""
	)
	on btn_openFile pressed do
	(
		theName = getMAXOpenFileName filename:(myFolder + "\\" + myFile)
		if theName != undefined do loadMaxFile theName
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
)

createdialog YG_fileTool
