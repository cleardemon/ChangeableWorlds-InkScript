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
	{ LocationHasVisited(landmark):
		~ name = LocationGetName(landmark)
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

