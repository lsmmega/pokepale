; The add_tm, and add_mt macros in constants/item_constants.asm simultaneously
; define constants for the item IDs and for the corresponding move values.

TMMoves:
; entries correspond to *_TMNUM constants (see constants/item_constants.asm)
	table_width 1

; TMs
for n, 1, NUM_TMS + 1
	db TM{02d:n}_MOVE
endr
	assert_table_length NUM_TMS

; Move tutors
DEF n = 1
for n, 1, NUM_TUTORS + 1
	db MT{02d:n}_MOVE
endr
	assert_table_length NUM_TM_TUTOR

	db 0 ; end
