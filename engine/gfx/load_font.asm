INCLUDE "gfx/font.asm"

EnableHDMAForGraphics:
	db FALSE

Get1bppOptionalHDMA: ; unreferenced
	ld a, [EnableHDMAForGraphics]
	and a
	jp nz, Get1bppViaHDMA
	jp Get1bpp

Get2bppOptionalHDMA: ; unreferenced
	ld a, [EnableHDMAForGraphics]
	and a
	jp nz, Get2bppViaHDMA
	jp Get2bpp

_LoadStandardFont::
	ld de, Font
	ld hl, vTiles1
	lb bc, BANK(Font), 32 ; "A" to "]"
	call Get1bppViaHDMA
	ld de, Font + 32 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $20
	lb bc, BANK(Font), 26 ; "a" to "z" (skip "┌" to "┘")
	call Get1bppViaHDMA
	ld de, Font + 64 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $40
	lb bc, BANK(Font), 32 ; $c0 to "←"
	call Get1bppViaHDMA
	ld de, Font + 96 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $60
	lb bc, BANK(Font), 32 ; "'" to "9"
	call Get1bppViaHDMA
	ret

_LoadFontsExtra1::
	jr LoadFrame

_LoadFontsExtra2::
	ret

_LoadFontsBattleExtra::
	ld de, FontBattleExtra
	ld hl, vTiles2 tile $6d
	lb bc, BANK(FontBattleExtra), 1
	call Get1bppViaHDMA
	ld de, HPBarGFX
	ld hl, vTiles2 tile $61
	lb bc, BANK(HPBarGFX), 12
	call Get2bppViaHDMA

LoadFrame:
	ld a, [wTextboxFrame]
	maskbits NUM_FRAMES
	ld bc, TEXTBOX_FRAME_TILES * LEN_1BPP_TILE
	ld hl, Frames
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles0 tile "┌" ; $ba
	lb bc, BANK(Frames), TEXTBOX_FRAME_TILES ; "┌" to "┘"
	call Get1bppViaHDMA
	ld hl, vTiles2 tile " " ; $7f
	ld de, TextboxSpaceGFX
	lb bc, BANK(TextboxSpaceGFX), 1
	call Get1bppViaHDMA
	ret

LoadBattleFontsHPBar:
	ld de, FontBattleExtra
	ld hl, vTiles2 tile $6d
	lb bc, BANK(FontBattleExtra), 2
	call Get1bppViaHDMA
	ld de, HPBarGFX
	ld hl, vTiles2 tile $61
	lb bc, BANK(HPBarGFX), 12
	call Get2bppViaHDMA
	call LoadFrame

LoadExpBar:
	ld de, ExpBarGFX
	ld hl, vTiles2 tile $55
	lb bc, BANK(ExpBarGFX), 12
	call Get2bppViaHDMA
	ret

StatsScreen_LoadFont:
	call _LoadFontsBattleExtra
	ld de, FontBattleExtra
	ld hl, vTiles2 tile $6d
	lb bc, BANK(FontBattleExtra), 2
	call Get1bppViaHDMA
	ld de, ExpBarGFX
	ld hl, vTiles2 tile $55
	lb bc, BANK(ExpBarGFX), 12
	call Get2bppViaHDMA
LoadStatsScreenPageTilesGFX:
	ld de, StatsScreenPageTilesGFX
	ld hl, vTiles2 tile $31
	lb bc, BANK(StatsScreenPageTilesGFX), 17
	call Get2bppViaHDMA
	ret
