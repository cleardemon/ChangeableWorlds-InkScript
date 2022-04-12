//
// Doors, portals, etc.
//

// door can be opened and passed through
CONST DoorStateUnlocked = 0
// door cannot be opened and not passed through
CONST DoorStateLocked = 1
// door cannot ever be opened
CONST DoorStateSealed = 2

CONST _DoorArrayLocked = "DoorLocked"
CONST _DoorArrayUnlocked = "DoorUnlocked"

=== function DoorInit()
  // if arrays already exist, they are from a saved game, therefore don't overwrite it...
	~ temp init = false
	{ ArrayExists(_DoorArrayLocked) == false: 
		~ ArrayNewNamed(_DoorArrayLocked, 0)
		~ init = true
	}
	{ ArrayExists(_DoorArrayUnlocked) == false: 
		~ ArrayNewNamed(_DoorArrayUnlocked, 0) 
		~ init = true
	}
	{ init == true: 
		// set any DEFAULT door states here
		~ DoorSetUnlocked(DoorId_IkisFrontDoor)
	}

// returns the state of a doorId
=== function DoorGetState(doorId)
	~ temp locked = ArrayIndexOf(_DoorArrayLocked, doorId)
	~ temp unlocked = ArrayIndexOf(_DoorArrayUnlocked, doorId)
	{ 
		- locked > -1:
			~ return DoorStateLocked
		- unlocked > -1: 
			~ return DoorStateUnlocked
		- else: 
			~ return DoorStateSealed // door does not exist
	}

// sets a doorId to be locked
=== function DoorSetLocked(doorId)
	~ ArrayAdd(_DoorArrayLocked, doorId)
	~ ArrayRemove(_DoorArrayUnlocked, ArrayIndexOf(_DoorArrayUnlocked, doorId))

// sets a doorId to be unlocked
=== function DoorSetUnlocked(doorId)
	~ ArrayAdd(_DoorArrayUnlocked, doorId)
	~ ArrayRemove(_DoorArrayLocked, ArrayIndexOf(_DoorArrayLocked, doorId))

//
// Door identifiers (doorId)
// NOTE: Door IDs must be sequential. This means that doors cannot be removed once they are defined.
// If you do, you will most likely break saved games.
//

CONST DoorId_IkisFrontDoor = 1

// Update this value to the _highest_ DoorId defined above!
CONST DoorId_MAX = 1
