
		Astart = animationRange.start
		Aend = animationRange.end

		rootBone = getNodeByName "root"
		com = getNodeByName "pt_pelvis"
		
	
		---------------------------------
			dumR = Dummy()
			dumR.name = "dummy_root"
		---------------------------------
		
	
	
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
	
			for i = Astart to Aend do-- 프레임 구간 반복
			(
				slidertime = i

				rootBone.transform = dumR.transform
			)
			
		)
		
		delete dumR
	
