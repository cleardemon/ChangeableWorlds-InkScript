// introduction

/*
Lightbearer Godal (tournament proposal)
Meet Lightbearer who provides an introduction to location and purpose of being a Lightbearer. Your goal is to prevail, by achieving what is desired. 
Introduce the player to which character to assume. 
Dialogue should change if player has already played as a character previously.   
*/ 

// !HINT:
// !SETTING:
// Dialog:
//   Player: (speaks the player)
//   <???>: (speaks any other character)

=== void_start
	~ PlayerCurrentWorld = CWorldTypeEthereum

	~ LocationVisited(Location_SyntheticVoid)

	It begins with a blinding flash of white light. But, there is nothing to see. No thought, no discussion, just feelings. There are no eyes to look through, there are no hands to touch with.

	This is the Synthetic Domain: a place where no mortal roams. It is home to the Yolen, intelligent - and sometimes gifted - ethereal beings composed of light and energy, all with their own personal ambitions and motivations.

	The white flash begins to fade. In the mind of a new arrival to this realm, different colours and gaseous apparitions start to become visible.

	* [Move forwards]
		-> Godal

= Godal
	~ temp mother_spoke = false

	A deep voice begins to speak directly to the most recent arrival, who refers to themselves as {PlayerName}. The voice has a tone to suggest that they have been waiting for some time.

	- Voice: Are you ready to join the Tournament?

		* [Who said that?]
			Player: Who is this voice?
			Voice: You do not recognise who I am? Intriguing. 
			-> new

		* [Tournament?]
			Player: What tournament?
			There is a long pause.
			Voice: You have not been instructed? Interesting. 
			-> new

	- (new) 
		Voice: This is a pleasant surprise. It has been a while since I have had the pleasure of speaking with a newborn Yolen. Mother Ramor must be planning something. I wish she would tell me her plans, but sadly, I do not have the ear of her as much as others might.
		The voice pauses.
		Voice: The fact that you are here now is not coincidental. Perhaps you might know what is she planning?
		
		* [Reveal what Mother said]
			Player: Mother Ramor decided that it was time to introduce a new challenge. But, I do not know what that challenge is.
			Voice: I see. Let me explain.
			~ mother_spoke = true
			-> explain
						
		* [Lie]
			Player: Mother Ramor plans for change. She wants to change the status quo.
			The voice pauses again.
			Voice: I see you have a sense of humour. A rare quality in this process for newborn Yolen.

			** [Insist]
				Player: I am not joking. She was extremely serious.
				The voice pauses yet again, starting to lose patience.
				Voice: No, you are not telling truths. You just appear inside the Domain, fresh from the birth of our Mother, and yet, you talk of a status quo. Affairs have not changed in as long as we have existed.
				Voice: But there is no sense for me to get angry. Ignorance is not an excuse.
				-> explain
								
			** [Confess]
				Player: I was just testing you. I have no idea what is going on, I am afraid.
				Voice: Ah, honesty. A rare quality around here...
				-> curious

			** [Feign ignorance]
				Player: Mother Ramor told me everything, but I did not understand what she was saying.
				Voice: That I find hard to believe. Mother Ramor always speaks with such incredible clarity. But, if you do not want to tell me, it is not my business to pry.
				~ mother_spoke = true
				-> explain

			** [No idea]
				Player: Does that mean you can tell me why Mother Ramor brought me here?
				-> curious
		
	// Godal is curious that the Lightbearer has not been told anything
	- (curious)
		Voice: Curious. Are you suggesting that Mother Ramor did not tell you anything? That has happened before, but leaving a Yolen to devise their own strategy tends to end in disappointment.
		The voice pauses, as if to consider the situation. 
		Voice: But how can you do that, if you do not know what you are doing, or even why you are here?
		-> explain

	// Godal predicts why a new Lightbearer has arrived
	- (explain)
		A blue swirl of energy that is responsible for the voice becomes visible in the mind of {PlayerName} and moves closer.
		Godal: I must apologise. I am Godal, one of the Tournament masters that monitors the Arenas. New Yolen, such as yourself, are a rarity to be directly entered into the Tournament. I am more used to instructing those that have already failed.
		Godal pauses.
		Godal: Being new, I assume this means that you have many questions. I will try to answer what you ask, but, the Tournament cannot wait for too long, and I do not know everything.
		-> explain_loop
		
	- (explain_loop)

		* [The Yolen]
			-- (questioned_yolen) 
				Player: I am a Yolen?
				By asking this question, a very long pause follows. 
				{not mother_spoke: Godal: It would seem that Mother Ramor did not explain.}
				{mother_spoke: Godal: Mother Ramor spoke to you directly, but she did not explain?}
				Godal: Yes, you are a Yolen, like myself, we are bearers of change. It would seem that you have a lot to learn!
				-> explain_loop

		* {questioned_yolen} [History of the Yolen]
			Player: What can you tell me about the Yolen?
			Godal: We Yolen are part of the reason why life exists. 
			TODO More detail about the Yolen
			-> explain_loop

		* (questioned_tournament) [The Tournament]
			Player: What Tournament?
			Godal: You are here to win, as are every Yolen. We will decide on what you are to win shortly, but how you do so is up to you.

			** [Explain]
				Player: I cannot possibly win something that I have no idea about.
				Godal: Mortal life is just an enormous game. Games need rules, and goals, in order to be successful. The Yolen Tournament is simply defining those rules and goals. You, as a Yolen, will do just that, forever changing the path of mortal life.

				--  (tournament_explain_loop)
					{|{PlayerName} has other questions.|{PlayerName} remains curious about the Tournament.|}

					*** [This seems strange]
						Player: Why would I want to do that?
						Godal grunts.
						Godal: You do not have a choice, Yolen. It is your purpose. You will see for yourself how diverse the mortals are. You will continue to change that diversity.
						-> tournament_explain_loop
					*** [Mortal life]
						Player: Does that mean I am not mortal?
						Godal: Every Yolen is unique, everything we decide changes life. Where life dies, we live on to continue our changes. I assure you, this will become clearer when we decide on your role in this Tournament.
						-> tournament_explain_loop
					*** [Defining rules]
						Player: How do I define the rules?
						Godal: I am sure you will figure that out. Mortal life has been in existence for a very long time. Continue the path before you, deviate when necessary.
						-> tournament_explain_loop
					*** [Purpose of the Tournament]
					    Player: What is the point of the Tournament?
					    Godal: Yolen are the custodians of change. It is our duty to ensure life changes. Mother would not have life be the same, for it is not Her will. Our task is to follow through on Her wishes.
					    Godal pauses. # wait2
					    Godal: But I do not think that answers your question. Yolen, for time immemorial, felt the need to make change more... interesting. Therefore, the Tournament provides the opportunity for Yolen to compete against each other.
					    Player: And Mother permits this?
					    Godal: Of course, she even actively promotes it. If you do well enough, perhaps, you might Ascend...
					    Godal trails off, and pauses again.
					    Godal: Time will tell.
					    -> tournament_explain_loop
					    
					*** -> explain_loop

		* [Arenas]
			Player: What is an Arena?
			Godal: A tournament demands an arena, somewhere to conduct one's will. They are part of the Creation process. Allow me to demonstrate.
			Godal begins to move back, with their presence feeling more distant. 
			The energies of {PlayerName} appear to intensify. Faint circles in the nebular of energies surrounding Godal become increasingly visible, one is more green and blue, the other more red and black. A white circle stands in the middle of them.
			Godal: We have two Arenas. This is where the Tournament plays out.

			--  (arena_explain_loop)

				** [Arenas]
					Player: Where are these Arenas?
					Godal: These coloured circles represent two Arenas, and we are in the centre. They are quite some distance from us at the moment. But that is not anything you need to concern yourself about. 
					The two coloured circles begin flashing alternately as Godal continues.
					Godal: This green one is known as Pri, the red one is known as Tagom. Living, breathing worlds. Our playgrounds.

					--- (arena_circles_loop)
					*** [Pri]
						Player: Tell me about the Arena of Pri.
						Godal: It is our first Arena. While I have do not have experience with the Arena itself, other Yolen tell me that it is a vibrant place, bursting with life, with wild floras, great bodies of water and creatures that form large societies. The challenges on this Arena are great, but the rewards are staggering.
						Godal: Not that I speak with Yolen that see those rewards, you understand.
						-> arena_circles_loop
					*** [Tagom]
						Player: Describe the Arena of Tagom.
						Godal: The second Arena to come out of Creation. I have had the opportunity to visit here. It features dark, volcanic lands. It is lacking development, but I am not in a position to criticise the process of Creation. Life here is very different compared to Arenas like Pri. The creatures that live there have adapted, I suppose.
						Godal: Perhaps you will see one day.
						-> arena_circles_loop
					*** (asked_white_circle) [White circle]
						Player: What is the white circle?
						Godal: This is Mother Ramor, where we are right now.
						The nebular energies all around shimmer in white, flickering infinitely into the far distance.
						Godal: The centre of all life as we know it.
						Godal: The _reason_ for all life.
						{PlayerName} hesitates.
						Player: Can I speak with Mother Ramor?
						Godal: We are all speaking with Mother, right now. You will know when you are spoken to.
						Godal: You just need to say something worth hearing. You also need to prove yourself first.
						-> arena_circles_loop
					*** [Other Arenas]
						Player: Are there other Arenas?
						Godal: Not that I am aware. Perhaps there are. It does not concern me, and it certainly should not concern you.
						-> arena_circles_loop
					*** [Playgrounds]
						Player: What do you mean by "playgrounds"?
						Godal: Is it not obvious by now? The Tournament is fought among Yolen upon these Arenas. You are free to use these worlds as your personal route to victory.
						Godal pauses.
						Godal: I am concerned that you have yet to understand your purpose.
						Godal: But no matter - you do not have a choice.
						-> arena_circles_loop
					*** [Done] -> arena_explain_loop

				** [Synthetic Domain]
					Player: Are we in an Arena now?
					Godal: That is a heavy question, newborn. While we are surrounded by conflict, that conflict is merely other Yolen in conflict with themselves. They would not be here if they had not failed.
					Godal: This is more of a refuge. A place where Yolen arrive after defeat. A chance to recuperate. 
					The deep voice pauses. 
					Godal: I am sure you will see for yourself.
					-> arena_explain_loop

				** [Creation]
					Player: You mentioned a Creation process?
					Godal: Yes, the formulation of Arenas, down to the smallest of details. 

					*** [How it works]
						Player: That might be helpful for me to understand.
						Godal pauses.
						Godal: I am not in a position to reveal how Mother Ramor works! Did you question your own reason for being?
						Godal: If you need to understand how Creation works, I cannot answer.
						-> explain_loop
					*** [Explain]
						Player: What do you mean?
						Godal: Creation is a process only known to Mother Ramor. Arenas are constructed by Mother Ramor, through immense abilities that I cannot comprehend.
						Godal: I cannot tell you more because I do not understand the process. Others may have more ideas, but I am here to guide losers of the Tournament, not define the parameters of it.
						-> explain_loop

				** [Done] -> explain_loop
						
		* {asked_white_circle} [Mother Ramor]
			Player: If that white circle is Mother Ramor, what does that mean?
			Godal: You do ask some strange questions, newborn. 
			Godal: Yes, everything around here is Mother Ramor. The very energy we are is part of Mother Ramor. 
			TODO
			-> explain_loop

		* [Godal]
			Player: Tell me about Godal.
			There is a pause.
			Godal: Why do you care about myself? My purpose is to educate Yolen like you to serve their purpose. 
			** [Just interested]
				Player: I am just interested, nothing more.
				Godal: Do you look to me to find more of your own purpose? Such weakness.
				Godal: Do not concern yourself with trivialities. That is the only advice I can give you.
				-> explain_loop
			** [Press for detail]
				Player: You tell me all this information, but how can I trust that if I cannot trust you?
				Godal: Trust, you say. I can see the newborn is growing up quickly.
				Godal: But, you have not conversed with another. What Mother Ramor may or may not have told you could also not be trustworthy.
				Godal: I appreciate the notion, you should question and challenge as much as possible, absolutely.
				Godal: The problem is that you are not in a position to do so. I only discuss matters with those that have not succeeded.
				Player: Perhaps you are right, I do not know any different at this moment.
				Godal: Exactly. I am sure we will speak of this again, when you see that I am right.
			-> explain_loop

		* [Failed Yolen] -> about_failed

	- (about_failed)
		Player: You keep mentioning failure, and how Yolen fail.
		Godal: I am glad you picked up on that. I am sure you have questions. I will answer one, before we must move on to your task.

		* [Ask about others]
			Player: If other Yolen fail, what happened to them?
			Godal: I do not care about what others do after I have spoken with them. 
			Godal: I assign them their next task, and they decide themselves what to do next.
			Godal: There are some I have not seen in a long time. Others, I see frequently.
			Godal: What does that mean for you, I wonder...
			-> end

		* [Ask about yourself]
			Player: Does this mean I have failed, before I have even started?
			Godal: With questions like that... quite possibly!
			Godal: I am just assisting you, before you make your first mistake, as a newborn.
			Godal: No-one gets it right the first time. That, I can guarantee.
			-> end

		* [Fascination of failure]
			Player: Why are you so fascinated with failure?
			Godal: It is my reason for being here, in this Domain. I am charged with guiding other Yolen onto a different path.
			Godal: Does that make me fascinated with it? No, not really. It is quite tiresome.
			Godal: Defeat is an opportunity. Try not to make a habit out of it.
			-> end

		* [Reasons for failure]
			Player: What are the most common reasons of Yolen failing?
			Godal: Bad decisions. Not listening. Poor judgement. 
			Godal: Mistakes are made, change is everything.
			Godal: There is always stupidity...
			-> end

		* [Avoiding failure]
			Player: Is there anything I can do to not fail?
			Godal: Why, of course! It is quite simple.
			Godal: Avoid making mistakes.
			Godal: I am sure you will, at least, try.
			-> end

		* [Chance of success]
			Player: There must be success, as well?
			Godal: Sure. Success is relative.
			Godal: But failure is an absolute.
			Godal: Even if you make it to what you consider success, I am sure we will meet again.
			-> end

	- (end)
		// player should understand, roughly, what they are up against now
		-> preview_kaidan

= preview_kaidan

    The area seems to shimmer in a red light. Godal seems to hurry.
    
	Godal: Now, it is time to assign you to your task.
	Godal: This means it is time to induce transference, where you will no doubt begin to understand your purpose, and, maybe have a good run at the Tournament.
	Godal: As a newborn, I can sense you still have many questions, but we can spend an eternity discussing, and I have other matters that need my attention.

	- (loop)

		* [Transference?]
			Player: What do you mean by inducing transference?
			Godal: Yes, Yolen take part in the Tournament by taking control of life inside an Arena.
			Godal: Transference is the process of enabling this. 
			Godal: You will become whoever (or whatever) you control. The past experiences and current expertise of your host all become available to you as the controller.

		-- (transference)

			** [That seems dangerous!]
				Player: This seems quite dangerous.
				Godal pauses for a moment.
				Godal: Why do you think that way? What a strange notion. Maybe it is dangerous for your host, perhaps. That is up to you.
				-> transference
				
			** [How to control]
				Player: How do I take control?
				Godal: You will find out. It comes quite naturally to you.
				Godal: After all, it is why you exist. 
				-> transference

			** [Losing control]
				Player: What happens if I lose control?
				Godal: Then you would have failed. Or succeeded. We shall find out.
				-> transference

			** [Other controllers]
				Player: Are there other controllers?
				Godal: You are fully in control of your transference. No other Yolen or otherwise can take that away from you.
				Godal: That is, unless you lose control of your host. Try not to let that happen.
				-> transference

			** -> loop

		* [Choice of tasks]
			Player: What tasks can I do?
			Godal pauses.
			Godal: You still need to learn. You need to experience how life works on an Arena.
			There is another pause.
			Godal: Of course! What a perfect way to learn. 
			Godal: I will transfer you to a young student of the Shaler, named Kaidan.
			Godal: Perhaps you can make Kaidan achieve their future.

		-- (Kaidan)

			** [Shaler]
				Player: What is the Shaler?
				Godal: The largest collection of creatures on the Arena of Pri. They are fascinated with their ways, have strong morals, and a thirst for knowledge.
				Godal: They are also, perhaps, a little misguided. Politics gets in the way. Whichever Yolen introduced that concept to them did a great job!
				-> Kaidan

			** [Kaidan]
				Player: Tell me about Kaidan.
				Godal: I have no information other than that Kaidan is a student. There is only limited detail available to me about individuals on Arenas.
				Godal: But, it is your opportunity to learn about them!
				-> Kaidan
			
			** -> loop

		* -> transfer_kaidan

= transfer_kaidan

	Then, there is a long pause. The images of flickering red from Mother shimmer, but there is nothing but silence.
	{PlayerName} begins to wonder what is going to happen.

	* [Say something]
		Player: Godal? Are you there?
		-> flash

	* [Stay silent]
		{PlayerName} continues to wait for something.
		-> flash

	- (flash) The blinding white flash returns. A faint utterance from Godal is barely recognisable among piercing white noise that abruptly makes itself known.

	* [Scream]
		{PlayerName} tries to communicate. Any attempt to speak with the voice of Godal is suppressed by some unknown force.
		-> complete

	* [Stay silent]
		{PlayerName} accepts what is going on. There is no fight, only submission.
		-> complete

	- (complete) Then, in an instant, the blinding light and piercing sounds disappear. {PlayerName} sees colours, shapes, and begins to feel embodied and positioned somewhere.

	// become Kaidan
	!LOAD Kaidan kaidan_chapter_01
	-> DONE


