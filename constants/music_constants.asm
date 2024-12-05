; song ids
; Music indexes (see audio/music_pointers.asm)
	const_def
	const MUSIC_NONE                         ; 00
DEF NUM_MUSIC_SONGS EQU const_value

; GetMapMusic picks music for this value (see home/map.asm)
DEF MUSIC_MAHOGANY_MART EQU $64

; ExitPokegearRadio_HandleMusic uses these values
DEF RESTART_MAP_MUSIC EQU $fe
DEF ENTER_MAP_MUSIC   EQU $ff

; GetMapMusic picks music for this bit flag
DEF RADIO_TOWER_MUSIC_F EQU 7
DEF RADIO_TOWER_MUSIC EQU 1 << RADIO_TOWER_MUSIC_F
