/*
YG_namingTool
since 2023.10.24
last updated 2023.11.30
by YeonGyun,Jeong
lupinxyz@gmail.com
*/

myVersion = "v1.0"
myName = ""

try( destroydialog YG_namingTool ) catch()

rollout YG_namingTool ("YG_namingTool " + myVersion) width:432 height:344
(
	
	dropdownList 'ddl_cha' "Character" pos:[8,8] width:100 height:41 items:#("") align:#left
	dropdownList 'ddl_parts1' "Parts" pos:[112,8] width:100 height:41 items:#("") align:#left
	dropdownList 'ddl_layer1' "Layer" pos:[216,8] width:100 height:41 items:#("") align:#left
	edittext 'edt_text1' "" pos:[320,24] width:100 height:24 align:#left
	
	dropdownList 'ddl_parts2' "Parts" pos:[8,56] width:100 height:41 items:#("") align:#left
	dropdownList 'ddl_layer2' "Layer" pos:[112,56] width:100 height:41 items:#("") align:#left
	dropdownList 'ddl_count2' "Count" pos:[216,56] width:100 height:41 items:#("") align:#left
	edittext 'edt_text2' "" pos:[320,72] width:100 height:24 align:#left

	dropdownList 'ddl_parts3' "Parts" pos:[9,104] width:100 height:41 items:#("") align:#left
	dropdownList 'ddl_layer3' "Layer" pos:[112,104] width:100 height:41 items:#("") align:#left
	dropdownList 'ddl_count3' "Count" pos:[216,104] width:100 height:41 items:#("") align:#left
	edittext 'edt_text3' "" pos:[320,120] width:100 height:24 align:#left

	dropdownList 'ddl_parts4' "Parts" pos:[8,152] width:100 height:41 items:#("") align:#left
	dropdownList 'ddl_layer4' "Layer" pos:[112,152] width:100 height:41 items:#("") align:#left
	dropdownList 'ddl_count4' "Count" pos:[216,152] width:100 height:41 items:#("") align:#left
	edittext 'edt_text4' "" pos:[320,168] width:100 height:24 align:#left

	dropdownList 'ddl_parts5' "Parts" pos:[8,200] width:100 height:41 items:#("") align:#left
	dropdownList 'ddl_layer5' "Layer" pos:[112,200] width:100 height:41 items:#("") align:#left
	dropdownList 'ddl_count5' "Count" pos:[216,200] width:100 height:41 items:#("") align:#left
	edittext 'edt_text5' "" pos:[320,216] width:100 height:24 align:#left
	
	edittext 'edt_text_name' "" pos:[8,264] width:304 height:24 align:#left
	dropdownList 'ddl_side' "Side" pos:[320,248] width:100 height:41 items:#("", "l", "r", "c") align:#left
	button 'btn_editName' "Edit Name" pos:[8,296] width:416 height:40 align:#left

--------------------------------------------------------------------------------------------------------
--function-------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
	fn makeName = 
	(
		myName = edt_text1.text

		if edt_text2.text != "" then
		(
			myName = myName + "_" + edt_text2.text

			if edt_text3.text != "" then
			(
				myName = myName + "_" + edt_text3.text

				if edt_text4.text != "" then
				(
					myName = myName + "_" + edt_text4.text

					if edt_text5.text != "" then
					(
						myName = myName + "_" + edt_text5.text
					)
				)
			)
		)

		edt_text_name.text = myName
	)

	fn selectedExcute ddlA ddlB ddlC edt =
	(
		if ddlA.selected != undefined then
		(
			edt.text = ddlA.selected

			ddlB.selection = 0
			ddlC.selection = 0
		)

		makeName()
	)

	fn categoryAdd =
	(
		myChaList = #("", "Fiona", "Lethita")
		myPartsList = #("", "root", "hair", "tail", "fur", "armor", "head", "upper", "lower", "hand", "foot", "ponytail", "feather", "shoulder")
		myLayerList = #("", "upper", "lower", "left", "right", "center", "fwd", "bck", "in", "out", "a", "b", "c", "d")
		myCountList = #("", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10")

		ddl_cha.items = myChaList

		ddl_parts1.items = myPartsList
		ddl_parts2.items = myPartsList
		ddl_parts3.items = myPartsList
		ddl_parts4.items = myPartsList
		ddl_parts5.items = myPartsList

		ddl_layer1.items = myLayerList
		ddl_layer2.items = myLayerList
		ddl_layer3.items = myLayerList
		ddl_layer4.items = myLayerList
		ddl_layer5.items = myLayerList

		ddl_count2.items = myCountList
		ddl_count3.items = myCountList
		ddl_count4.items = myCountList
		ddl_count5.items = myCountList
	)

--------------------------------------------------------------------------------------------------------
--button-------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------	
	on YG_namingTool open do
	(
		gc()
		clearListener()
		categoryAdd()
	)

	on ddl_cha selected sel do selectedExcute ddl_cha ddl_parts1 ddl_layer1 edt_text1
	on ddl_parts1 selected sel do selectedExcute ddl_parts1 ddl_cha ddl_layer1 edt_text1
	on ddl_layer1 selected sel do selectedExcute ddl_layer1 ddl_cha ddl_parts1 edt_text1
	on edt_text1 changed txt do makeName()
	
	on ddl_parts2 selected sel do selectedExcute ddl_parts2 ddl_layer2 ddl_count2 edt_text2
	on ddl_layer2 selected sel do selectedExcute ddl_layer2 ddl_parts2 ddl_count2 edt_text2
	on ddl_count2 selected sel do selectedExcute ddl_count2 ddl_layer2 ddl_parts2 edt_text2
	on edt_text2 changed txt do makeName()

	on ddl_parts3 selected sel do selectedExcute ddl_parts3 ddl_layer3 ddl_count3 edt_text3
	on ddl_layer3 selected sel do selectedExcute ddl_layer3 ddl_parts3 ddl_count3 edt_text3
	on ddl_count3 selected sel do selectedExcute ddl_count3 ddl_layer3 ddl_parts3 edt_text3
	on edt_text3 changed txt do makeName()

	on ddl_parts4 selected sel do selectedExcute ddl_parts4 ddl_layer4 ddl_count4 edt_text4
	on ddl_layer4 selected sel do selectedExcute ddl_layer4 ddl_parts4 ddl_count4 edt_text4
	on ddl_count4 selected sel do selectedExcute ddl_count4 ddl_layer4 ddl_parts4 edt_text4
	on edt_text4 changed txt do makeName()

	on ddl_parts5 selected sel do selectedExcute ddl_parts5 ddl_layer5 ddl_count5 edt_text5
	on ddl_layer5 selected sel do selectedExcute ddl_layer5 ddl_parts5 ddl_count5 edt_text5
	on ddl_count5 selected sel do selectedExcute ddl_count5 ddl_layer5 ddl_parts5 edt_text5
	on edt_text5 changed txt do makeName()

	on btn_editName pressed do
	(		
		mySel = selection as array
		
		if mySel.count > 1 then
		(
			for i=1 to mySel.count do
			(
				myCount = formattedPrint i format:"02d"
				myNameAddCount = ( edt_text_name.text + "_" + myCount )

				if ddl_side.selected != "" then
				(
					myNameSide = myNameAddCount + "_" + ddl_side.selected

					mySel[i].name = myNameSide
				)
				else
				(
					mySel[i].name = myNameAddCount
				)		
			)
		)
		else
		(
			if ddl_side.selected != "" then
			(
				myNameSide = myName + "_" + ddl_side.selected

				mySel[1].name = myNameSide
			)
			else
			(
				mySel[1].name = myName
			)	
		)
	)
)
createdialog YG_namingTool
