	db INCINEROAR ; 006

	db  95, 115,  90,  60,  80,  90
	;   hp  atk  def  spd  sat  sdf

	db FIRE, DARK ; type
	db 45 ; catch rate
	dw 239 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/006_incineroar/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm learnset
	tm
	; end
