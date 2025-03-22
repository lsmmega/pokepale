CanLearnTMMove:
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld hl, wBaseTM
	push hl

	ld a, [wPutativeTMMove]
	ld b, a
	ld c, 0
	ld hl, TMMoves
.loop
	ld a, [hli]
	and a
	jr z, .end
	cp b
	jr z, .found
	inc c
	jr .loop

.found
	pop hl
	ld b, CHECK_FLAG
	push de
	ld d, 0
	predef SmallFarFlagAction
	pop de
	ret

.end
	pop hl
	ld c, 0
	ret

GetTMMove:
	ld a, [wTempTM]
	dec a
	ld hl, TMMoves
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wTempTM], a
	ret

INCLUDE "data/moves/tm_moves.asm"
