= gatehouse_west // W
	TODO describe western gatehouse
	~ LocationVisited(Location_ThoridonGatesWest)

	Outside the western gatehouse.

	+ [Go west]
		Leave?!
		-> gatehouse_west
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonMarketplaceOld, MapDirectionNorth)}]
		-> union_market_old
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonOldGatehouseInn, MapDirectionNorthEast)}]
		-> old_gatehouse_inn

