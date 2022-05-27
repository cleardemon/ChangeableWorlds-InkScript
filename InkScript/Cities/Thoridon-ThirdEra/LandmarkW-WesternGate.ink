= gatehouse_west // W
	TODO describe western gatehouse
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "W")
	<- jump_load("W")

	Outside the western gatehouse.

	+ [Go west]
		Leave?!
		-> gatehouse_west
	+ [{ThoridonThirdEraGoToLandmark("I", MapDirectionNorth)}]
		-> union_market_old
	+ [{ThoridonThirdEraGoToLandmark("L", MapDirectionNorthEast)}]
		-> old_gatehouse_inn

