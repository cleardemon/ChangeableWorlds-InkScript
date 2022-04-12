= home_ikis // J
	~ temp gate = 0

	~ LandmarkSetVisited(LandmarkCityThoridonThird, "J")
	<- jump_load("J")

	Kaidan stands outside his home.

	{ home_ikis > 1: 
	A gate leads through some tall hedges, leading onto a path up to the modest house. The garden itself features well-maintained flower beds.
	}

	- (loop)
		+ [{ThoridonThirdEraGoToLandmark("P", MapDirectionNorth)}]
			-> residential_nador
		+ [{ThoridonThirdEraGoToLandmark("Q", MapDirectionWest)}]
			-> residential_kasard
		+ { home_ikis > 1 && gate < 2 } [Open the gate]
			{ DoorGetState(DoorId_IkisFrontDoor): 
				- DoorStateLocked:
					{gate < 1 : {_UtilGetCharacterName()} tries to open the gate, but it seems to be locked.}
					{gate >= 1 : The gate is still locked.}
				- else:
					TODO if the gate is unlocked, probably should do something here
					~ DEBUG("Gate is not locked, it should be!")
			}
			~ gate++
			-> loop
		+ -> loop
