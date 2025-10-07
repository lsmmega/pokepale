	db BULBASAUR ; 001

	db  45,  49,  49,  45,  65,  65
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON ; type
	db 45 ; catch rate
	dw 64 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/001_bulbasaur/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_PLANT ; egg groups

	; tm learnset
	tm
	; end
