= union_market_new // H
	TODO describe the bustling marketplace, run by the People's Union
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "H")
	<- jump_load("H")

	In the People's Union marketplace.

	+ [{ThoridonThirdEraGoToLandmark("G", MapDirectionEast)}]
		-> guardhouse
	+ [{ThoridonThirdEraGoToLandmark("T", MapDirectionSouth)}]
		-> residential_gomard
	+ [{ThoridonThirdEraGoToLandmark("S", MapDirectionSouthEast)}]
		-> gatehouse_south

