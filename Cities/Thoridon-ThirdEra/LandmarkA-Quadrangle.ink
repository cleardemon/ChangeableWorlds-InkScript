= quadrangle // A

	// mark as seen
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "A")
	<- jump_load("A")

	TODO describe the Quadrangle
	{ quadrangle == 1:
	Central to everything in the city of Thoridon stands a large, rectangular courtyard known as the Quadrangle. 
	}

	+ [{ThoridonThirdEraGoToLandmark("D", MapDirectionNorth)}]
		-> synth_institute
	+ [{ThoridonThirdEraGoToLandmark("G", MapDirectionSouth)}]
		-> guardhouse
	+ [{ThoridonThirdEraGoToLandmark("C", MapDirectionEast)}]
		-> temple_of_ramor
	+ [{ThoridonThirdEraGoToLandmark("B", MapDirectionWest)}]
		-> senate_house
	+ [{ThoridonThirdEraGoToLandmark("L", MapDirectionNorthWest)}]
		Cross the bridge to Inn A.
		-> old_gatehouse_inn

