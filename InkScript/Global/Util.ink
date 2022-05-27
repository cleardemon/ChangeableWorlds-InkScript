// Utility

=== function _UtilRandomBool()
	{ RANDOM(0,1):
		- 1: ~ return true
		- 0: ~ return false
	}

=== function _UtilGetCharacterName()
	{ PlayerCurrentCharacter:
		- CCharacterNone: ~ return "None"
		- CCharacterKaidan: ~ return "Kaidan"
		- CCharacterSolus: ~ return "Solus"
		- CCharacterRosan: ~ return "Rosan"
		- CCharacterVolar: ~ return "Volar"
	}

=== function _UtilGetCharacterPronoun(objective)
	{ PlayerCurrentCharacter:
		- CCharacterKaidan || CCharacterVolar: ~ return "{objective == true:him|he}"
		- CCharacterSolus || CCharacterRosan: ~ return "{objective == true:her|she}"
		- else: ~ return "{objective == true:them|they}"
	}
