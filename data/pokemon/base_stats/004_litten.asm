	db LITTEN ; 004

	db  45,  65,  40,  70,  60,  40
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	dw 64 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/004_litten/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm learnset
	tm
	; end
