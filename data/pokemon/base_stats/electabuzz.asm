	db ELECTABUZZ ; 125

	db  65,  83,  57, 105,  95,  85
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	dw 172 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/electabuzz/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm learnset
	tm DYNAMICPUNCH, HEADBUTT, CURSE, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, IRON_TAIL, THUNDER, RETURN, PSYCHIC_M, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, SWIFT, THUNDERPUNCH, DETECT, REST, ATTRACT, THIEF, FIRE_PUNCH, STRENGTH, FLASH, THUNDERBOLT
	; end
