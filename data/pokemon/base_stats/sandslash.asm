	db SANDSLASH ; 028

	db  75, 100, 110,  65,  45,  55
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND ; type
	db 90 ; catch rate
	dw 158 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/sandslash/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm learnset
	tm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, ENDURE, FRUSTRATION, IRON_TAIL, EARTHQUAKE, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, SWIFT, DEFENSE_CURL, DETECT, REST, ATTRACT, THIEF, FURY_CUTTER, CUT, STRENGTH
	; end
