/*
** KNOWLEDGE
**
** Pretty similar to an inventory, but these items cannot be lost, and persist until the end of the story.
*/

CONST _KnowledgeArrayId = "Knowledge"

=== function KnowledgeInit()
	// saved games would have this array already loaded.
	// note: there is no knowledge given at all at the start of the game!
	{ ArrayExists(_KnowledgeArrayId) == false:
		~ ArrayNewNamed(_KnowledgeArrayId, Knowledge_MAX)
	}

// sets a knowledge to be marked as known
=== function KnowledgeSet(knowledgeId)
	~ ArraySetAt(_KnowledgeArrayId, knowledgeId, 1)

// returns true if a knowledge is known
=== function KnowledgeIsKnown(knowledgeId)
	~ return ArrayGet(_KnowledgeArrayId, knowledgeId) == 1

//
// Knowledge IDs
//

// found the research paper in Kaidan's home
CONST KnowledgeKaidanFoundResearchPaper = 0
// discovered the blue cask?
CONST KnowledgeGlobalThoridonBlueCask = 1

// Update this value to the _highest_ KnowledgeId defined above!
CONST Knowledge_MAX = 2
