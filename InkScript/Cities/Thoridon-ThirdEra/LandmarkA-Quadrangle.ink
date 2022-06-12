= quadrangle // A

	// mark as seen
	~ LocationVisited(Location_ThoridonQuadrangle)

	TODO describe the Quadrangle
	{ quadrangle == 1:
	Central to everything in the city of Thoridon stands a large, rectangular courtyard known as the Quadrangle. 
	}

	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonSinthInstitute, MapDirectionNorth)}]
		-> synth_institute
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonGuardhouse, MapDirectionSouth)}]
		-> guardhouse
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonTempleOfRamor, MapDirectionEast)}]
		-> temple_of_ramor
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonSenateHouse, MapDirectionWest)}]
		-> senate_house
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonOldGatehouseInn, MapDirectionNorthWest)}]
		Cross the bridge to Inn A.
		-> old_gatehouse_inn

