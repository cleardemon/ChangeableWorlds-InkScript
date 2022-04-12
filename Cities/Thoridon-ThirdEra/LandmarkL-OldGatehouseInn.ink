= old_gatehouse_inn // L
	// coaching inn? 
	TODO describe Old Gatehouse Inn
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "L")
	<- jump_load("L")

	Outside the Old Gatehouse Inn.

	+ [{ThoridonThirdEraGoToLandmark("I", MapDirectionWest)}]
		-> union_market_old
	+ [{ThoridonThirdEraGoToLandmark("W", MapDirectionSouthWest)}]
		-> gatehouse_west
	+ [{ThoridonThirdEraGoToLandmark("A", MapDirectionSouth)}]
		Cross the river to the Quadrangle.
		-> quadrangle

