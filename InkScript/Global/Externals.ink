//
// Externals
//
// All functions declared in this file are executed in the engine.
//

// defines a globally recognised character ID that refers directly to the player.
// this may mean the actual player character (in Yolen), or their possessed character, depending on context
CONST PlayerCharacter = "PC"

// Arrays

// allocates a new array. returns an array key, use it with other Array functions. 
// arrays created this way are freed on !LOAD
// capacity defines how many zeroed items should be added to the array (if 0, none are added).
EXTERNAL ArrayNew(capacity)
// allocates a new array using the specified key (a string). 
// arrays created this way survive !LOAD commands
EXTERNAL ArrayNewNamed(name, capacity)
// removes an array from memory
EXTERNAL ArrayFree(arr)
// returns a value from an array using the specific index (a zero or greater value)
EXTERNAL ArrayGet(arr, index)
// adds a value to the end of an array
// returns index where it was added
EXTERNAL ArrayAdd(arr, value)
// adds a value to the end of an array, if it is not already in the array
// returns index of item (either where it currently is, or where it was added)
EXTERNAL ArraySet(arr, value)
// sets a specific index in an array to the specified value
// return true if successful, false if not (array must exist!)
EXTERNAL ArraySetAt(arr, index, value)
// removes a value from an array at the specific index. returns true if successful.
EXTERNAL ArrayRemove(arr, index)
// returns the index of a value in an array, or -1 if not found
EXTERNAL ArrayIndexOf(arr, value)
// clears all values from an array
EXTERNAL ArrayClear(arr)
// returns number of items in an array, or -1 if array not found
EXTERNAL ArrayCount(arr)

=== function ArrayContains(arr, value)
	~ return ArrayIndexOf(arr, value) > -1

=== function ArrayExists(arrName)
	~ return ArrayCount(arrName) > -1

//
// Strings
//

// returns the character string from a string at index: StringCharAt("cat", 1) == "a"
EXTERNAL StringCharAt(str, index)
// returns the length of the string
EXTERNAL StringLength(str)
// returns a substring from a string, from an index with a maximum length: StringSubstringLength("word", 1, 2) == "or"
// if length exceeds the actual string length, it will be truncated
// if index is outside the string, an empty string is returned
EXTERNAL StringSubstringLength(str, index, length)
// returns a substring of a string, from a starting index, to the end of the string: StringSubstring("word", 1) == "ord"
// if index is outside the string, an empty string is returned
EXTERNAL StringSubstring(str, index)
// returns the UTF-16 character code at the specified index, as an integer: StringCharInteger("A", 0) == 65
EXTERNAL StringCharInteger(str, index)

//
// Logging
//

// write a message to the game log (appears in all builds!)
EXTERNAL LOG(msg)
// write a debug message to the game log (does NOT appear in release builds)
// messages will also NOT get compiled into the InkScript binaries in release builds.
EXTERNAL DEBUG (msg) // the space here is to fool Cake to not comment out this line

//
// Location
//

// updates the engine to move the player to the specific location ID (as defined in the location database)
EXTERNAL LocationSetPlayer(locationId)

//
// Doors
// Door IDs are completely arbitrary and case-sensitive.
//

// test if the door is locked or not
EXTERNAL DoorIsLocked(doorId)
// set the door to be locked. if sealed, won't change
EXTERNAL DoorLock(doorId)
// set the door to be permanently sealed. it can never be unlocked.
EXTERNAL DoorSeal(doorId)
// attempt to unlock door. if sealed, it will fail. returns true if unlocked, false otherwise.
EXTERNAL DoorTryUnlock(doorId)

//
// Factions
//

CONST AlignmentHated = -3
CONST AlignmentHostile = -2
CONST AlignmentUnfriendly = -1
CONST AlignmentNeutral = 0
CONST AlignmentFriendly = 1
CONST AlignmentHonoured = 2
CONST AlignmentRevered = 3

// adds a delta score (integer) to the specified faction on the specified character
EXTERNAL FactionAddScoreCharacter(characterId, factionId, delta)
// adds a delta score (integer) to the specified faction to the player character
// if usePossession is false, always uses the player character faction, otherwise attempts to change the possessed
// character first
EXTERNAL FactionAddScorePlayer(factionId, delta, usePossession)
// returns the score of the faction for the specified character (see const above)
EXTERNAL FactionGetScoreCharacter(characterId, factionId)
// this gets the _effective_ score of the faction. that means, if the possessed character has a faction, it
// will use that value, otherwise, it will use the value from the player character.
EXTERNAL FactionGetScorePlayer(factionId)

//
// Inventory
// Use characterId of PlayerCharacter to test against the player's possessed character
//

// returns true if the character inventory contains the inventory item
EXTERNAL InventoryContains(characterId, inventoryId)
// attempts to add the item to the character inventory. returns false if not enough space.
EXTERNAL InventoryAddItem(characterId, inventoryId)
// attempts to remove an item from a character inventory. returns true if it was removed.
EXTERNAL InventoryRemoveItem(characterId, inventoryId)

//
// Knowledge
// See Knowledge.ink for a list of knowledge keys.
//

// tests if knowledge is known by the player character OR the possessed character
EXTERNAL KnowledgePlayerIsKnown(knowledgeKey)
// tests is knowledge is known by specific character
EXTERNAL KnowledgeCharacterIsKnown(knowledgeKey)
// adds a knowledge key to the player character only. returns false if already known
EXTERNAL KnowledgePlayerAdd(knowledgeKey)
// adds a knowledge key to the possessed character of the player. returns false if no possessed character or already known
EXTERNAL KnowledgePlayerPossessedAdd(knowledgeKey)
// adds a knowledge key to a specific character. returns false if already known
EXTERNAL KnowledgeCharacterAdd(characterId, knowledgeKey)

