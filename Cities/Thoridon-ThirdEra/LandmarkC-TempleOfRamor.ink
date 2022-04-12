= temple_of_ramor // C
	TODO describe the exterior of the Temple of Ramor
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "C")
	<- jump_load("C")

	Outside the Temple of Ramor.

	+ [{ThoridonThirdEraGoToLandmark("F", MapDirectionNorth)}]
		-> hall_of_legends
	+ [{ThoridonThirdEraGoToLandmark("A", MapDirectionWest)}]
		-> quadrangle

