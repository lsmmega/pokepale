Font:
INCBIN "gfx/font/font.1bpp"

FontBattleExtra:
INCBIN "gfx/font/font_battle_extra.1bpp"

Frames:
	table_width TEXTBOX_FRAME_TILES * LEN_1BPP_TILE
INCBIN "gfx/frames/1.1bpp"
INCBIN "gfx/frames/2.1bpp"
INCBIN "gfx/frames/3.1bpp"
INCBIN "gfx/frames/4.1bpp"
INCBIN "gfx/frames/5.1bpp"
INCBIN "gfx/frames/6.1bpp"
INCBIN "gfx/frames/7.1bpp"
INCBIN "gfx/frames/8.1bpp"
	assert_table_length NUM_FRAMES
INCBIN "gfx/frames/9.1bpp" ; unused

StatsScreenPageTilesGFX:
INCBIN "gfx/stats/stats_tiles.2bpp"

HPBarGFX:
INCBIN "gfx/battle/hpbar.2bpp"

ExpBarGFX:
INCBIN "gfx/battle/expbar.2bpp"

TownMapGFX:
INCBIN "gfx/pokegear/town_map.2bpp.lz"

UnusedWeekdayKanjiGFX: ; unreferenced
INCBIN "gfx/font/unused_weekday_kanji.2bpp"

UnusedBoldFontGFX: ; unreferenced
INCBIN "gfx/font/unused_bold_font.1bpp"

TextboxSpaceGFX:
; StatsScreen_LoadTextboxSpaceGFX reads 2bpp; LoadFrame reads first half as 1bpp
INCBIN "gfx/font/space.2bpp"

UnusedUpArrowGFX: ; unreferenced
INCBIN "gfx/font/unused_up_arrow.1bpp"

MobilePhoneTilesGFX:
INCBIN "gfx/mobile/phone_tiles.2bpp"
