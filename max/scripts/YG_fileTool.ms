/*
YG_fileTool
since 2023.11.10
last updated 2023.11.10
by YeonGyun,Jeong
lupinxyz@gmail.com
*/

myVersion = "v1.0"
myFolder = ""
myFile = ""
myFullPath = ""
	
try( destroydialog YG_fileTool ) catch()

rollout YG_fileTool "YG_fileTool v1.0" width:528 height:256
(
	listbox 'file_name_1' "Category1" pos:[8,8] width:96 height:10 align:#left
	listbox 'file_name_2' "Category2" pos:[112,8] width:96 height:10 align:#left
	listbox 'file_name_3' "Category3" pos:[216,8] width:96 height:10 align:#left
	listbox 'file_name_4' "Category4" pos:[320,8] width:96 height:10 align:#left
	listbox 'file_name_5' "Category5" pos:[424,8] width:96 height:10 align:#left
	
	edittext 'text_fileName' "" pos:[8,184] width:512 height:24 align:#left
	
	button 'btn_openFolder' "Open Folder" pos:[8,216] width:112 height:32 align:#left
	button 'btn_openFile' "Open File" pos:[120,216] width:200 height:32 align:#left
	button 'btn_saveFile' "Save File" pos:[320,216] width:200 height:32 align:#left

--------------------------------------------------------------------------------------------------------
--function-------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
	fn selectCategory=
	(
		--category1
		myCategory_1 = #("PC", "NPC", "Monster")
		file_name_1.items = myCategory_1
		
		--category2
		if file_name_1.selected == "PC" or file_name_1.selected == "NPC" then
		(
			myCategory_2 = #("Female", "Male")
		)
		if file_name_1.selected == "Monster" then
		(
			myCategory_2 = #("Gnoll", "Goblin", "Kobold")
		)
		file_name_2.items = myCategory_2
		
		--category3
		if file_name_1.selected == "PC" and file_name_2.selected == "Female" then
		(
			myCategory_3 = #("BaseBody", "Hair", "Fiona")
		)
		if file_name_1.selected == "PC" and file_name_2.selected == "Male" then
		(
			myCategory_3 = #("BaseBody", "Hair", "Lethita")
		)
		if file_name_1.selected == "NPC" then
		(
			myCategory_3 = #("Face", "Hair", "Outfit", "Weapon")
		)
		if file_name_1.selected == "Monster" then
		(
			myCategory_3 = #("Public", "Type1", "Type2", "Type3")
		)
		file_name_3.items = myCategory_3
		
		--category4
		if file_name_1.selected == "PC" then
		(
			myCategory_4 = #("")
			
			myFolder = "Z:\VindictusGFX\Content\_Prework\Characters\Player\\"
		)
		
		if file_name_1.selected == "NPC" then
		(
			myFolder = "Z:\VindictusGFX\Content\_Prework\Characters\NPC\\"
		)
		if file_name_1.selected == "NPC" and file_name_2.selected == "Female" then
		(
			myCategory_4 = #("", "Female1")
		)
		if file_name_1.selected == "NPC" and file_name_2.selected == "Male" then
		(
			myCategory_4 = #("", "Aidan")
		)
		if file_name_1.selected == "Monster" then
		(			
			myFolder = "Z:\VindictusGFX\Content\_Prework\Characters\Monster\\"
		)
		if file_name_1.selected == "Monster" and file_name_3.selected != "Public" then
		(
			myCategory_4 = #("Public", "Normal", "Elite", "FieldBoss", "NamedBoss", "TribeBoss")
		)
		if file_name_1.selected == "Monster" and file_name_3.selected == "Public" then
		(
			myCategory_4 = #("")
		)
		file_name_4.items = myCategory_4
		
		--makeFileName
		if file_name_2.selected == "Female" then
		(
			myGender = "F"
		)
		if file_name_2.selected == "Male" then
		(
			myGender = "M"
		)
		if file_name_2.selected != "Female" and file_name_2.selected != "Male" then
		(
			myGender = "_" + file_name_2.selected
		)
			
			
		if file_name_3.selected == "BaseBody" then
		(
			myFile = file_name_3.selected + "_" + file_name_1.selected + myGender
		)
		else
		(
			myFile = file_name_1.selected + myGender + "_" + file_name_3.selected
		)
		
		if file_name_4.selected != "" then
		(
			myFile = myFile + "_" + file_name_4.selected
		)
		
		myFolder = myFolder + myFile
		myFullPath = myFolder + "\\" + myFile + ".max"
		text_fileName.text = myFullPath
	)
--------------------------------------------------------------------------------------------------------
--button-------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------	
	on YG_fileTool open do
	(
		gc()
		
		selectCategory()
	)
	on file_name_1 selected sel do
	(
		selectCategory()
	)
	on file_name_2 selected sel do
	(
		selectCategory()
	)
	on file_name_3 selected sel do
	(
		selectCategory()
	)
	on file_name_4 selected sel do
	(
		selectCategory()
	)
	on file_name_5 selected sel do
	(
		selectCategory()
	)
	on btn_openFolder pressed do
	(
		ShellLaunch myFolder ""
	)
	on btn_openFile pressed do
	(
		print ("folder : " + myFolder)

		myMaxFile = filenameFromPath text_fileName.text
		print ("file : " + myMaxFile)
		
		theName = getMAXOpenFileName filename:text_fileName.text
		if theName != undefined do loadMaxFile theName
	)
	on btn_saveFile pressed do
	(
		if doesDirectoryExist myFolder then
		(
			print(myFolder + ": exist")
		)
		else
		(
			print(myFolder + ": make folder")
			makeDir myFolder all:true
		)
		
		theName = getMAXSaveFileName filename:text_fileName.text
		if theName != undefined do saveMaxFile theName

	)
	
)

createdialog YG_fileTool
