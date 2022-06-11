//
// Externals
//
// All functions declared in this file are executed in the engine.
//

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
