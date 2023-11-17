/*
YG_fileTool
since 2023.11.10
last updated 2023.11.17
by YeonGyun,Jeong
lupinxyz@gmail.com
*/

myVersion = "v1.0"
myMainFolder = ""
myFolder = ""
myFile = ""
	
try( destroydialog YG_fileTool ) catch()

rollout YG_fileTool ("YG_fileTool " + myVersion) width:528 height:296
(
	listbox 'list_category_1' "Category1" pos:[8,8] width:96 height:10 align:#left
	listbox 'list_category_2' "Category2" pos:[112,8] width:96 height:10 align:#left
	listbox 'list_category_3' "Category3" pos:[216,8] width:96 height:10 align:#left
	listbox 'list_category_4' "Category4" pos:[320,8] width:96 height:10 align:#left
	listbox 'list_category_5' "Category5" pos:[424,8] width:96 height:10 align:#left
	
	edittext 'text_FolderPath' "Folder" pos:[8,168] width:512 height:24 align:#left

	radiobuttons 'rdo_Prefix' "" pos:[15,200] width:108 height:16 labels:#("SM","Rig","Proxy") columns:5 align:#left
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
		mylist_category_1 = #("PC")
		-- mylist_category_1 = #("PC", "NPC", "Monster")
		list_category_1.items = mylist_category_1
		
		--category2
		if list_category_1.selected == "PC" then
		(
			mylist_category_2 = #("BaseBody_PCF", "BaseBody_PCM", "PC_Hair", "Fiona", "Lethita")
			myMainFolder = "Z:\VindictusGFX\Content\_Prework\Characters\Player\\"
		)
		-- if list_category_1.selected == "NPC" then
		-- (
		-- 	mylist_category_2 = #("NPC_Face", "NPC_Outfit", "NPC_Weapon")
		-- 	myMainFolder = "Z:\VindictusGFX\Content\_Prework\Characters\NPC\\"
		-- )
		-- if list_category_1.selected == "Monster" then
		-- (
		-- 	mylist_category_2 = #("Gnoll", "Goblin", "Kobold")
		-- 	myMainFolder = "Z:\VindictusGFX\Content\_Prework\Characters\Monster\\"
		-- )
		list_category_2.items = mylist_category_2
		
		--category3
		mylist_category_3 = #("")
		if list_category_2.selected == "Fiona" or list_category_2.selected == "Lethita" then
		(
			mylist_category_3 = #("Armor", "Face", "Weapon")
		)
		if list_category_2.selected == "PC_Hair" then
		(
			mylist_category_3 = #("PCF_Hair", "PCM_Hair")
		)
		list_category_3.items = mylist_category_3
		
		--category4
		mylist_category_4 = #("01","02","03","04","05","06","07","08","09","10")
		list_category_4.items = mylist_category_4
		
		--folder path & file naming
		myPrefix = case rdo_Prefix.state of
		(
			1: "SM_"
			2: "Rig_"
			3: "Proxy_"
		)
		myFolder = myMainFolder + list_category_2.selected + "\Model"
		myFile = myPrefix + list_category_2.selected + ".max"

		if list_category_3.selected != "" then
		(
			print (list_category_3.selected)
			myFolder = myMainFolder + list_category_2.selected + "\\" + list_category_3.selected + "\Model"
			myFile = myPrefix + list_category_2.selected + "_" + list_category_3.selected + list_category_4.selected + ".max"
		)
		if list_category_2.selected == "PC_Hair" then
		(
			myFile = myPrefix + list_category_3.selected + list_category_4.selected + ".max"
		)
		if list_category_2.selected == "BaseBody_PCF" then
		(
			myFile = myPrefix + "PCF_BaseBody" + list_category_4.selected + ".max"
		)
		if list_category_2.selected == "BaseBody_PCM" then
		(
			myFile = myPrefix + "PCM_BaseBody" + list_category_4.selected + ".max"
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
	on rdo_Prefix changed stat do
		selectCategory()
	
	-- open folder
	on btn_openFolder pressed do
	(
		ShellLaunch myFolder ""
	)

	-- open file
	on btn_openFile pressed do
	(
		theName = getMAXOpenFileName filename:(myFolder + "\\" + myFile)
		
		print("foler : " + myFolder)
		print("file : " + myFile)

		if theName != undefined then
			loadMaxFile theName
		else print("file no")
	)

	-- save file
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
