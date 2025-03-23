TMPocket:
	ld a, $1
	ldh [hInMenu], a
	call TM_PocketLoop
	ld a, $0
	ldh [hInMenu], a
	ret nc
	call PlaceHollowCursor
	call WaitBGMap
	ld a, [wCurItem]
	dec a
	ld [wCurItemQuantity], a
	ld hl, wTMs
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wItemQuantity], a
	call .ConvertItemToTMNumber
	scf
	ret

.ConvertItemToTMNumber:
	ld a, [wCurItem]
	ld c, a
	callfar GetNumberedTM
	ld a, c
	ld [wCurItem], a
	ret

ConvertCurItemIntoCurTM:
	ld a, [wCurItem]
	ld c, a
	callfar GetTMNumber
	ld a, c
	ld [wTempTM], a
	ret

GetTMItemMove:
	call ConvertCurItemIntoCurTM
	predef GetTMMove
	ret

AskTeachTM:
	ld hl, wOptions
	ld a, [hl]
	push af
	res NO_TEXT_SCROLL, [hl]
	ld a, [wCurItem]
	cp TM01
	jr c, .NotTM
	call GetTMItemMove
	ld a, [wTempTM]
	ld [wPutativeTMMove], a
	call GetMoveName
	call CopyName1
	ld hl, BootedTMText ; Booted up a TM
	ld a, [wCurItem]
	call PrintText
	ld hl, ContainedMoveText
	call PrintText
	call YesNoBox
.NotTM:
	pop bc
	ld a, b
	ld [wOptions], a
	ret

ChooseMonToLearnTM:
	ld hl, wStringBuffer2
	ld de, wTMMoveNameBackup
	ld bc, MOVE_NAME_LENGTH - 1
	call CopyBytes
	call ClearBGPalettes
ChooseMonToLearnTM_NoRefresh:
	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuGFX
	ld a, PARTYMENUACTION_TEACH_TM
	ld [wPartyMenuActionText], a
.loopback
	farcall WritePartyMenuTilemap
	farcall PlacePartyMenuText
	call WaitBGMap
	call SetDefaultBGPAndOBP
	call DelayFrame
	farcall PartyMenuSelect
	push af
	ld a, [wCurPartySpecies]
	cp EGG
	pop bc ; now contains the former contents of af
	jr z, .egg
	push bc
	ld hl, wTMMoveNameBackup
	ld de, wStringBuffer2
	ld bc, MOVE_NAME_LENGTH - 1
	call CopyBytes
	pop af ; now contains the original contents of af
	ret

.egg
	push hl
	push de
	push bc
	push af
	ld de, SFX_WRONG
	call PlaySFX
	call WaitSFX
	pop af
	pop bc
	pop de
	pop hl
	jr .loopback

TeachTM:
	predef CanLearnTMMove

	push bc
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNickname
	pop bc

	ld a, c
	and a
	jr nz, .compatible
	push de
	ld de, SFX_WRONG
	call PlaySFX
	pop de
	ld hl, TMNotCompatibleText
	call PrintText
	jr .nope

.compatible
	callfar KnowsMove
	jr c, .nope

	predef LearnMove
	ld a, b
	and a
	jr z, .nope

	farcall StubbedTrainerRankings_TMsTaught
	ld a, [wCurItem]

	ld c, HAPPINESS_LEARNMOVE
	callfar ChangeHappiness
	jr .learned_move

.nope
	and a
	ret

.didnt_use ; unreferenced
	ld a, 2
	ld [wItemEffectSucceeded], a
.learned_move
	scf
	ret

BootedTMText:
	text_far _BootedTMText
	text_end

ContainedMoveText:
	text_far _ContainedMoveText
	text_end

TMNotCompatibleText:
	text_far _TMNotCompatibleText
	text_end

TM_PocketLoop:
	xor a
	ldh [hBGMapMode], a
	call TM_DisplayPocketItems
	ld a, 2
	ld [w2DMenuCursorInitY], a
	ld a, 7
	ld [w2DMenuCursorInitX], a
	ld a, 1
	ld [w2DMenuNumCols], a
	ld a, 5
	sub d
	inc a
	cp 6
	jr nz, .okay
	dec a
.okay
	ld [w2DMenuNumRows], a
	ld a, $c
	ld [w2DMenuFlags1], a
	xor a
	ld [w2DMenuFlags2], a
	ld a, $20
	ld [w2DMenuCursorOffsets], a
	ld a, A_BUTTON | B_BUTTON | D_UP | D_DOWN | D_LEFT | D_RIGHT
	ld [wMenuJoypadFilter], a
	ld a, [wTMPocketCursor]
	inc a
	ld [wMenuCursorY], a
	ld a, $1
	ld [wMenuCursorX], a
	jr TM_ShowTMMoveDescription

TM_JoypadLoop:
	call TM_DisplayPocketItems
	call StaticMenuJoypad
	ld b, a
	ld a, [wMenuCursorY]
	dec a
	ld [wTMPocketCursor], a
	xor a
	ldh [hBGMapMode], a
	ld a, [w2DMenuFlags2]
	bit _2DMENU_EXITING_F, a
	jp nz, TM_ScrollPocket
	ld a, b
	ld [wMenuJoypad], a
	bit A_BUTTON_F, a
	jp nz, TM_ChooseTM
	bit B_BUTTON_F, a
	jp nz, TM_ExitPack
	bit D_RIGHT_F, a
	jp nz, TM_ExitPocket
	bit D_LEFT_F, a
	jp nz, TM_ExitPocket
TM_ShowTMMoveDescription:
	call TM_CheckHoveringOverCancel
	jp nc, TM_ExitPocket
	hlcoord 0, 12
	ld b, 4
	ld c, SCREEN_WIDTH - 2
	call Textbox
	ld a, [wCurItem]
	cp NUM_TMS + 1
	jr nc, TM_JoypadLoop
	ld [wTempTM], a
	predef GetTMMove
	ld a, [wTempTM]
	ld [wCurSpecies], a
	hlcoord 1, 14
	call PrintMoveDescription
	jp TM_JoypadLoop

TM_ChooseTM:
	call TM_PlaySFX_ReadText2
	call CountTMs ; This stores the count to wTempTM.
	ld a, [wMenuCursorY]
	dec a
	ld b, a
	ld a, [wTMPocketScrollPosition]
	add b
	ld b, a
	ld a, [wTempTM]
	cp b
	jr z, _TM_ExitPack ; our cursor was hovering over CANCEL
TM_CheckHoveringOverCancel:
	call TM_GetCurrentPocketPosition
	ld a, [wMenuCursorY]
	ld b, a
.loop
	inc c
	ld a, c
	cp NUM_TMS + 1
	jr nc, .okay
	ld a, [hli]
	and a
	jr z, .loop
	dec b
	jr nz, .loop
	ld a, c
.okay
	ld [wCurItem], a
	cp -1
	ret

TM_ExitPack:
	call TM_PlaySFX_ReadText2
_TM_ExitPack:
	ld a, B_BUTTON
	ld [wMenuJoypad], a
	and a
	ret

TM_ExitPocket:
	and a
	ret

TM_ScrollPocket:
	ld a, b
	bit D_DOWN_F, a
	jr nz, .down
	ld hl, wTMPocketScrollPosition
	ld a, [hl]
	and a
	jp z, TM_JoypadLoop
	dec [hl]
	call TM_DisplayPocketItems
	jp TM_ShowTMMoveDescription

.down
	call TM_GetCurrentPocketPosition
	ld b, 5
.loop
	inc c
	ld a, c
	cp NUM_TMS + 1
	jp nc, TM_JoypadLoop
	ld a, [hli]
	and a
	jr z, .loop
	dec b
	jr nz, .loop
	ld hl, wTMPocketScrollPosition
	inc [hl]
	call TM_DisplayPocketItems
	jp TM_ShowTMMoveDescription

TM_DisplayPocketItems:
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jp z, Tutorial_TMPocket

	hlcoord 5, 2
	lb bc, 10, 15
	ld a, " "
	call ClearBox
	call TM_GetCurrentPocketPosition
	ld d, $5
.loop2
	inc c
	ld a, c
	cp NUM_TMS + 1
	jr nc, .NotTM
	ld a, [hli]
	and a
	jr z, .loop2
	ld b, a
	ld a, c
	ld [wTempTM], a
	push hl
	push de
	push bc
	call TMPocket_GetCurrentLineCoord
	push hl
	ld a, [wTempTM]
	ld de, wTempTM
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	predef GetTMMove
	ld a, [wNamedObjectIndex]
	ld [wPutativeTMMove], a
	call GetMoveName
	pop hl
	ld bc, 3
	add hl, bc
	call PlaceString
	pop bc
	pop de
	pop hl
	dec d
	jr nz, .loop2
	jr .done

.NotTM:
	call TMPocket_GetCurrentLineCoord
	inc hl
	inc hl
	inc hl
	push de
	ld de, TM_CancelString
	call PlaceString
	pop de
.done
	ret

TMPocket_GetCurrentLineCoord:
	hlcoord 5, 0
	ld bc, 2 * SCREEN_WIDTH
	ld a, 6
	sub d
	ld e, a
	; AddNTimes
.loop
	add hl, bc
	dec e
	jr nz, .loop
	ret

PlaceMoveNameAfterTMName: ; unreferenced
; Similar to a part of TM_DisplayPocketItems.
	pop hl
	ld bc, 3
	add hl, bc
	predef GetTMMove
	ld a, [wTempTM]
	ld [wPutativeTMMove], a
	call GetMoveName
	push hl
	call PlaceString
	pop hl
	ret

TM_CancelString:
	db "CANCEL@"

TM_GetCurrentPocketPosition:
	ld hl, wTMs
	ld a, [wTMPocketScrollPosition]
	ld b, a
	inc b
	ld c, 0
.loop
	inc c
	ld a, [hli]
	and a
	jr z, .loop
	dec b
	jr nz, .loop
	dec hl
	dec c
	ret

Tutorial_TMPocket:
	hlcoord 9, 3
	push de
	ld de, TM_CancelString
	call PlaceString
	pop de
	ret

TM_PlaySFX_ReadText2:
	push de
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	pop de
	ret

VerboseReceiveTM: ; unreferenced
	call ConvertCurItemIntoCurTM
	call .CheckHaveRoomForTM
	ld hl, .NoRoomTMText
	jr nc, .print
	ld hl, .ReceivedTMText
.print
	jp PrintText

.NoRoomTMText:
	text_far _NoRoomTMText
	text_end

.ReceivedTMText:
	text_far _ReceivedTMText
	text_end

.CheckHaveRoomForTM:
	ld a, [wTempTM]
	dec a
	ld hl, wTMs
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	inc a
	cp MAX_ITEM_STACK + 1
	ret nc
	ld [hl], a
	ret

CountTMs:
	ld b, 0
	ld c, NUM_TMS
	ld hl, wTMs
.loop
	ld a, [hli]
	and a
	jr z, .skip
	inc b
.skip
	dec c
	jr nz, .loop
	ld a, b
	ld [wTempTM], a
	ret
