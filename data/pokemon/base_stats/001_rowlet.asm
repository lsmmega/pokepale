	db ROWLET ; 001

	db  68,  55,  55,  42,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FLYING ; type
	db 45 ; catch rate
	dw 64 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/001_rowlet/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm learnset
	tm
	; end
