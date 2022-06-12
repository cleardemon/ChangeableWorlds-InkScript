= residential_kasard // Q
	~ LocationVisited(Location_ThoridonKasard)

	{_UtilGetCharacterName()} wonders into {residential_kasard < 2:an area that appears to be residential|the Kasard residential ward}. 

	{ residential_kasard < 2 :
	The ward features many family homes that are spaced apart, and a small park in the middle, lined by various trees and flower beds. Paths and roadways branch off from the edge of the park, heading in east-west and northerly directions.
	
	To the south, a high wall extends east to west, as part of the city's boundary. Several bastions punctuate the wall, but are deserted.

	A small arched sign sits between two tall trees at the entrance of the park. It bears clear writing that reads "Kasard Greens".
	}
	
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonBlueCask, MapDirectionNorth)}]
		-> blue_cask_pub
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonIkisHome, MapDirectionEast)}]
		-> home_ikis
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonGatesSouth, MapDirectionWest)}]
		-> gatehouse_south
//	+ [Enter the park]
//		-> kasard_park

// = kasard_park
// 	TODO use the park for something

// 	+ [Leave the park]
// 		-> residential_kasard

