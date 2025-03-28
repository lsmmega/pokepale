DEF MAP_NAME_SIGN_START   EQU $c0
DEF POPUP_MAP_NAME_SIZE   EQU 18
DEF POPUP_MAP_FRAME_START EQU $f3
DEF POPUP_MAP_FRAME_SIZE  EQU 8
DEF POPUP_MAP_FRAME_SPACE EQU $fb

; wLandmarkSignTimer
DEF MAPSIGNSTAGE_1_SLIDEOLD EQU $74
DEF MAPSIGNSTAGE_2_LOADGFX  EQU $68
DEF MAPSIGNSTAGE_3_SLIDEIN  EQU $65
DEF MAPSIGNSTAGE_4_VISIBLE  EQU $50
DEF MAPSIGNSTAGE_5_SLIDEOUT EQU $10

InitMapNameSign::
	xor a
	ldh [hBGMapMode], a
	farcall .inefficient_farcall ; this is a waste of 6 ROM bytes and 6 stack bytes
	ret

; should have just been a fallthrough
.inefficient_farcall
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	ld [wCurLandmark], a
	call .CheckNationalParkGate
	jr z, .gate

	call GetMapEnvironment
	cp GATE
	jr nz, .not_gate

.gate
	ld a, -1
	ld [wCurLandmark], a

.not_gate
	ld hl, wMapNameSignFlags
	bit SHOWN_MAP_NAME_SIGN, [hl]
	res SHOWN_MAP_NAME_SIGN, [hl]
	jr nz, .dont_do_map_sign

	call .CheckMovingWithinLandmark
	jr z, .dont_do_map_sign
	ld a, [wCurLandmark]
	ld [wPrevLandmark], a

	call .CheckSpecialMap
	jr z, .dont_do_map_sign

; Landmark sign timer: descends $74-$00
; $73-$68: Sliding out (old sign)
; $67-$65: Loading new graphics
; $64-$50: Sliding in
; $4f-$10: Remains visible
; $0f-$00: Sliding out
	ld a, [wLandmarkSignTimer]
	sub MAPSIGNSTAGE_2_LOADGFX
	jr nc, .stage_1_sliding_out
	add MAPSIGNSTAGE_2_LOADGFX
	cp MAPSIGNSTAGE_5_SLIDEOUT
	jr c, .stage_1_sliding_out
	sub MAPSIGNSTAGE_4_VISIBLE
	jr c, .stage_4_visible
	cp MAPSIGNSTAGE_5_SLIDEOUT
	jr c, .stage_3_sliding_in
	; was in stage 2, loading new graphics; just reload them again
	ld a, MAPSIGNSTAGE_2_LOADGFX
	jr .value_ok

.stage_1_sliding_out
	add MAPSIGNSTAGE_2_LOADGFX
	jr .value_ok

.stage_3_sliding_in
	cpl
	add MAPSIGNSTAGE_1_SLIDEOLD + 1 ; a = MAPSIGNSTAGE_1_SLIDEOLD - a
	jr .value_ok

.stage_4_visible
	ld a, MAPSIGNSTAGE_1_SLIDEOLD
.value_ok
	ld [wLandmarkSignTimer], a
	ret

.dont_do_map_sign
	ld a, [wCurLandmark]
	ld [wPrevLandmark], a
	ld a, $90
	ldh [rWY], a
	ldh [hWY], a
	xor a
	ldh [hLCDCPointer], a
	ret

.CheckMovingWithinLandmark:
	ld a, [wCurLandmark]
	ld c, a
	ld a, [wPrevLandmark]
	cp c
	ret z
	cp LANDMARK_SPECIAL
	ret

.CheckSpecialMap:
; These landmarks do not get pop-up signs.
	cp -1
	ret z
	cp LANDMARK_SPECIAL ; redundant check
	ret z
	cp LANDMARK_RADIO_TOWER
	ret z
	cp LANDMARK_LAV_RADIO_TOWER
	ret z
	cp LANDMARK_UNDERGROUND_PATH
	ret z
	cp LANDMARK_INDIGO_PLATEAU
	ret z
	cp LANDMARK_POWER_PLANT
	ret z
	ld a, 1
	and a
	ret

.CheckNationalParkGate:
	ld a, [wMapGroup]
	cp GROUP_ROUTE_35_NATIONAL_PARK_GATE
	ret nz
	ld a, [wMapNumber]
	cp MAP_ROUTE_35_NATIONAL_PARK_GATE
	ret z
	cp MAP_ROUTE_36_NATIONAL_PARK_GATE
	ret

PlaceMapNameSign::
	; Sign is slightly delayed to move it away from the map connection setup
	ld hl, wLandmarkSignTimer
	ld a, [hl]
	and a
	jr z, .stage_5_sliding_out
	dec [hl]
	sub MAPSIGNSTAGE_2_LOADGFX
	jr nc, .stage_5_sliding_out
	add MAPSIGNSTAGE_2_LOADGFX
	cp MAPSIGNSTAGE_2_LOADGFX - 1
	ret nc
	sub MAPSIGNSTAGE_3_SLIDEIN
	jr c, .graphics_ok
	push hl
	call InitMapNameFrame
	call PlaceMapNameCenterAlign
	farcall HDMATransfer_OnlyTopFourRows
	pop hl

.graphics_ok
	ld a, [hl]
	cp MAPSIGNSTAGE_4_VISIBLE
	jr nc, .stage_3_sliding_in
	cp MAPSIGNSTAGE_5_SLIDEOUT
	jr c, .stage_5_sliding_out
	ld a, SCREEN_HEIGHT_PX - 4 * TILE_WIDTH
	jr .got_value

.stage_3_sliding_in
	sub MAPSIGNSTAGE_4_VISIBLE
	add a
	add SCREEN_HEIGHT_PX - 4 * TILE_WIDTH
	jr .got_value

.stage_5_sliding_out
	add a
	cpl
	add SCREEN_HEIGHT_PX + 1 ; a = SCREEN_HEIGHT_PX - a
.got_value
	ldh [rWY], a
	ldh [hWY], a
	sub SCREEN_HEIGHT_PX
	ret nz
	ld hl, rIE
	res LCD_STAT, [hl]
	ldh [hLCDCPointer], a
	ret

InitMapNameFrame:
	hlcoord 0, 0
	ld b, 2
	ld c, 18
	call InitMapSignAttrmap
	call PlaceMapNameFrame
	ret

PlaceMapNameCenterAlign:
	ld a, [wCurLandmark]
	ld e, a
	farcall GetLandmarkName
	call .GetNameLength
	ld a, SCREEN_WIDTH
	sub c
	srl a
	ld b, 0
	ld c, a
	hlcoord 0, 2
	add hl, bc
	ld de, wStringBuffer1
	call PlaceString
	ret

.GetNameLength:
	ld c, 0
	push hl
	ld hl, wStringBuffer1
.loop
	ld a, [hli]
	cp "@"
	jr z, .stop
	cp "<WBR>"
	jr z, .loop
	inc c
	jr .loop
.stop
	pop hl
	ret

InitMapSignAttrmap:
	ld de, wAttrmap - wTilemap
	add hl, de
	inc b
	inc b
	inc c
	inc c
	ld a, PAL_BG_TEXT | PRIORITY
.loop
	push bc
	push hl
.inner_loop
	ld [hli], a
	dec c
	jr nz, .inner_loop
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop bc
	dec b
	jr nz, .loop
	ret

PlaceMapNameFrame:
	hlcoord 0, 0
	; top left
	ld a, MAP_NAME_SIGN_START + 1
	ld [hli], a
	; top row
	ld a, MAP_NAME_SIGN_START + 2
	call .FillTopBottom
	; top right
	ld a, MAP_NAME_SIGN_START + 4
	ld [hli], a
	; left, first line
	ld a, MAP_NAME_SIGN_START + 5
	ld [hli], a
	; first line
	call .FillMiddle
	; right, first line
	ld a, MAP_NAME_SIGN_START + 11
	ld [hli], a
	; left, second line
	ld a, MAP_NAME_SIGN_START + 6
	ld [hli], a
	; second line
	call .FillMiddle
	; right, second line
	ld a, MAP_NAME_SIGN_START + 12
	ld [hli], a
	; bottom left
	ld a, MAP_NAME_SIGN_START + 7
	ld [hli], a
	; bottom
	ld a, MAP_NAME_SIGN_START + 8
	call .FillTopBottom
	; bottom right
	ld a, MAP_NAME_SIGN_START + 10
	ld [hl], a
	ret

.FillMiddle:
	ld c, SCREEN_WIDTH - 2
	ld a, MAP_NAME_SIGN_START + 13
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret

.FillTopBottom:
	ld c, (SCREEN_WIDTH - 2) / 4 + 1
	jr .enterloop

.continueloop
	ld [hli], a
	ld [hli], a

.enterloop
	inc a
	ld [hli], a
	ld [hli], a
	dec a
	dec c
	jr nz, .continueloop
	ret
