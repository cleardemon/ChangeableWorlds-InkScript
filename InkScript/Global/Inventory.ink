/*
Inventory
Everything that a player character has in their possession.
*/

=== function InventoryInit()
	// create if not present.
	// note that sizes of inventories _can_ grow dynamically
	{ ArrayExists(InventoryCharacterKaidan) == false:
		~ ArrayNewNamed(InventoryCharacterKaidan, 0)
	}
	{ ArrayExists(InventoryCharacterSolus) == false:
		~ ArrayNewNamed(InventoryCharacterSolus, 0)
	}
	{ ArrayExists(InventoryCharacterRosan) == false:
		~ ArrayNewNamed(InventoryCharacterRosan, 0)
	}
	{ ArrayExists(InventoryCharacterVolar) == false:
		~ ArrayNewNamed(InventoryCharacterVolar, 0)
	}

// sets an inventory to have an identifier
=== function InventorySet(inv, identifier)
	~ ArraySet(inv, identifier)

// removes an identifier from the specified inventory
=== function InventoryUnset(inv, identifier)
	~ ArrayRemove(inv, identifier)

// tests if an inventory does have an identifier
=== function InventoryIsSet(inv, identifier)
	~ return ArrayContains(inv, identifier)

// clears an inventory entirely
=== function InventoryClear(inv)
	~ ArrayClear(inv)

//
// Inventory keys (inv)
//

CONST InventoryCharacterKaidan = "InvKaidan"
CONST InventoryCharacterSolus = "InvSolus"
CONST InventoryCharacterRosan = "InvRosan"
CONST InventoryCharacterVolar = "InvVolar"

//
// Inventory items (identifier)
//

CONST ItemSomething = 0
