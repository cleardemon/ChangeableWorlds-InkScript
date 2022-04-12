= guardhouse // G
	TODO describe the exterior of the guardhouse
	// to be Warlock Council in the fourth era
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "G")
	<- jump_load("G")

	A large building stands here, with many windows and doors from all sides. It is on two storeys, and is pretty unremarkable considering other places in Thoridon. While it seems like it is an open, and welcoming location, there are guards standing on each of the doors, similar to the ones at the city gates.

	An inner wall separates this area with {LandmarkIsVisited(LandmarkCityThoridonThird, "A"):the Quadrangle|what lies to the north}.

	// make it busy during daylight hours, for people going through the Quadrangle

	// if Kaidan is trying to get to the Institute, add a hint
	{ IsCityJumpTarget("D") && ClockIsCurrentTimeBetweenPri(CTimeSpanMorningEarly, CTimeSpanNoon): 
	There are a number of others, dressed in similar robes as Kaidan, making their way northwards.
	}

	+ [Approach an entrance]
		Something about approaching the guardhouse. TODO
		-> guardhouse
	+ [{ThoridonThirdEraGoToLandmark("A", MapDirectionNorth)}]
		-> quadrangle
	+ [{ThoridonThirdEraGoToLandmark("S", MapDirectionSouth)}]
		-> gatehouse_south
	+ [{ThoridonThirdEraGoToLandmark("H", MapDirectionWest)}]
		-> union_market_new
	+ [{ThoridonThirdEraGoToLandmark("M", MapDirectionEast)}]
		-> blue_cask_pub

