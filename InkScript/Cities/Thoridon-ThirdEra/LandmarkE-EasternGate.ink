= gatehouse_east // E
	TODO describe eastern gatehouse
	~ LocationVisited(Location_ThoridonGatesEast)

	Outside the eastern gatehouse.

	+ [Go east]
		Leave?!
		-> gatehouse_east
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonDagard, MapDirectionNorth)}]
		-> residential_dagard
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonBlueCask, MapDirectionSouthWest)}]
		-> blue_cask_pub
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonNador, MapDirectionSouth)}]
		-> residential_nador

