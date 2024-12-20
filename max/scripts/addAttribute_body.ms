ca = attributes select
(
	rollout params "Select" width:168 height:320
	(
		GroupBox 'grp1' "Body" pos:[8,8] width:152 height:128 align:#left
		radiobuttons 'rdo_body' "" pos:[16,24] width:110 height:64 labels:#("Cutting Mesh", "Basebody", "Type1", "Type2") align:#left
		checkbox 'chk_fur' "Fur" pos:[16,96] width:104 height:16 align:#left				
				
		checkbox 'chk_jetpack' "Jetpack" pos:[16,112] width:104 height:16 align:#left	
	
		
		GroupBox 'grp2' "Weapon" pos:[8,144] width:152 height:72 align:#left
		radiobuttons 'rdo_weapon' "" pos:[16,160] width:63 height:48 labels:#("Off", "Type1", "Type2") align:#left
		
		global myBodyText = "Cutting Mesh"
		global mySubFurText = ""
		global mySubJetText = ""
		
		global myWeaponSel = 1
		
		
		on params open do
		(
			--body
			if myBodyText == "Basebody" then rdo_body.state = 2
			if myBodyText == "Type1" then rdo_body.state = 3
			if myBodyText == "Type2" then rdo_body.state = 4
			
			--sub
			if mySubFurText != "" then chk_fur.state = True
			if mySubJetText != "" then chk_jetpack.state = True
				
			--weapon
			rdo_weapon.state = myWeaponSel
		)
		on rdo_body changed stat do
		(
			enableSceneRedraw()
			
			-- cut layer
			layer = LayerManager.getLayerFromName "*cut"
		
			for i = 0 to layerManager.count-1 do
			(
				ilayer = layerManager.getLayer i
				layerName = ilayer.name
								
				if (matchPattern layerName pattern:"*cut*" ignoreCase:true) then
				(
					--print(layerName)
					layer = LayerManager.getLayerFromName layerName
				)
			)
		
			-- Cutting Mesh
			if rdo_body.state == 1 then
			(
				-- body
				layer.ishidden = False
				$*Gremlin_Body.isHidden = True
				$*Gremlin_Type1_Normal01_Armor01.isHidden = True
				$*Gremlin_Type2_Normal02_Armor01.isHidden = True
				
				-- text
				myBodyText = "Cutting Mesh"
				$*Text_body.text = myBodyText + mySubFurText + mySubJetText
			)
			
			-- Basebody
			if rdo_body.state == 2 then
			(
				-- body
				layer.ishidden = True
				$*Gremlin_Body.isHidden = False
				$*Gremlin_Type1_Normal01_Armor01.isHidden = True
				$*Gremlin_Type2_Normal02_Armor01.isHidden = True
				
				-- text
				myBodyText = "Basebody"
				$*Text_body.text = myBodyText + mySubFurText + mySubJetText
			)
			
			-- Type1
			if rdo_body.state == 3 then
			(
				-- body
				layer.ishidden = True
				$*Gremlin_Body.isHidden = False
				$*Gremlin_Type1_Normal01_Armor01.isHidden = False
				$*Gremlin_Type2_Normal02_Armor01.isHidden = True
				
				-- text
				myBodyText = "Type1"
				$*Text_body.text = myBodyText + mySubFurText + mySubJetText
			)
			
			-- Type2
			if rdo_body.state == 4 then
			(
				-- body
				layer.ishidden = True
				$*Gremlin_Body.isHidden = False
				$*Gremlin_Type1_Normal01_Armor01.isHidden = True
				$*Gremlin_Type2_Normal02_Armor01.isHidden = False
				
				-- text
				myBodyText = "Type2"
				$*Text_body.text = myBodyText + mySubFurText + mySubJetText
			)
		)
		on chk_fur changed state do
		(
			if chk_fur.state == False then
			(
				$*Gremlin_Fur.isHidden = True
				
				-- text
				mySubFurText = ""
				$*Text_body.text = myBodyText + mySubFurText + mySubJetText
			)
			else
			(
				$*Gremlin_Fur.isHidden = False
				
				-- text
				mySubFurText = " + Fur"
				$*Text_body.text = myBodyText + mySubFurText + mySubJetText
			)
		)
		on chk_jetpack changed state do
		(
			if chk_jetpack.state == False then
			(
				$*Gremlin_Jetpack.isHidden = True
				
				-- text
				mySubJetText = ""
				$*Text_body.text = myBodyText + mySubFurText + mySubJetText
			)
			else
			(
				$*Gremlin_Jetpack.isHidden = False
				
				-- text
				mySubJetText = " + Jetpack"
				$*Text_body.text = myBodyText + mySubFurText + mySubJetText
			)
		)
		on rdo_weapon changed stat do
		(
			enableSceneRedraw()
			
			-- Off
			if rdo_weapon.state == 1 then
			(
				myWeaponSel = 1
				
				-- weapon
				$*Gremlin_Type1_Normal01_Weapon01.isHidden = True
				$*Gremlin_Type2_Normal02_Weapon01.isHidden = True
			)
			
			-- Type1
			if rdo_weapon.state == 2 then
			(
				myWeaponSel = 2
				
				-- weapon
				$*Gremlin_Type1_Normal01_Weapon01.isHidden = False
				$*Gremlin_Type2_Normal02_Weapon01.isHidden = True
			)
			
			-- Type2
			if rdo_weapon.state == 3 then
			(
				myWeaponSel = 3
				
				-- weapon
				$*Gremlin_Type1_Normal01_Weapon01.isHidden = True
				$*Gremlin_Type2_Normal02_Weapon01.isHidden = False
			)
		)
	)
)
custAttributes.add $.modifiers[1] ca