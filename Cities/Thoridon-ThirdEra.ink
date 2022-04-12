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

// LandmarkO-DagardResidential.ink
= residential_dagard // O
	TODO describe medium quality residential area (NE)
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "O")
	<- jump_load("O")

	Inside a medium quality residential area.

	+ [{ThoridonThirdEraGoToLandmark("N", MapDirectionNorth)}]
		-> residential_hexard
	+ [{ThoridonThirdEraGoToLandmark("E", MapDirectionSouth)}]
		-> gatehouse_east


// LandmarkQ-KasardResidential.ink
= residential_kasard // Q
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "Q")
	<- jump_load("Q")

	{_UtilGetCharacterName()} wonders into {residential_kasard < 2:an area that appears to be residential|the Kasard residential ward}. 

	{ residential_kasard < 2 :
	The ward features many family homes that are spaced apart, and a small park in the middle, lined by various trees and flower beds. Paths and roadways branch off from the edge of the park, heading in east-west and northerly directions.
	
	To the south, a high wall extends east to west, as part of the city's boundary. Several bastions punctuate the wall, but are deserted.

	A small arched sign sits between two tall trees at the entrance of the park. It bears clear writing that reads "Kasard Greens".
	}
	
	+ [{ThoridonThirdEraGoToLandmark("M", MapDirectionNorth)}]
		-> blue_cask_pub
	+ [{ThoridonThirdEraGoToLandmark("J", MapDirectionEast)}]
		-> home_ikis
	+ [{ThoridonThirdEraGoToLandmark("S", MapDirectionWest)}]
		-> gatehouse_south
//	+ [Enter the park]
//		-> kasard_park

// = kasard_park
// 	TODO use the park for something

// 	+ [Leave the park]
// 		-> residential_kasard


// LandmarkK-EmperorResidence.ink
= home_emperor // K
	TODO describe the emperor's residence
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "K")
	<- jump_load("K")

	Outside the Emperor's residence.

	+ [{ThoridonThirdEraGoToLandmark("N", MapDirectionEast)}]
		-> residential_hexard


// LandmarkM-BlueCaskPub.ink
= blue_cask_pub // M
	// large open downstairs, roaring fireplace central
	// just a pub, not an inn (no bedrooms)
	// benches inside, tables
	// clientele subdued, locals

	<- jump_load("M")

	In amongst smaller buildings stands an eye-changing place. With hints of blue all around the outside of a single, large building, and some well-attended seating, stands a large blue barrel. Behind this barrel lies a wide door that leads inside. The path leading up to the door is well trodden, and an orange flickering glow emanating from the various windows grabs one's attention.

	// if it is afternoon and before dusk, add a note to say that lots of people come and go

	+ [Enter {KnowledgeIsKnown(KnowledgeGlobalThoridonBlueCask):The Blue Cask|inside}]
		// player only knows what this landmark is if they have entered inside
		~ LandmarkSetVisited(LandmarkCityThoridonThird, "M")
		-> blue_cask_inside
	+ [{ThoridonThirdEraGoToLandmark("G", MapDirectionWest)}]
		-> guardhouse
	+ [{ThoridonThirdEraGoToLandmark("S", MapDirectionSouthWest)}]
		-> gatehouse_south
	+ [{ThoridonThirdEraGoToLandmark("Q", MapDirectionSouth)}]
		-> residential_kasard
	+ [{ThoridonThirdEraGoToLandmark("P", MapDirectionEast)}]
		-> residential_nador


// LandmarkJ-IkisHome.ink
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

// LandmarkB-SenateHouse.ink
= senate_house // B
	TODO describe the exterior of the Senate House
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "B")
	<- jump_load("B")

	Outside the Senate House.

	+ [{ThoridonThirdEraGoToLandmark("A", MapDirectionEast)}]
		-> quadrangle


// LandmarkG-Guardhouse.ink
= guardhouse // G
	TODO describe the exterior of the guardhouse
	// to be Warlock Council in the fourth era
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "G")
	<- jump_load("G")

	A large building stands here, with many windows and doors from all sides. It is on two storeys, and is pretty unremarkable considering other places in Thoridon. While it seems like it is an open, and welcoming location, there are guards standing on each of the doors, similar to the ones at the city gates.

	An inner wall separates this area with {LandmarkIsVisited(LandmarkCityThoridonThird, "A"):the Quadrangle|what lies to the north}.

	// make it busy during daylight hours, for people going through the Quadrangle

	// if Kaidan is trying to get to the Institute, add a hint
	{ IsCityJumpTarget("D") && ClockIsCurrentTimeBetweenPri(CTimeSpanMorningEarly, CTimeSpanNoon): 
	There are a number of others, dressed in similar robes as Kaidan, making their way northwards.
	}

	+ [Approach an entrance]
		Something about approaching the guardhouse. TODO
		-> guardhouse
	+ [{ThoridonThirdEraGoToLandmark("A", MapDirectionNorth)}]
		-> quadrangle
	+ [{ThoridonThirdEraGoToLandmark("S", MapDirectionSouth)}]
		-> gatehouse_south
	+ [{ThoridonThirdEraGoToLandmark("H", MapDirectionWest)}]
		-> union_market_new
	+ [{ThoridonThirdEraGoToLandmark("M", MapDirectionEast)}]
		-> blue_cask_pub


// LandmarkW-WesternGate.ink
= gatehouse_west // W
	TODO describe western gatehouse
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "W")
	<- jump_load("W")

	Outside the western gatehouse.

	+ [Go west]
		Leave?!
		-> gatehouse_west
	+ [{ThoridonThirdEraGoToLandmark("I", MapDirectionNorth)}]
		-> union_market_old
	+ [{ThoridonThirdEraGoToLandmark("L", MapDirectionNorthEast)}]
		-> old_gatehouse_inn


// LandmarkN-HexardResidential.ink
= residential_hexard // N
	TODO describe high quality residential area (NE)
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "N")
	<- jump_load("N")

	Inside a high quality residential area.

	+ [{ThoridonThirdEraGoToLandmark("K", MapDirectionWest)}]
		-> home_emperor
	+ [{ThoridonThirdEraGoToLandmark("O", MapDirectionSouth)}]
		-> residential_dagard


// LandmarkS-SouthernGate.ink
= gatehouse_south // S
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "S")
	<- jump_load("S")

	{ 
		- gatehouse_south < 2:
	{_UtilGetCharacterName()} arrives in an open area that has many paths, disappearing down streets from west to east. But most obvious is the large, heavily-enforced steel gate that arches overhead. The gate provides ingress through the city's wall.

	Several small shacks line the gate itself and a few burly individuals stand around on the edges of the open gate, that appear to be guarding it.
		- else:
	{_UtilGetCharacterName()} stands at an intersection of many paths, with the gate to the south.
	}

	+ [{ThoridonThirdEraGoToLandmark("T", MapDirectionWest)}]
		-> residential_gomard
	+ [{ThoridonThirdEraGoToLandmark("H", MapDirectionNorthWest)}]
		-> union_market_new
	+ [{ThoridonThirdEraGoToLandmark("G", MapDirectionNorth)}]
		-> guardhouse
	+ [{ThoridonThirdEraGoToLandmark("M", MapDirectionNorthEast)}]
		-> blue_cask_pub
	+ [{ThoridonThirdEraGoToLandmark("Q", MapDirectionEast)}]
		-> residential_kasard
	+ {not guards_south_denied} [Approach the guards]
		-> guards_south(false)
	+ {not guards_south_denied} [Go through the gate]
		-> guards_south(true)

= guards_south_denied
		{_UtilGetCharacterName()} approaches the guards again. One of them nods, causing another to turn around, and then they shake their head.

		Guard: You're not getting going into the Flatlands, just be on your way.

		+ [Leave the gate]
			-> gatehouse_south

= guards_south(walk_gate)
	{ guards_south > 1: -> guards_south_denied	}

	{walk_gate :
	{_UtilGetCharacterName()} walks towards the open gate, but on approach, one of the guards holds out an arm and moves directly towards {_UtilGetCharacterPronoun(true)}.

	Guard: Hold there, please.
	}
	{not walk_gate:
	{_UtilGetCharacterName()} walks up to one of the guards who stand near one of the small shacks. One of them turns to face {_UtilGetCharacterName()}.

	Guard: Is something the matter?
	}
	
	* {walk_gate} [Ask what the problem is]
		{_UtilGetCharacterName()}: What appears to be the problem?
		Guard: Not a problem, you see. But, you can't go out there wearing that.
	
	* {not walk_gate} [Ask to go through the gate]
		{_UtilGetCharacterName()}: Can I go out there?
		The guard looks {_UtilGetCharacterName()} up and down and sniggers.
		Guard: Not dressed like that.

	{_UtilGetCharacterName()}: I see.
	Guard: If you want to proceed, you need to either have some sort of proof that you can handle yourself in the Flatlands, or you have someone to accompany you.
	Guard: Neither you seem to have.
	
	{PlayerCurrentCharacter == CCharacterKaidan:
		The guard points at Kaidan's robes.
		Guard: Shouldn't you be in lectures, anyway?
	}

	- (loop)
		** [Ask about the Flatlands]
			{_UtilGetCharacterName()} looks past the guard and out through the gate, trying to see what is beyond.

			{_UtilGetCharacterName()}: What is special about the Flatlands?
			Guard: You mean you haven't been out there?

			*** [Say you have not]
				{_UtilGetCharacterName()}: I have not.
				The guard laughs.
				Guard: Well, city boy, nothing out there for you.
				-> loop
			*** [Say you have]
				{_UtilGetCharacterName()}: Of course I have.
				Guard: Then you will know about the bogland. But what's special about it? Nothing.
				-> loop
			*** [Say you are just curious]
				{_UtilGetCharacterName()}: I was just wondering.
				Guard: Maybe you'll see one day. You probably don't want to get your feet stuck in the mud, though.
				The guard laughs, turns around to the other guards, who also laugh back, despite them not hearing the quip at {_UtilGetCharacterName()}'s expense.
				-> loop
		** [Ask about being a guard]
			{_UtilGetCharacterName()}: How is guard work lately?
			Guard: That's for me to know.
			-> loop
		** [Ask about the gate]
			{_UtilGetCharacterName()}: What do you know about the gate?
			Guard: It's heavy.
			The guard has nothing else to say, causing {_UtilGetCharacterName()} to feel a bit uncomfortable.
			-> loop
		** [Ask about the wall]
			{_UtilGetCharacterName()}: What is the purpose of the wall?
			The guard laughs.
			Guard: You ask some funny questions. Keeps people like you and me safe.

			*** [Safe from what?]
				{_UtilGetCharacterName()}: Safe from what?
				Guard: Who knows? The wild life? The weirdos that come from overseas? The weirdos inside the walls? 
				The guard chortles.
				-> loop
			*** [Nod without questioning]
				{_UtilGetCharacterName()} nods and the guard just looks on. It seems like this questioning is wasting the guard's time.
				-> loop

		** [Ask what the protection is for]
			{_UtilGetCharacterName()}: Why do I need someone to accompany me?
			The guard laughs.
			Guard: Being honest, I don't think you would last a day out there.
			-> loop
		++ [Leave the gate]
			-> gatehouse_south

	-> gatehouse_south


// LandmarkL-OldGatehouseInn.ink
= old_gatehouse_inn // L
	// coaching inn? 
	TODO describe Old Gatehouse Inn
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "L")
	<- jump_load("L")

	Outside the Old Gatehouse Inn.

	+ [{ThoridonThirdEraGoToLandmark("I", MapDirectionWest)}]
		-> union_market_old
	+ [{ThoridonThirdEraGoToLandmark("W", MapDirectionSouthWest)}]
		-> gatehouse_west
	+ [{ThoridonThirdEraGoToLandmark("A", MapDirectionSouth)}]
		Cross the river to the Quadrangle.
		-> quadrangle


// LandmarkF-HallOfLegends.ink
= hall_of_legends // F
	TODO describe the exterior of the Hall of Legends
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "F")
	<- jump_load("F")

	Outside the Hall of Legends.

	+ [{ThoridonThirdEraGoToLandmark("D", MapDirectionWest)}]
		-> synth_institute
	+ [{ThoridonThirdEraGoToLandmark("C", MapDirectionSouth)}]
		-> temple_of_ramor

// LandmarkP-NadorResidential.ink
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


// LandmarkH-MarketplaceNew.ink
= union_market_new // H
	TODO describe the bustling marketplace, run by the People's Union
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "H")
	<- jump_load("H")

	In the People's Union marketplace.

	+ [{ThoridonThirdEraGoToLandmark("G", MapDirectionEast)}]
		-> guardhouse
	+ [{ThoridonThirdEraGoToLandmark("T", MapDirectionSouth)}]
		-> residential_gomard
	+ [{ThoridonThirdEraGoToLandmark("S", MapDirectionSouthEast)}]
		-> gatehouse_south


// LandmarkD-SynthInstitute.ink
= synth_institute // D
	TODO describe the exterior of the Synth Institute
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "D")
	<- jump_load("D")

	Outside the Synth Institute.

	+ [{ThoridonThirdEraGoToLandmark("F", MapDirectionEast)}]
		-> hall_of_legends
	+ [{ThoridonThirdEraGoToLandmark("A", MapDirectionSouth)}]
		-> quadrangle


// LandmarkT-GomardResidential.ink
= residential_gomard // T
	TODO describe low quality residential area (NE)
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "T")
	<- jump_load("T")

	Inside a low quality residential area.

	+ [{ThoridonThirdEraGoToLandmark("U", MapDirectionWest)}]
		-> residential_esdor
	+ [{ThoridonThirdEraGoToLandmark("S", MapDirectionEast)}]
		-> gatehouse_south
	+ [{ThoridonThirdEraGoToLandmark("H", MapDirectionNorth)}]
		-> union_market_new


// LandmarkI-MarketplaceOld.ink
= union_market_old // I
	TODO describe the deteriorating marketplace, formerly run by the People's Union
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "I")
	<- jump_load("I")

	In the People's Union unused marketplace.
	
	+ [{ThoridonThirdEraGoToLandmark("W", MapDirectionSouth)}]
		-> gatehouse_west
	+ [{ThoridonThirdEraGoToLandmark("L", MapDirectionEast)}]
		-> old_gatehouse_inn


// LandmarkE-EasternGate.ink
= gatehouse_east // E
	TODO describe eastern gatehouse
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "E")
	<- jump_load("E")
	
	Outside the eastern gatehouse.

	+ [Go east]
		Leave?!
		-> gatehouse_east
	+ [{ThoridonThirdEraGoToLandmark("O", MapDirectionNorth)}]
		-> residential_dagard
	+ [{ThoridonThirdEraGoToLandmark("M", MapDirectionSouthWest)}]
		-> blue_cask_pub
	+ [{ThoridonThirdEraGoToLandmark("P", MapDirectionSouth)}]
		-> residential_nador


// LandmarkA-Quadrangle.ink
= quadrangle // A

	// mark as seen
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "A")
	<- jump_load("A")

	TODO describe the Quadrangle
	{ quadrangle == 1:
	Central to everything in the city of Thoridon stands a large, rectangular courtyard known as the Quadrangle. 
	}

	+ [{ThoridonThirdEraGoToLandmark("D", MapDirectionNorth)}]
		-> synth_institute
	+ [{ThoridonThirdEraGoToLandmark("G", MapDirectionSouth)}]
		-> guardhouse
	+ [{ThoridonThirdEraGoToLandmark("C", MapDirectionEast)}]
		-> temple_of_ramor
	+ [{ThoridonThirdEraGoToLandmark("B", MapDirectionWest)}]
		-> senate_house
	+ [{ThoridonThirdEraGoToLandmark("L", MapDirectionNorthWest)}]
		Cross the bridge to Inn A.
		-> old_gatehouse_inn


// LandmarkU-EsdorResidential.ink
= residential_esdor // U
	TODO describe medium quality residential area (NE)
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "U")
	<- jump_load("U")

	Inside a medium quality residential area.

	+ [{ThoridonThirdEraGoToLandmark("T", MapDirectionEast)}]
		-> residential_gomard


// LandmarkC-TempleOfRamor.ink
= temple_of_ramor // C
	TODO describe the exterior of the Temple of Ramor
	~ LandmarkSetVisited(LandmarkCityThoridonThird, "C")
	<- jump_load("C")

	Outside the Temple of Ramor.

	+ [{ThoridonThirdEraGoToLandmark("F", MapDirectionNorth)}]
		-> hall_of_legends
	+ [{ThoridonThirdEraGoToLandmark("A", MapDirectionWest)}]
		-> quadrangle


// Inside.ink
//
// The Blue Cask Pub
//

=== blue_cask_inside

TODO write what happens in the Blue Cask
Inside the Blue Cask.

+ [Leave]
	{_UtilGetCharacterName()} leaves The Blue Cask.
	-> city_thoridon_third.blue_cask_pub

