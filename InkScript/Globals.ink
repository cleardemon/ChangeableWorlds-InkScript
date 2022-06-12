/*
Global variables and constants

All variables that are used by different sections must be present here.
These are included in every section, so the game engine can load different sections and restore variables in each.

Do not add global variables that are temporary. They should be defined at knot or stitch level.

All CONST and VAR declarations must use PascalCase.

All global variables will be synced with the game engine when they change.
*/

/*
** THIS FILE IS AUTOMATICALLY INCLUDED AS PART OF THE BUILD PROCESS!
** YOU DO NOT NEED TO INCLUDE IT IN ANY INK FILE DIRECTLY!
*/

INCLUDE Global/Util.ink
INCLUDE Global/Externals.ink
INCLUDE Global/Landmarks.ink
INCLUDE Global/Knowledge.ink
INCLUDE Global/Time.ink
INCLUDE Global/Player.ink
INCLUDE Global/Weather.ink
INCLUDE Global/World.ink

// this function is executed whenever Ink is loaded in the game engine. this includes !LOAD commands.
=== function _GlobalInit()
	// call initialisers
	~ LandmarkInit()
	