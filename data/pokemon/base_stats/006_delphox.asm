	db DELPHOX ; 006

	db  75,  69,  72, 104, 114, 100
	;   hp  atk  def  spd  sat  sdf

	db FIRE, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 0 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/006_delphox/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm learnset
	tm
	; end
