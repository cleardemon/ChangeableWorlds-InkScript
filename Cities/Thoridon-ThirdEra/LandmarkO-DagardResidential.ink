= residential_dagard // O
	TODO describe medium quality residential area (NE)
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "O")
	<- jump_load("O")

	Inside a medium quality residential area.

	+ [{ThoridonThirdEraGoToLandmark("N", MapDirectionNorth)}]
		-> residential_hexard
	+ [{ThoridonThirdEraGoToLandmark("E", MapDirectionSouth)}]
		-> gatehouse_east

