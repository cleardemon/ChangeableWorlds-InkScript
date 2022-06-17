= guardhouse // G
	TODO describe the exterior of the guardhouse
	// to be Warlock Council in the fourth era
	~ LocationVisited(Location_ThoridonGuardhouse)

	A large building stands here, with many windows and doors from all sides. It is on two storeys, and is pretty unremarkable considering other places in Thoridon. While it seems like it is an open, and welcoming location, there are guards standing on each of the doors, similar to the ones at the city gates.

	An inner wall separates this area with {LocationHasVisited(Location_ThoridonQuadrangle):the Quadrangle|what lies to the north}.

	// make it busy during daylight hours, for people going through the Quadrangle

	// if Kaidan is trying to get to the Institute, add a hint
	{ TimeIsBetween(TimeSpanMorningEarly, TimeSpanNoon): 
	There are a number of others, dressed in similar robes as Kaidan, making their way northwards.
	}

	+ [Approach an entrance]
		Something about approaching the guardhouse. TODO
		-> guardhouse
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonQuadrangle, MapDirectionNorth)}]
		-> quadrangle
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonGatesSouth, MapDirectionSouth)}]
		-> gatehouse_south
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonMarketplace, MapDirectionWest)}]
		-> union_market_new
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonBlueCask, MapDirectionEast)}]
		-> blue_cask_pub

