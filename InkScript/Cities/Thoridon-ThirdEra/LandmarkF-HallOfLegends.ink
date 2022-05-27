= hall_of_legends // F
	TODO describe the exterior of the Hall of Legends
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "F")
	<- jump_load("F")

	Outside the Hall of Legends.

	+ [{ThoridonThirdEraGoToLandmark("D", MapDirectionWest)}]
		-> synth_institute
	+ [{ThoridonThirdEraGoToLandmark("C", MapDirectionSouth)}]
		-> temple_of_ramor
