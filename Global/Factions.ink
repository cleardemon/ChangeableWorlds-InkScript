/*
FACTIONS
*/

// scores that determine their alignment
CONST FactionAlignmentHated = -100
CONST FactionAlignmentHostile = -50
CONST FactionAlignmentUnfriendly = -25
CONST FactionAlignmentNeutral = 0
CONST FactionAlignmentFriendly = 25
CONST FactionAlignmentHonoured = 50
CONST FactionAlignmentRevered = 100

CONST _FactionArrayId = "Factions"

// initialise factions
=== function FactionInit()
  // if an array already exists, it is because it has been loaded from a saved game,
	// therefore don't overwrite it...
	{ ArrayExists(_FactionArrayId) == false:
		~ ArrayNewNamed(_FactionArrayId, Faction_MAX)
		// configure faction IDs here
		~ ArraySetAt(_FactionArrayId, Faction_Kaidan_Ikis, FactionAlignmentUnfriendly) // by default, Ikis and Kaidan do not get along
	}

// changes a score of a faction by the specified delta (positive/negative)
// will not go outside of min/max boundaries
=== function FactionAddScore(factionId, scoreDelta)
	~ temp amount = ArrayGet(_FactionArrayId, factionId) + scoreDelta
	{ 
		- amount < FactionAlignmentHated: 
			~ amount = FactionAlignmentHated
		- amount > FactionAlignmentRevered:
			~ amount = FactionAlignmentRevered
	}
	~ ArraySetAt(_FactionArrayId, factionId, amount)
	~ return amount

// determines what alignment a faction currently has
=== function FactionGetAlignment(factionId)
	~ temp score = ArrayGet(_FactionArrayId, factionId)
	{
		- score < FactionAlignmentHostile:
			~ return FactionAlignmentHated
		- score >= FactionAlignmentHostile && score < FactionAlignmentUnfriendly:
			~ return FactionAlignmentHostile
		- score >= FactionAlignmentUnfriendly && score < FactionAlignmentNeutral:
			~ return FactionAlignmentUnfriendly
		- score >= FactionAlignmentNeutral && score < FactionAlignmentFriendly:
			~ return FactionAlignmentNeutral
		- score >= FactionAlignmentFriendly && score < FactionAlignmentHonoured:
			~ return FactionAlignmentFriendly
		- score >= FactionAlignmentHonoured && score < FactionAlignmentRevered:
			~ return FactionAlignmentHonoured
		- score >= FactionAlignmentRevered:
			~ return FactionAlignmentRevered
	}
	~ return FactionAlignmentNeutral

//
// Faction IDs
//

CONST Faction_Kaidan_Ikis = 0

CONST Faction_MAX = 1
