	db TORRACAT ; 005

	db  65,  85,  50,  90,  80,  50
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	dw 147 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/005_torracat/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm learnset
	tm
	; end
