	db MARSHTOMP ; 008

	db  70,  85,  70,  50,  60,  70
	;   hp  atk  def  spd  sat  sdf

	db WATER, GROUND ; type
	db 45 ; catch rate
	dw 142 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/008_marshtomp/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm learnset
	tm
	; end
