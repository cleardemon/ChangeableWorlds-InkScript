= old_gatehouse_inn // L
	// coaching inn? 
	TODO describe Old Gatehouse Inn
	~ LocationVisited(Location_ThoridonOldGatehouseInn)

	Outside the Old Gatehouse Inn.

	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonMarketplaceOld, MapDirectionWest)}]
		-> union_market_old
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonGatesWest, MapDirectionSouthWest)}]
		-> gatehouse_west
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonQuadrangle, MapDirectionSouth)}]
		Cross the river to the Quadrangle.
		-> quadrangle

