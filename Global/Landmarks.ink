//
// LANDMARKS
//
// Landmarks are specific areas of a city. They are referred to as single letters, e.g. A-Z. 
// These letters map directly to an area of that city (e.g. A in Thoridon is the Quadrangle).
// See the individual city definitions for a map!

// identifiers for cities that have landmarks
// adding a new city? add another one of these here, and update LandmarkInit()!
CONST LandmarkCityThoridonThird = "LandmarksThoridonThird"

=== function LandmarkInit()
	{ ArrayExists(LandmarkCityThoridonThird) == false:
		// allocate per-city landmark arrays
		~ ArrayNewNamed(LandmarkCityThoridonThird, 0)
	}

// tests if a landmark has been marked as visited (i.e. present in the array)
// usage: LandmarkIsVisited(LandmarkCityThoridonThird, "A") -- test if visited the Quadrangle
=== function LandmarkIsVisited(landmarkCity, landmark)
	~ return ArrayContains(landmarkCity, landmark)

// sets a landmark to be visited
=== function LandmarkSetVisited(landmarkCity, landmark)
	~ ArraySet(landmarkCity, landmark)

//
// Map directions
// These are just useful constants.
//

CONST MapDirectionNone = 0
CONST MapDirectionNorth = 1
CONST MapDirectionNorthEast = 2
CONST MapDirectionEast = 3
CONST MapDirectionSouthEast = 4
CONST MapDirectionSouth = 5
CONST MapDirectionSouthWest = 6
CONST MapDirectionWest = 7
CONST MapDirectionNorthWest = 8

//
// City jump targets
//

// known parts of the story - these correspond to the compiled assets (e.g. Story/Kaidan.bytes).
CONST PartKaidan = "Kaidan"
CONST PartSolus = "Solus"
CONST PartRosan = "Rosan"
CONST PartVolar = "Volar"
CONST PartVoid = "Void"
CONST PartCities = "Cities"

// enables the ability to mark a landmark as requiring to jump to a different part
// of the narrative. note that because landmarks are used in cities ONLY, a part must
// also be specified (so the game engine can load the correct part, e.g. Kaidan or Solus).
VAR CityJumpTargetLandmark = ""
// part = string used in !LOAD command (corresponds to the appropriate compiled .bytes file)
VAR CityJumpTargetPart = ""
// part divert = string that would be used to divert with in the loaded part (used by game engine)
VAR CityJumpTargetPartDivert = ""

// example:
//  ~ SetCityJumpTarget("A", PartKaidan, "kaidan_chapter_02")
=== function SetCityJumpTarget(target_landmark, target_part, target_part_divert)
	~ CityJumpTargetPart = target_part
	~ CityJumpTargetPartDivert = target_part_divert
	~ CityJumpTargetLandmark = target_landmark

=== function ClearCityJumpTargets()
	~ CityJumpTargetLandmark = ""
	~ CityJumpTargetPartDivert = ""
	~ CityJumpTargetPart = ""

=== function IsCityJumpTarget(landmark)
	~ return CityJumpTargetLandmark ? landmark

