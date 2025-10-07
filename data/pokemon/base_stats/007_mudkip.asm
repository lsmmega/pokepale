	db MUDKIP ; 007

	db  50,  70,  50,  40,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	dw 62 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/007_mudkip/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm learnset
	tm
	; end
