; Pokémon traded from RBY do not have held items, so GSC usually interprets the
; catch rate as an item. However, if the catch rate appears in this table, the
; item associated with the table entry is used instead.

TimeCapsule_CatchRateItems:
	db ITEM_19, LEFTOVERS
	db ITEM_2D, BITTER_BERRY
	db ITEM_32, GOLD_BERRY
	db ITEM_59, BERRY
	db ITEM_63, BERRY
	db ITEM_77, BERRY
	db ITEM_86, BERRY
	db ITEM_BD, BERRY
	db ITEM_C3, BERRY
	db ITEM_DC, BERRY
	db ITEM_FA, BERRY
	db TM_PSYCH_UP, BERRY
	db TM_ICE_PUNCH, BERRY
	db TM_DETECT, BERRY
	db -1,      BERRY
	db 0 ; end
