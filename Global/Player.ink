//
// PLAYER
//

// note that this list also remembers the state of possessed characters by the player.
// it is not possible for the player to possess the same character again.
CONST CCharacterNone = 0
CONST CCharacterKaidan = 1
CONST CCharacterSolus = 2
CONST CCharacterRosan = 3
CONST CCharacterVolar = 4

CONST CFactionYolen = 0
CONST CFactionShaler = 1
CONST CFactionKaidis = 2
CONST CFactionJanzat = 3

// name of the player, when not possessing
VAR PlayerName = "ThePlayer"
// current possessed character (one of the character constants)
VAR PlayerCurrentCharacter = CCharacterNone
// world player is currently occupying
VAR PlayerCurrentWorld = CWorldTypePri

/*
FACTIONS
*/

// scores that determine their alignment
CONST CFactionAlignmentHated = -100
CONST CFactionAlignmentHostile = -50
CONST CFactionAlignmentUnfriendly = -25
CONST CFactionAlignmentNeutral = 0
CONST CFactionAlignmentFriendly = 25
CONST CFactionAlignmentHonoured = 50
CONST CFactionAlignmentRevered = 100

// variables that record the current alignment for a faction
VAR PlayerFactionAlignmentShaler = CFactionAlignmentNeutral
VAR PlayerFactionAlignmentKaidis = CFactionAlignmentNeutral
VAR PlayerFactionAlignmentJanzat = CFactionAlignmentNeutral
VAR PlayerFactionAlignmentYolen = CFactionAlignmentNeutral
