= blue_cask_pub // M
	// large open downstairs, roaring fireplace central
	// just a pub, not an inn (no bedrooms)
	// benches inside, tables
	// clientele subdued, locals

	In amongst smaller buildings stands an eye-changing place. With hints of blue all around the outside of a single, large building, and some well-attended seating, stands a large blue barrel. Behind this barrel lies a wide door that leads inside. The path leading up to the door is well trodden, and an orange flickering glow emanating from the various windows grabs one's attention.

	// if it is afternoon and before dusk, add a note to say that lots of people come and go

	+ [Enter {KnowledgePlayerIsKnown(KnowledgeGlobalThoridonBlueCask):The Blue Cask|inside}]
		// player only knows what this landmark is if they have entered inside
		~ LocationVisited(Location_ThoridonBlueCask)
		-> blue_cask_inside
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonGuardhouse, MapDirectionWest)}]
		-> guardhouse
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonGatesSouth, MapDirectionSouthWest)}]
		-> gatehouse_south
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonKasard, MapDirectionSouth)}]
		-> residential_kasard
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonNador, MapDirectionEast)}]
		-> residential_nador

