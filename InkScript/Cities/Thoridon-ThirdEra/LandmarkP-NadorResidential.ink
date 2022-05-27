= residential_nador // P
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "P")
	<- jump_load("P")

	{_UtilGetCharacterName()} walks into {residential_nador < 2:an area of the city that is densely populated|the Nador residential ward}.

	{residential_nador < 2:
	There are lots of small houses, tightly packed together, and there is a constant air of burning wood. A lot of these buildings are dirty and irregular, and coupled with a fairly noisy background, it is very busy, all the time.

	Near the centre, a statue stands at where pathways intersect, with a plaque underneath that reads "Emperor Nador". The statue itself seems to be in need of some restoration. Paths lead in north-south and westerly directions.

	To the east, the high wall of the city's boundary stretches north to south, with a few towers along its direction.
	}

	As {_UtilGetCharacterName()} moves through, various individuals push past without acknowledging anything else than themselves.

	+ [{ThoridonThirdEraGoToLandmark("E", MapDirectionNorth)}]
		-> gatehouse_east
	+ [{ThoridonThirdEraGoToLandmark("J", MapDirectionSouth)}]
		-> home_ikis
	+ [{ThoridonThirdEraGoToLandmark("M", MapDirectionWest)}]
		-> blue_cask_pub

