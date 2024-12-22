CrystalIntro:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wGBCPalettes)
	ldh [rSVBK], a
	ldh a, [hInMenu]
	push af
	ldh a, [hVBlank]
	push af
	call .InitRAMAddrs
.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	and BUTTONS
	jr nz, .ShutOffMusic
	ld a, [wJumptableIndex]
	bit JUMPTABLE_EXIT_F, a
	jr nz, .done
	call IntroToTitleScreen
	farcall PlaySpriteAnimations
	call DelayFrame
	jp .loop

.ShutOffMusic
	ld de, MUSIC_NONE
	call PlayMusic

.done
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, 7
	ldh [hWX], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	pop af
	ldh [hVBlank], a
	pop af
	ldh [hInMenu], a
	pop af
	ldh [rSVBK], a
	ret

.InitRAMAddrs:
	assert VBLANK_NORMAL == 0
	xor a
	ldh [hVBlank], a
	ld a, TRUE
	ldh [hInMenu], a
	xor a
	ldh [hMapAnims], a
	ld [wJumptableIndex], a
	ret

IntroToTitleScreen:
; Cut out when the music ends, and lead into the title screen.
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	cp $18
	jr z, .clear
	cp $8
	ret nz

	ld de, SFX_INTRO_WHOOSH
	call PlaySFX
	ret

.clear
	call ClearBGPalettes
	ret

.done
	ld hl, wJumptableIndex
	set JUMPTABLE_EXIT_F, [hl]
	ret
