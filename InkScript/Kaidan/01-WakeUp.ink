/*
Scene

Godal assigns the player to Kaidan who studies at the Synth Institute with a promising future. 
Kaidan is awoken by his father, who storms in as he is not the best at timekeeping. 
President Ikis reminds him that he is going to be late for lectures. But Kaidan has many questions about 
what is going on (the player has these questions), but Ikis is adamant that he hurries. Ikis is also curious 
about the sudden line of questioning, but has his own matters to attend to.
*/

=== kaidan_chapter_01
    ~ PlayerCurrentCharacter = CCharacterKaidan
    ~ PlayerCurrentWorld = CWorldTypePri
    // TODO: Set weather and time

    What feels like years turns into seconds, and the harshness of reality suddenly becomes immediate for {PlayerName}. Gone are the pleasant and soothing images of light, replaced with confusing arrays of colour, depth, physical feelings and strange nasal stimuli, all of which becomes entirely overwhelming for the newborn Yolen.

    Solid knocking on wood makes itself dutifully noticeable. {PlayerName} finds themselves in control of their first host, in what seems like being worlds away from the calm of the Synthetic Domain. Lying on a bed inside a bedroom, the Yolen's host is rudely awoken from a deep slumber by the noise emanating from the only door.

    Voice: Kaidan? Kaidan!

    The knocking repeats itself before the room falls silent once again. The Yolen quickly discovers some of the abilities of this host - sight, sound, touch, smell. It seems like a lot to process, but the host, known as Kaidan, seems quite content on not actually moving.

    Quiet breathing, closed eyes, it is not immediately clear that the process of Ethereal Transference was a success.

    Voice: Son? I don't hear you getting ready!

    The deep booming voice of a father makes the brown eyes of Kaidan open, and causes him to yawn. He stretches in bed, forcing himself to sit up, his bare chest exposed. In this position, he pauses, and takes a moment to survey the surroundings.

    -> bedroom_pre_ikis

// Kaidan has just woken up from bed, his father has not entered
= bedroom_pre_ikis
    // bed states: 0 = out of bed, 1 = sitting in bed, 2 = lying in bed
    ~ temp bed_state = 1
    // determines if Kaidan has been passive-aggressive to his father
    ~ temp passive = false

    Kaidan's bedroom is narrow, with a few tables along the walls, shelving featuring an array of books, a small wardrobe in the corner, and an open window allowing warm sunlight inside. On the tables are various plants dotted around, some with flowers, others bearing fruit. Some glass apparatus stand in-between different flora. 

    - (get_up_loop)

        {
            - bed_state > 0 && get_up_loop > 2:
                // still not out of bed after 3 loops
                -> ikis_enters 
        }

        + { bed_state > 0 } [Get out of bed]
            ~ bed_state = 0

            Kaidan shuffles to the edge of the bed and stands at its side. The sunlight from the window brightens his bare skin, aside from the long, black hair that cascades down his back. While the sunlight it warm, a cold wind blows in the window making him shiver.

            ** [Open wardrobe] -> wear_clothes

            ** [Return to bed] 
                // lazy
                ~ bed_state = 1
                It seems that the prospect of what is to come is too much for Kaidan, and he returns to the bed. At least the warm bedclothes prevent the cold wind making it worse.
                -> get_up_loop

        + { bed_state == 1 } [Sit still]
            Kaidan {|still} does not move and {looks|instead continues to gaze} around the room.
            {Various books, plants and diagrams adorn the walls and tables, with hand-written notes all over the place.|Perhaps the Yolen is still getting used to being in control of a physical body?}
            -> get_up_loop

        + { bed_state == 1 } [Lie down]
            ~ bed_state = 2
            It appears to become too much for Kaidan as he returns to lying down in the bed, pulling the bedclothes up once again. He lies there with eyes open.
            -> get_up_loop

        + { bed_state == 2 } [Snooze]
            Kaidan closes his eyes and begins to drift off into another slumber. It really does not seem like there is anything pressing that deserves his attention.
            -> get_up_loop

    - (wear_clothes)
        Opening the wardrobe, inside are a collection of similar robes and jackets, among a collection of undergarments and sundries. Realising that these might offer protection from the cool breeze, he quickly dons a red-coloured robe, shirt and underwear.

        As the door on the wardrobe closes, the knocking on the door returns and becomes increasingly frantic.

        Voice: Hurry up, Kaidan! You're going to be late... and so am I!

        * [Shout an apology]
            Kaidan attempts to yell back an apologetic response, but it seems speaking is a new concept to the Yolen. Not able to accurately articulate, instead of a pleasant apology becomes a guttural sound that quickly transforms into coughing. It is an experience for the Yolen, and learning how to use a host for the first time is bound to have teething difficulties.

            -> inspect_items

        * [Sigh loudly]
            Kaidan lets out a sharp breath, with the intention of the heavy-handed sigh being heard from the other side of the door. The sudden expelling of air is an experience for the Yolen, but it certainly makes them more confident about how breathing works in this host.

            Voice: We don't have time to argue!

            // passive-aggressiveness against father
            ~ FactionAddScorePlayer("KaidanIkis", -10, false)
            ~ passive = true
            -> inspect_items

        * [Utter a grunt]
            Kaidan grunts with a neutral sounding tone, conferring whether or not he wants to agree with his father's wishes.

            -> inspect_items

        * [Stay silent]
            Without moving or making a sound, Kaidan does not react to his father's statement. It is an awkward pause.

            Voice: Kaidan! I don't have time for these games. And nor do you.

            // passive-aggressiveness against father
            ~ FactionAddScorePlayer("KaidanIkis", -10, false)
            ~ passive = true
            -> inspect_items

    - (inspect_items)

        {{passive:Despite the protests|Nonetheless}, the father retreats from the door.|}

        // show only when not looping - this provides the beginnings to allowing the player understand language
        {Around the small bedroom, there are several tightly-packed points of interest. Kaidan looks up at rows of shelving that contain several books. With words written on the side, it is something that the Yolen becomes curious with: written language. Kaidan gazes at the spines on the books, and they eventually become clearer and he is surprised to understand what it reads.|}

        // force Ikis inside if player takes too long looking at things
        { inspect_items > 3 : -> ikis_enters }

        * [Inspect shelves]
            Various lengths of shelving along the walls hold up a sizeable collection of books. Some are much older than others, and some look like they have not moved from their position for some time. They are all hard-bound, with little to distinguish between most of them.

            Kaidan reaches for one on the end of the nearest shelf. It is well used, and much larger than other books. He stares at the front cover for a moment as the written language makes sense.

            // TODO: show player the book
            // it is an encyclopedia of flora, and it should match some of the plants in the room

            Inside, among what looks like complicated writings, several diagrams stand out. They demonstrate dissections of plants, showing in detail how the plants grow, what fruit they bear, and the colour of flowers.
            
            Based on the titles shown on each book's spine, Kaidan sees that the other books on the shelf also discuss plant life, some more specific than others. 

            It would seem Kaidan is very interested in how plants work.

            -> inspect_items
        * [Inspect table in corner]
            Across the opposite wall to the bed is a long table that is well used and a little uneven. Stacked upon it are various glass containers in all shapes and sizes, a collection of magnifying glasses, a dirty glass sheet and several small knives.

            Towards the window-end of the table, plants grow inside different pots, all with different heights, shades of green and the occasional flower. Some of these plants bear quantities of small, hanging fruit in different colours.

            -- (corner_table)

            ** [Inspect glass sheet]
                Kaidan looks at the glass sheet on the corner table. It is in need of a clean with pieces of plant matter dried on its surface. There are also small dents and scratches on the glass, possibly caused by one of the small blades resting next to the sheet.

                -> corner_table

            ** [Inspect plants]
                As Kaidan moves to look at the various plants on the end of the corner table, he is taken aback slightly, unprepared for smells emitted by the plants.

                It is not immediately clear to the purpose of why there are so many different types of plant, but most of them bear some kind of fruit.

                *** [Pick a random seed]
                    Using both hands, Kaidan removes a {~bulbous|round|small|coloured} seed from one of the plants. It is {~soft|tough|brittle|shell-like} to the touch and feels {~wet|dry|sticky}.

                    Holding the seed, Kaidan looks at it intently but is unsure what to do with it afterwards, placing it down onto the glass sheet. {not KnowledgePlayerIsKnown(KnowledgeKaidanFoundResearchPaper):There must be a reason for collecting all of these seeds.}

                    -> corner_table

                *** (coughed) [Sniff the smells]
                    Despite being repelled before, Kaidan moves his head into the heads of the plants and inhales. The combined smells of the different flora seems to be overwhelming as he jolts back and starts coughing.

                    As he regains his composure, the coughing is loud enough to attract the attention of his father.

                    // jump straight to making Ikis burst in
                    -> ikis_enters

                +++ [Something else]
                    -> corner_table

            ++ [Inspect something else]
                -> inspect_items

        * [Inspect table near window]
            // learn of Kaidan's research
            Moving over towards the table near the window, aside from a few more plants, a collection of papers and writing pens are the centre of attention. There is a well-worn small seat in front of the table.

            ** (sit_table) [Sit at the table]
                {Kaidan carefully sits on what seems to be quite a rickety, wooden chair. In front of him, there are piles of papers alongside pens, and he takes a moment to look at the pages.|}

                *** [Look at small pile]
                    As Kaidan scans down the small pile of papers, the handwriting looks to be written in some haste, making the words difficult to read. There are no diagrams, just short phrases, as if they were notes.

                    TODO what, if any, details are in these notes?
                    -> sit_table
                
                *** [Look at large pile]
                    The handwriting in the large pile of papers is more neat, looking more like a serious piece of work. Reading down the pages, Kaidan can see it is not finished. Words talk about squashing plant seeds and mixing the resulting liquid with differing powered crystals.

                    There are hundreds of pages and it would take most of the day to read what is present, let alone, trying to understand its purpose. It is clear that it is work Kaidan has been producing for some time.

                    ~ KnowledgePlayerPossessedAdd(KnowledgeKaidanFoundResearchPaper)
                    -> sit_table

                +++ [Stand up]
                    Kaidan carefully stands up from the table.
                    -> inspect_items

            ++ [Inspect something else]
                -> inspect_items

        + [Open door]
            Move into hallway, where is father awaits and opens the front door.
            -> ikis_exterior
        
    - (ikis_enters)

    // took too long to go outside

    The door to the bedroom opens, without a knock, causing Kaidan to focus attention immediately on who enters. Kaidan's father forces his way inside, taller than his son, and more bulky. 

    Ikis: That's enough! We have to leave now!
    
    He wears meticulously cleaned white robes, with a red flourish on the shoulders and a white, corner hat. A few chains drop down from his neck, a medallion quite prominent. He does not look happy.

    Ikis: I am going to be late for an extremely important meeting at the Senate, and you are going to be late for your lectures!

    { 
        - coughed : -> ikis_coughed
        - bed_state > 0 : -> ikis_in_bed 
    }

    // if here, Kaidan is out of bed, clothed, still looking around the bedroom

    Kaidan nods, and they both leave the bedroom, heading outside.

    -> ikis_exterior

    - (ikis_in_bed)
    // still in bed, super lazy

    Kaidan's father stops dead in his tracks, and see that his son is still in bed. There is a pause, as he seems to be dumbfounded.

    * [Yawn carelessly]
        Still in what seems like a dream-like state, Kaidan yawns and stretches his arms. As he sees his father standing at the end of his bed, it has a sobering effect and he freezes.

        Ikis: Get up. Now. I'm tired of your insubordination, Kaidan. You should really start caring about your future.

        He turns around.

        Ikis: I will wait outside. Come quickly.

        // does not reflect well on his father
            ~ FactionAddScorePlayer("KaidanIkis", -10, false)

        -> ikis_clothes_before_leaving

    * [Feign ignorance]
        Kaidan looks up at his waiting father with a surprised look.

        Kaidan: Oh, I'm sorry. I didn't realise it was so important.

        He speaks genuinely, but there is a pause as his father contemplates a response. His thoughts accumulate to a sigh.

        // ikis interprets this as a genuine mistake, no penalty
        Ikis: Never mind. Just get up. I will wait for you outside. Come quickly.

        A sense of urgency hits Kaidan as he gets up, and opens the wardrobe. <> -> ikis_clothes_before_leaving

    * [Panic, rush to wardrobe]
        Quickly realising he's made a mistake, Kaidan flies out of the bed and opens the wardrobe before his father can say anything. 

        Ikis: Hmm. I will wait for you outside.

        As his father leaves, <> -> ikis_clothes_before_leaving

    * [Scream]
        It would seem Kaidan is taken completely by surprise, as he just screams at his father.

        Ikis: [shouting] Don't be ridiculous!

        // disapproving
        ~ FactionAddScorePlayer("KaidanIkis", -10, false)

        Kaidan calms down.

        Ikis: What are you screaming at me for? I've been trying to wake you for what seems like an age!
        Ikis: Honestly, what has gotten in to you, lately?

        He turns around and walks out the door.

        Ikis: Just get up. I will wait for you outside. Hurry up!

        After that unfortunate experience, <> -> ikis_clothes_before_leaving

    - (ikis_coughed)
    // coughed trying to sample plants

    The bedroom door bursts open as Kaidan's father hurries inside to see his son recovering from inhaling spores.

    Ikis: What are you doing, son? Is everything all right?

    * (enjoyed_flowers) [Just enjoying the flowers]
        Kaidan: I was just looking at these flowers and I think I got a bit too close.
        
        His father narrows his brow.

        Ikis: I don't quite understand what you see in those things, but it seems the Institute is supportive of whatever it is you are trying to do. 

        He sighs.

        Ikis: But now is not the time. If you are ready, I'll just wait outside. Hurry up.
        -> ikis_exterior

    * [Not sure]
        Kaidan: I think so, I'm not sure what I did.

        His father gives him a perplexed look, and turns around.

        Ikis: I'll just wait for you outside. Hurry up.
        -> ikis_exterior

    * (questioned_plants) [Question the plants]
        Kaidan: Why are there so many plants in here?

        His father looks concerned.

        Ikis: Are you sure you are feeling all right, Kaidan?
        Ikis: I ask myself the same question, but the Institute is supportive of your work, whatever it is.
        Ikis: I don't like having all these smelly plants all in the same place, but you're the one that insists.

        His father turns around and walks out the door without saying anything.

        After a brief pause, Kaidan follows him outside.
        -> ikis_exterior

    - (ikis_clothes_before_leaving)

     Kaidan quickly puts on undergarments and a red-coloured robe that hangs up inside his wardrobe. Without looking around his bedroom, he heads straight outside to meet his waiting father.

    - (ikis_exterior)

    Kaidan's father waits outside in a small garden, located at the front of their modest house. It is well-kept, with a waving path that leads down to a gate, various bushes and flower beds punctuate the lush grasses. The house itself has a thatched roof, exposed wooden beams and an altogether fine piece of craftsmanship. Everything about the quality suggests that the person responsible for it, knows all there is about it.

    -- (loop)
        Ikis: {Now, Kaidan, I know we have our differences. But, I just want to make sure we are understanding about the one thing that is very important for me today.|Was there something else?|Come on, we have to leave.}
        {
            - loop == 3: -> separate_ways(true)
        }
        
        * [Ask what is important]
            Kaidan: Go on.
            Ikis: I have been working on my plans for years, and today, finally, I get to know if I can go ahead.
            Ikis: My meeting today at the Senate House is with excellent benefactors that will hopefully support my goal of changing life, here in Thoridon, forever.
            Ikis: It has not been without personal sacrifice, to you as my son, and to your mother, wherever she may be now.
            Ikis: I recognise that. I am sorry for everything, for all the failures to this day.
            Ikis: But, I am hopeful that, from today, all of this changes.
            Ikis: The People's Union will be stronger than ever. I will make the city of Thoridon a better place.

            He looks at Kaidan.

            Ikis: My son, no matter what happens, do I have your support?

            ** [Agree, half-heartedly]
                Kaidan: Yes...

                Kaidan's voice trails off and his father looks a little deflated.

                Ikis: I understand. We've been through a lot to get here. I can't just expect you to follow. Actions speak louder than words, I get it.

                He sighs.

                -> loop

            ** [Agree, strongly]
                Kaidan: Absolutely.

                His father smiles, but then his face falters.

                Ikis: You're just trying to hurry me up, which, is probably the right thing to do. But, I just wanted to let you know about what is happening.
                Ikis: Things will change, I can feel it.

                -> loop

            ** [Suggest the conversation is weird]
                Kaidan: Why are you talking to me like this?

                His father frowns, and rubs his forehead.

                Ikis: Fine. But you'll see, even if I don't have to prove myself to you.
                Ikis: Just remember, I'm doing this to make people stronger, not just you, but everyone in Thoridon.

                -> loop

        * {loop > 1} [Ask about the Senate House]
            Kaidan: What are you doing at the Senate?
            Ikis: I will be talking to some very enthusiastic sponsors for my ideas to make my dream about the People's Union, and how to make it work better for all. 
            Ikis: The Emperor won't be present. It is strictly business. 
            Ikis: Perhaps I will show you at our next meeting there.

            He nods.

            -> loop
        * {loop > 1} [Ask about lectures]
            Kaidan: What am I doing in my lectures?

            Kaidan's father narrows his brow.

            Ikis: Is this some sort of test? If you don't know what you're doing in your lectures... 

            He shakes his head.

            Ikis: No, I don't have time for this. You must go, as well.

            -> separate_ways(false)

        * {loop > 1 && (questioned_plants || enjoyed_flowers)} [Ask about the Institute]
            Kaidan: What do you know about the Institute?
            Ikis: You're asking me what I know about the Synth Institute? Is that a serious question? 

            ** [Ask about stance]
                Kaidan: Yes, you seem pretty hostile to it.
                Ikis: Kaidan, you know that I would much prefer if you worked with me at the Union, but, your mother led you down this ideal, and it is far too late for me to change it.
                Ikis: I may not agree with with the Institute does, nor its approach to anything, but it is your decision. 
                -> loop
            ** [Ask where it is]
                Kaidan: I just want to know where it is.
                Ikis looks shocked.
                Ikis: I'm sorry, son, I can't play these ridiculous games now. We don't have time for this.
                -> separate_ways(false)

        * {loop > 1} [Ask about Thoridon]
            Kaidan: What is wrong with Thoridon?
            Ikis: Come now, you know that the Emperor and I don't see eye-to-eye on a lot of issues. I hope to make the People's Union make it more amenable to the people of Thoridon, outside of what the Emperor would like to do.
            Ikis: If I fail, at least I tried.
            -> loop
        * {loop > 1} [Ask about the People's Union]
            Kaidan: Tell me about the People's Union.
            
            Kaidan's father looks surprised.
            
            Ikis: Are you suddenly interested in my affairs? We don't have time for this, right now. 
            Ikis: Perhaps tomorrow I can enlighten you in person, instead.

            He nods.

            -> loop
        * {loop > 1} [Ask about mother]
            Kaidan: Mother... have you spoken to her recently?

            At this question, Kaidan's father seems to take a moment.

            Ikis: No.

            Kaidan: Where is she, then?

            There is another pause.

            Ikis: I don't know. I'm not having this conversation now. 

            -> loop
        * [Suggest we are running late]
            Kaidan: Aren't we going to be late?
            Ikis: Yes! Come on, let's go.
            -> separate_ways(true)

// if good_terms is true, father and son parted ways favourably (otherwise not)
= separate_ways(good_terms)

    { 
        - good_terms == true:
            ~ FactionAddScorePlayer("KaidanIkis", 5, false)
        - else:
            ~ FactionAddScorePlayer("KaidanIkis", -10, false)
    }

    Kaidan's father opens the gate at the end of the garden, which leads onto wider pathway. He turns to look at Kaidan before hurrying away.

    Ikis: Hurry now! Make your way up to the Quadrangle.

    He then jogs off in a westerly direction.

    It seems the Yolen has a lot to take onboard. Not only has {PlayerName} discovered that they are playing the role of a student, there is a father who is pre-occupied with his work, and anything else comes second. 

    Kaidan also has a strange fascination with plants. To what end does this strong curiosity have? Perhaps those lectures will reveal more...

    + [Exit gate]
        Without hesitating any longer, Kaidan heads into the city to find his way towards his awaiting lectures.
        // set the gate to be locked
        ~ DoorLock("IkisFrontDoor")
        !LOAD Cities city_thoridon_third.home_ikis
        -> DONE

