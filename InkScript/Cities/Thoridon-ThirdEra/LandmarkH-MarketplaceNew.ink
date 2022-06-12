= union_market_new // H
	TODO describe the bustling marketplace, run by the People's Union
	~ LocationVisited(Location_ThoridonMarketplace)

	In the People's Union marketplace.

	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonGuardhouse, MapDirectionEast)}]
		-> guardhouse
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonGomard, MapDirectionSouth)}]
		-> residential_gomard
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonGatesSouth, MapDirectionSouthEast)}]
		-> gatehouse_south

