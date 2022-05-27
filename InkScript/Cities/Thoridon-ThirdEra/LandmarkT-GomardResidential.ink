= residential_gomard // T
	TODO describe low quality residential area (NE)
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "T")
	<- jump_load("T")

	Inside a low quality residential area.

	+ [{ThoridonThirdEraGoToLandmark("U", MapDirectionWest)}]
		-> residential_esdor
	+ [{ThoridonThirdEraGoToLandmark("S", MapDirectionEast)}]
		-> gatehouse_south
	+ [{ThoridonThirdEraGoToLandmark("H", MapDirectionNorth)}]
		-> union_market_new

