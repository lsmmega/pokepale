	db VENUSAUR ; 003

	db  80,  82,  83,  80, 100, 100
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON ; type
	db 45 ; catch rate
	dw 236 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/003_venusaur/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_PLANT ; egg groups

	; tm learnset
	tm
	; end
