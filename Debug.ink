//
// DEBUG
// 
// This is only included in the Ink compile when DEBUG is the current configuration.
// It will not appear in release builds.
//
// Feel free to set anything you would like here, including defining includes, entry points and variables.
// Just remember: in release, none of this will be available.
//
// Example launch method:
// ./build.sh --target RunConsoleGame -- --chapter-name Debug --chapter-entry debug_array_test
//

=== debug_string_test

	Length of string should be 6: {StringLength("string")}
	Length should be zero: {StringLength("")}
	Character should be 'a' in 'character' at index 4: {StringCharAt("character", 4)}
	Character should be 'r' in 'character' at index 8: {StringCharAt("character", 8)}
	Character should be empty in 'character' at index 99: {StringCharAt("character", 99)}
	Substring should be 'or' in 'word' from index 1, length 2: {StringSubstringLength("word", 1, 2)}
	Substring should be 'ord' in 'word' from index 1: {StringSubstring("word", 1)}
	Substring should be 'ord' in 'word' from index 1, length 99: {StringSubstringLength("word", 1, 99)}
	Substring should be empty in 'word' from index 99, length 99: {StringSubstringLength("word", 99, 99)}
	Substring should be empty in 'word' from index 99: {StringSubstring("word", 99)}
	Integer char should be 65 from 'ABC' at index 0: {StringCharInteger("ABC", 0)}
	Integer char should be 67 from 'ABC' at index 2: {StringCharInteger("ABC", 2)}
	Integer char should be zero from 'ABC' at index 99: {StringCharInteger("ABC", 99)}
	Integer char should be something from '😊' at index 0: {StringCharInteger("😊", 0)}

	->END
	
=== debug_array_test

  ~ ArrayNewNamed("persist", 0)

	~ temp local = ArrayNew(0)
	~ ArrayAdd(local, "Hello") 
	~ ArrayAdd(local, "World")

	Test local get: {ArrayGet(local, 0)} {ArrayGet(local, 1)}.

	// delete hello
	~ ArrayRemove(local, 0)

	Test remove (should say Hello World): Hello {ArrayGet(local, 0)}.
	There are {ArrayCount(local)} item(s) in the local test.

	// change World to Hello
	~ ArraySetAt(local, 0, "Hello!!")

	Test set: {ArrayGet(local, 0)}.

	// add some animals
	~ ArrayAdd(local, "Cat")
	~ ArrayAdd(local, "Dog")
	~ ArrayAdd(local, "Bird")
	~ ArrayAdd(local, "Elephant")
	~ ArrayAdd(local, "Wolf")

	There should be 6 items: {ArrayCount(local)}
	Item 5 should be wolf: {ArrayGet(local, 5)}
	Bird should be item 3: Bird is item... {ArrayIndexOf(local, "Bird")}

	// delete elephant without knowing index
	~ ArrayRemove(local, ArrayIndexOf(local, "Elephant"))
	Elephant should be gone: {ArrayIndexOf(local, "Elephant")}

	// clear and fail test
	~ ArrayClear(local)
	Bird should not be anywhere (-1): Index position: {ArrayIndexOf(local, "Bird")}
	This array does not exist so should be -1: {ArrayIndexOf("FakeArray", "Bird")}

	// free array, index should be -1 
	~ ArrayFree(local)
	Array deleted: {ArrayIndexOf(local, "Cat")}

	// add to persist
	~ ArrayAdd("persist", "This is persistent")
	~ ArrayAdd("persist", "Persistent number 2")
	~ ArrayAdd("persist", "HEY!!! 😀😆🥲🙂")
	Count in persist: {ArrayCount("persist")}

	//!SAVEGAME debug.save.gz

	-> END