/*
Thoridon in the 3rd Era

Landmarks:
A: Quadrangle
B: Senate House
C: Temple of Ramor
D: Synth Institute
E: Eastern gatehouse (Osshek)
F: Hall of Legends
G: Guardhouse
H: People's Union marketplace (new)
I: People's Union marketplace (old)
J: Home of Kaidan/Ikis
K: Emperor's residence
L: The Old Gatehouse Inn
M: The Blue Cask Inn
N: High residence: Hexard (Leader ward)
O: Medium residence: Dagard (Day ward)
P: Low residence: Nador (Old visit)
Q: Medium residence: Kasard (Flower ward)
R: River
S: Southern gatehouse (Surhek)
T: Low residence: Gomard (Black ward)
U: Medium residence: Esdor (Water visit)
W: Western gatehouse (Weshek)

← ↑ → ↓ ↔ ↕  

+---+---+---+---+---+
| I ↔ L | R | K ↔ N |
+-↕-/-↕-+---+---+-↕-+
← W | R\| D ↔ F | O |
+---+---\-↕-+-↕-+-↕-+
| R | B ↔ A ↔ C | E →
+---+---+-↕-+---/-↕-+
| R | H ↔ G ↔ M ↔ P |
+---+-↕-\-↕-/-↕-+-↕-+
| U ↔ T ↔ S ↔ Q ↔ J |
+---+---+-↓-+---+---+

J/Q/P/S/M/G/A/D
*/

// maps landmark to a displayable name
=== function ThoridonThirdEraGoToLandmark(landmark, direction)
	~ temp name = ""
	~ temp dir = ""
	{ direction: 
		- MapDirectionNorth: ~ dir = "north"
		- MapDirectionNorthEast: ~ dir = "northeast"
		- MapDirectionNorthWest: ~ dir = "northwest"
		- MapDirectionSouth: ~ dir = "south"
		- MapDirectionSouthEast: ~ dir = "southeast"
		- MapDirectionSouthWest: ~ dir = "southwest"
		- MapDirectionEast: ~ dir = "east"
		- MapDirectionWest: ~ dir = "west"
	}
	{ LandmarkIsVisited(LandmarkCityThoridonThird, landmark):
		{ landmark:
			- "A": ~ name = "Quadrangle"
			- "B": ~ name = "Senate House"
			- "C": ~ name = "Temple of Ramor"
			- "D": ~ name = "Synth Institute"
			- "E": ~ name = "Osshek Gatehouse"
			- "F": ~ name = "Hall of Legends"
			- "G": ~ name = "Guardhouse"
			- "H": ~ name = "People's Union Marketplace"
			- "I": ~ name = "People's Union Old Marketplace"
			- "J": ~ name = "Home of Kaidan"
			- "K": ~ name = "Emperor's Residence"
			- "L": ~ name = "Old Gatehouse Inn"
			- "M": ~ name = "The Blue Cask"
			- "N": ~ name = "Hexard district"
			- "O": ~ name = "Dagard district"
			- "P": ~ name = "Nador district"
			- "Q": ~ name = "Kasard district"
			- "R": ~ name = "River"
			- "S": ~ name = "Surhek Gatehouse"
			- "T": ~ name = "Gomard district"
			- "U": ~ name = "Esdor district"
			- "W": ~ name = "Weshek Gatehouse"
		}
	}
	{ name:
		- "":
			~ name = "Go " + dir
		- else:
			~ name = "Go to " + name + " ({dir})"
	}
	~ return name

=== city_thoridon_third
// don't navigate directly to this knot - use one of the stitches (e.g. city_thoridon_third.quadrangle)

// this thread is used to test if there is a jump target (that is, if the story needs to load a new script when entering a landmark).
// since functions can't contain diverts, this is the workaround.
// nothing happens if the landmark does not match
// jump targets are defined using SetCityJumpTarget().
= jump_load(landmark)
	{ IsCityJumpTarget(landmark):
		// copy these to locals
		~ temp part = CityJumpTargetPart
		~ temp divert = CityJumpTargetPartDivert 
		// clear the global variables
		~ ClearCityJumpTargets()
		// issue load command for engine
		!LOAD {part} {divert}
		// nothing more to execute at all (control should have transferred to the part in the load command)
		-> END
	}
	// not jump target, do nothing
	-> DONE
