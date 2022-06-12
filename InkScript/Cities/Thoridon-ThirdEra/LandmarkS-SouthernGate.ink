= gatehouse_south // S
	~ LocationVisited(Location_ThoridonGatesSouth)

	{ 
		- gatehouse_south < 2:
	{_UtilGetCharacterName()} arrives in an open area that has many paths, disappearing down streets from west to east. But most obvious is the large, heavily-enforced steel gate that arches overhead. The gate provides ingress through the city's wall.

	Several small shacks line the gate itself and a few burly individuals stand around on the edges of the open gate, that appear to be guarding it.
		- else:
	{_UtilGetCharacterName()} stands at an intersection of many paths, with the gate to the south.
	}

	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonGomard, MapDirectionWest)}]
		-> residential_gomard
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonMarketplace, MapDirectionNorthWest)}]
		-> union_market_new
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonGuardhouse, MapDirectionNorth)}]
		-> guardhouse
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonBlueCask, MapDirectionNorthEast)}]
		-> blue_cask_pub
	+ [{ThoridonThirdEraGoToLandmark(Location_ThoridonKasard, MapDirectionEast)}]
		-> residential_kasard
	+ {not guards_south_denied} [Approach the guards]
		-> guards_south(false)
	+ {not guards_south_denied} [Go through the gate]
		-> guards_south(true)

= guards_south_denied
		{_UtilGetCharacterName()} approaches the guards again. One of them nods, causing another to turn around, and then they shake their head.

		Guard: You're not getting going into the Flatlands, just be on your way.

		+ [Leave the gate]
			-> gatehouse_south

= guards_south(walk_gate)
	{ guards_south > 1: -> guards_south_denied	}

	{walk_gate :
	{_UtilGetCharacterName()} walks towards the open gate, but on approach, one of the guards holds out an arm and moves directly towards {_UtilGetCharacterPronoun(true)}.

	Guard: Hold there, please.
	}
	{not walk_gate:
	{_UtilGetCharacterName()} walks up to one of the guards who stand near one of the small shacks. One of them turns to face {_UtilGetCharacterName()}.

	Guard: Is something the matter?
	}
	
	* {walk_gate} [Ask what the problem is]
		{_UtilGetCharacterName()}: What appears to be the problem?
		Guard: Not a problem, you see. But, you can't go out there wearing that.
	
	* {not walk_gate} [Ask to go through the gate]
		{_UtilGetCharacterName()}: Can I go out there?
		The guard looks {_UtilGetCharacterName()} up and down and sniggers.
		Guard: Not dressed like that.

	{_UtilGetCharacterName()}: I see.
	Guard: If you want to proceed, you need to either have some sort of proof that you can handle yourself in the Flatlands, or you have someone to accompany you.
	Guard: Neither you seem to have.
	
	{PlayerCurrentCharacter == CCharacterKaidan:
		The guard points at Kaidan's robes.
		Guard: Shouldn't you be in lectures, anyway?
	}

	- (loop)
		** [Ask about the Flatlands]
			{_UtilGetCharacterName()} looks past the guard and out through the gate, trying to see what is beyond.

			{_UtilGetCharacterName()}: What is special about the Flatlands?
			Guard: You mean you haven't been out there?

			*** [Say you have not]
				{_UtilGetCharacterName()}: I have not.
				The guard laughs.
				Guard: Well, city boy, nothing out there for you.
				-> loop
			*** [Say you have]
				{_UtilGetCharacterName()}: Of course I have.
				Guard: Then you will know about the bogland. But what's special about it? Nothing.
				-> loop
			*** [Say you are just curious]
				{_UtilGetCharacterName()}: I was just wondering.
				Guard: Maybe you'll see one day. You probably don't want to get your feet stuck in the mud, though.
				The guard laughs, turns around to the other guards, who also laugh back, despite them not hearing the quip at {_UtilGetCharacterName()}'s expense.
				-> loop
		** [Ask about being a guard]
			{_UtilGetCharacterName()}: How is guard work lately?
			Guard: That's for me to know.
			-> loop
		** [Ask about the gate]
			{_UtilGetCharacterName()}: What do you know about the gate?
			Guard: It's heavy.
			The guard has nothing else to say, causing {_UtilGetCharacterName()} to feel a bit uncomfortable.
			-> loop
		** [Ask about the wall]
			{_UtilGetCharacterName()}: What is the purpose of the wall?
			The guard laughs.
			Guard: You ask some funny questions. Keeps people like you and me safe.

			*** [Safe from what?]
				{_UtilGetCharacterName()}: Safe from what?
				Guard: Who knows? The wild life? The weirdos that come from overseas? The weirdos inside the walls? 
				The guard chortles.
				-> loop
			*** [Nod without questioning]
				{_UtilGetCharacterName()} nods and the guard just looks on. It seems like this questioning is wasting the guard's time.
				-> loop

		** [Ask what the protection is for]
			{_UtilGetCharacterName()}: Why do I need someone to accompany me?
			The guard laughs.
			Guard: Being honest, I don't think you would last a day out there.
			-> loop
		++ [Leave the gate]
			-> gatehouse_south

	-> gatehouse_south

