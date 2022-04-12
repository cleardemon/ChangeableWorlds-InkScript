= residential_hexard // N
	TODO describe high quality residential area (NE)
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "N")
	<- jump_load("N")

	Inside a high quality residential area.

	+ [{ThoridonThirdEraGoToLandmark("K", MapDirectionWest)}]
		-> home_emperor
	+ [{ThoridonThirdEraGoToLandmark("O", MapDirectionSouth)}]
		-> residential_dagard

