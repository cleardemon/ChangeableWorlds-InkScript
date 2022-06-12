= home_ikis // J
	~ temp gate = 0

	~ LocationVisited(Location_ThoridonIkisHome)

	Kaidan stands outside his home.

	{ home_ikis > 1: 
	A gate leads through some tall hedges, leading onto a path up to the modest house. The garden itself features well-maintained flower beds.
	}

	- (loop)
		+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonNador, MapDirectionNorth)}]
			-> residential_nador
		+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonKasard, MapDirectionWest)}]
			-> residential_kasard
		+ { home_ikis > 1 && gate < 2 } [Open the gate]
			{ DoorIsLocked("IkisFrontDoor"): 
					{gate < 1 : {_UtilGetCharacterName()} tries to open the gate, but it seems to be locked.}
					{gate >= 1 : The gate is still locked.}
			}
			~ gate++
			-> loop
		+ -> loop
