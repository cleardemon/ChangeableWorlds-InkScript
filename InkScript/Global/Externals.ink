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

// records a location as being visited, and sets the player to be at that location in the engine
EXTERNAL LocationVisited(locationId)
// tests if a location has been previously recorded
EXTERNAL LocationHasVisited(locationId)
// retrieves the name of a location. this name is localised.
EXTERNAL LocationGetName(locationId)

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

//
// Character
//

CONST CharacterStatTypeHealth = 0
CONST CharacterStatTypeFortitude = 1
CONST CharacterStatTypeStrength = 2
CONST CharacterStatTypeAvoidance = 3
CONST CharacterStatTypeCharm = 4

CONST CharacterEquipmentSlotMainHand = 0
CONST CharacterEquipmentSlotBelt = 1
CONST CharacterEquipmentSlotClothing = 2
CONST CharacterEquipmentSlotNeck = 3

// gets a statistic value from a character. returns the value as int
EXTERNAL CharacterGetStatValue(characterId, statType)
// gets a raw statistic value from a character. this does not have status effects applied. returns value as int
EXTERNAL CharacterGetStatValueBase(characterId, statType)
// changes a raw statistic value on a character. status effects recomputed afterwards. return new base value as int.
EXTERNAL CharacterChangeStatValue(characterId, statType, delta)
// applies a status effect to a character
EXTERNAL CharacterAddStatusEffect(characterId, effectId)
// attempts to equip an item on a character. returns false if it could not be slotted.
EXTERNAL CharacterEquipItem(characterId, equipmentId, slotType)
// removes an equipped item on a character. returns the equipmentId if removed, empty string if not.
EXTERNAL CharacterRemoveEquipItem(characterId, equipmentId)
// retrieves the forename of the character, a string.
EXTERNAL CharacterGetName(characterId)
// retrieves the full name (forename + surname) of the character, optionally with any title (bool). returns string
EXTERNAL CharacterGetFullName(characterId, withTitle)
// attempts to add a combat ability to a character. returns true/false if added or not
EXTERNAL CharacterAddAbility(characterId, abilityId)
// attempts to remove a combat ability from a character. returns true/false if removed or not
EXTERNAL CharacterRemoveAbility(characterId, abilityId)


//
// Player Character
//

// retrieves the PC name, as defined by the player. string.
EXTERNAL PlayerGetName()
// returns true/false if the PC is currently possessing a character
EXTERNAL PlayerIsPossessed()
// returns character ID or empty string for the possessed character by the PC
EXTERNAL PlayerGetPossessedId()
// sets the PC to be possessing an instance of the specified character ID. empty string removes possession.
EXTERNAL PlayerSetPossessed(characterId)
// returns true/false if the PC (not possessed character) knows the specified combat ability ID
EXTERNAL PlayerHasAbility(abilityId)
// attempts to add a combat ability to the PC (not possessed character). returns true/false if added or not
EXTERNAL PlayerAddAbility(abilityId)
// removes a combat ability from the PC (not possessed character)
EXTERNAL PlayerRemoveAbility(abilityId)
// gets a statistic value from the possessed character by the PC. returns the value as int, or -1 if not possessing
EXTERNAL PlayerGetStatValue(statType)
// gets a raw statistic value from the possessed character by the PC. this does not have status effects applied. returns value as int, or -1 if not possessing
EXTERNAL PlayerGetStatusValueBase(statType)
// changes a raw statistic value on the possessed character by the PC. status effects recomputed afterwards. return new base value as int, or -1 if not possessing.
EXTERNAL PlayerChangeStatValue(statType, delta)
// returns true/false if the possessed character has an equipmentId equipped.
EXTERNAL PlayerIsEquipped(equipmentId)
// applies a status effect to the possessed character. check possession is true first.
EXTERNAL PlayerAddStatusEffect(effectId)

//
// Climate
//

// weather conditions
CONST ClimateConditionClear = 0
CONST ClimateConditionCloudHigh = 1
CONST ClimateConditionCloudLow = 2
CONST ClimateConditionMist = 3
CONST ClimateConditionFog = 4
CONST ClimateConditionRainLight = 5
CONST ClimateConditionRainHeavy = 6
CONST ClimateConditionShowers = 7
CONST ClimateConditionSleet = 8
CONST ClimateConditionThunderstorm = 9
CONST ClimateConditionSnow = 10
CONST ClimateConditionDust = 11
CONST ClimateConditionAshFall = 12

// randomises the climate by a number of ticks
EXTERNAL ClimateRandomise(locationId, ticks)
// returns the current temperature, in celsius, in the current player location
EXTERNAL ClimateGetTemperature()
// returns the current weather at the current player location (see climate conditions above)
EXTERNAL ClimateGetCondition()

//
// Date and Time
//

// time spans
CONST TimeSpanMidnight = 0
CONST TimeSpanNight = 1
CONST TimeSpanDawn = 2
CONST TimeSpanMorningEarly = 3
CONST TimeSpanMorning = 4
CONST TimeSpanMorningLate = 5
CONST TimeSpanNoon = 6
CONST TimeSpanAfternoonEarly = 7
CONST TimeSpanAfternoon = 8
CONST TimeSpanAfternoonLate = 9
CONST TimeSpanDusk = 10

// returns true it is currently daylight
EXTERNAL TimeIsDaylight()
// returns true if the current time is between two time spans
EXTERNAL TimeIsBetween(spanA, spanB)
// returns a formatted date string, with optional weekday
EXTERNAL TimeGetFormattedDate(bool includeWeekday)
// returns the current weekday (as a name)
EXTERNAL TimeGetWeekday()
// returns the current time (see time spans above)
EXTERNAL TimeGetTimeSpan()
// moves time forward by one tick
EXTERNAL TimeAdvance()
// moves the clock forward to the specified time span
EXTERNAL TimeAdvanceTo(timeSpan)
// moves time forward by a number of ticks. must be at least one.
EXTERNAL TimeAdvanceBy(ticks)
// moves time forward by a number of days. must be at least one.
EXTERNAL TimeAdvanceDays(days)
// sets the date of the world at the specified location, to the specified days, month, and year
EXTERNAL TimeSetDate(locationId, day, month, year)
// sets the time to the specified number of ticks at the specified location
EXTERNAL TimeSetTime(locationId, ticks)

//
// Platform externals
//

EXTERNAL ScriptLoad(script, divert)
