= gatehouse_east // E
	TODO describe eastern gatehouse
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "E")
	<- jump_load("E")
	
	Outside the eastern gatehouse.

	+ [Go east]
		Leave?!
		-> gatehouse_east
	+ [{ThoridonThirdEraGoToLandmark("O", MapDirectionNorth)}]
		-> residential_dagard
	+ [{ThoridonThirdEraGoToLandmark("M", MapDirectionSouthWest)}]
		-> blue_cask_pub
	+ [{ThoridonThirdEraGoToLandmark("P", MapDirectionSouth)}]
		-> residential_nador

