	db DECIDUEYE ; 003

	db  78, 107,  75,  70, 100, 100
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GHOST ; type
	db 45 ; catch rate
	dw 239 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/003_decidueye/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm learnset
	tm
	; end
