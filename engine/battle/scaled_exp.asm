;from pokeorange mostly.
ScaledExpCalculation:
	xor a
	ldh [hMultiplicand], a
	ld a, [wEnemyMonLevel]
	add a
	add 10
	call Power25Calculator
	ld a, [wEnemyMonLevel]
	ldh [hMultiplier], a
	call Multiply
	push bc
	ld a, 5
	ldh [hDivisor], a
	ld b, $4
	call Divide
	pop bc
	ld hl, wExpScratch40_1
	ldh a, [hProduct]
	ld [hli], a
	ldh a, [hProduct + 1]
	ld [hli], a
	ldh a, [hProduct + 2]
	ld [hli], a
	ldh a, [hProduct + 3]
	ld [hl], a
	ld a, [wEnemyMonBaseExp]
	ldh [hMultiplier], a
	call BigMultiply
	ld a, [hBigMultiplicand]
	push af
	ld a, [hBigMultiplicand + 1]
	push af
	ld a, [hBigMultiplicand + 2]
	push af
	ld a, [hBigMultiplicand + 3]
	push af
	ld a, [hBigMultiplicand + 4]
	push af
	ld hl, wExpScratch40_1
	ld a, [hli]
	ldh [hProduct], a
	ld a, [hli]
	ldh [hProduct + 1], a
	ld a, [hli]
	ldh [hProduct + 2], a
	ld a, [hl]
	ldh [hProduct + 3], a
	ld a, [wEnemyMonBaseExp + 1]
	ldh [hMultiplier], a
	call BigMultiply
	ld a, [hBigMultiplicand + 1]
	ldh [hBigMultiplicand], a
	ld a, [hBigMultiplicand + 2]
	ldh [hBigMultiplicand + 1], a
	ld a, [hBigMultiplicand + 3]
	ldh [hBigMultiplicand + 2], a
	ld a, [hBigMultiplicand + 4]
	ldh [hBigMultiplicand + 3], a
	pop af
	ld [hBigMultiplicand + 4], a
	pop bc
	ld a, [hBigMultiplicand + 3]
	add b
	ldh [hBigMultiplicand + 3], a
	pop bc
	ld a, [hBigMultiplicand + 2]
	adc b
	ldh [hBigMultiplicand + 2], a
	pop bc
	ld a, [hBigMultiplicand + 1]
	adc b
	ldh [hBigMultiplicand + 1], a
	pop bc
	ld a, [hBigMultiplicand]
	adc b
	ldh [hBigMultiplicand], a
	ld a, [wEnemyMonLevel]
	ld b, a
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	add b
	add 10
	ld b, a
	ld a, [hBigMultiplicand + 1]
	ld d, a
	ld a, [hBigMultiplicand + 2]
	ld e, a
	ld a, [hBigMultiplicand + 3]
	ld h, a
	ld a, [hBigMultiplicand + 4]
	ld l, a
	ld a, [hBigMultiplicand]
	ld [wExpScratchByte], a
	ld a, b
	call Power25Calculator
	call SwapProductWithDEHL
	ld a, [wExpScratchByte]
	ldh [hBigMultiplicand], a
	call BigDivision
	xor a
	ldh [hProduct], a
	ld a, c
	add 1
	ldh [hProduct + 3], a
	ld a, b
	adc 0
	ldh [hProduct + 2], a
	ld a, [wExpScratchByte]
	adc 0
	ldh [hProduct + 1], a
	ld a, [hProduct + 3]
	ld [wExpScratch40_1 + 2], a
	ld a, [hProduct + 2]
	ld [wExpScratch40_1 + 1], a
	ld a, [hProduct + 1]
	ld [wExpScratch40_1], a
	ret

Power25Calculator:
; calc (a^2.5), stored in the multiplication bytes
	ldh [hProduct + 3], a
	ldh [hMultiplier], a
	push af
	xor a
	ldh [hProduct], a
	ldh [hProduct + 1], a
	ldh [hProduct + 2], a
	call Multiply
	pop af
	push hl
	ld h, a
	ld l, 0
	call SqrtHL
	pop hl
	ldh [hMultiplier], a
	call Multiply
	push bc
	ld a, $10
	ldh [hDivisor], a
	ld b, $4
	call Divide
	pop bc
	ret

SqrtHL:
; sqrt hl, return a
; uses de
	push de
	ld a, $ff
	ld de, $1
.loop
	inc a
	dec e
; fix for OAM trash bug, even though it was fixed on GBC.
; good practice to not write code that can cause it in any case.
	jr nz, .noHighDec
	dec d
.noHighDec
	dec e
	add hl, de
	jr c, .loop

	pop de
	ret

BigMultiply:
; hBigMultiplicand argument
; hMultiplierStor multiplier
; output to hBigMultiplicand
; uses wExpScratchByte as temp storage for 5th byte
	push bc
	ld b, 8
	xor a
	ldh [hBigMultiplicand], a
	ld [wExpScratchByte], a
	ldh [hMultiplierStor], a
	ldh [hMultiplierStor + 1], a
	ldh [hMultiplierStor + 2], a
	ldh [hMultiplierStor + 3], a
.loop
	ld a, [hMultiplier]
	srl a
	ldh [hMultiplier], a
	jr nc, .next
	ld a, [hMultiplierStor + 3]
	ld c, a
	ld a, [hBigMultiplicand + 4]
	add c
	ldh [hMultiplierStor + 3], a
	ld a, [hMultiplierStor + 2]
	ld c, a
	ld a, [hBigMultiplicand + 3]
	adc c
	ldh [hMultiplierStor + 2], a
	ld a, [hMultiplierStor + 1]
	ld c, a
	ld a, [hBigMultiplicand + 2]
	adc c
	ldh [hMultiplierStor + 1], a
	ld a, [hMultiplierStor]
	ld c, a
	ld a, [hBigMultiplicand + 1]
	adc c
	ldh [hMultiplierStor], a
	ld a, [wExpScratchByte]
	ld c, a
	ld a, [hBigMultiplicand]
	adc c
	ld [wExpScratchByte], a

.next
	dec b
	jr z, .done
	push hl
	ld hl, hBigMultiplicand + 4
	sla [hl]
	dec hl
	rl [hl]
	dec hl
	rl [hl]
	dec hl
	rl [hl]
	dec hl
	rl [hl]
	pop hl
	jr .loop

.done
	ld a, [hMultiplierStor + 3]
	ldh [hBigMultiplicand + 4], a
	ld a, [hMultiplierStor + 2]
	ldh [hBigMultiplicand + 3], a
	ld a, [hMultiplierStor + 1]
	ldh [hBigMultiplicand + 2], a
	ld a, [hMultiplierStor]
	ldh [hBigMultiplicand + 1], a
	ld a, [wExpScratchByte]
	ldh [hBigMultiplicand], a
	pop bc
	ret

SwapProductWithDEHL:
; uses wExpScratch40_1 as temp storage
	push bc
	ld b, h
	ld c, l
; swap hProduct and debc
; backup debc
	ld hl, wExpScratch40_1
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, b
	ld [hli], a
	ld [hl], c
; move hProduct into debc
	ld a, [hProduct]
	ld d, a
	ld a, [hProduct + 1]
	ld e, a
	ld a, [hProduct + 2]
	ld b, a
	ld a, [hProduct + 3]
	ld c, a
; move backup into hProduct
	ld hl, wExpScratch40_1
	ld a, [hli]
	ldh [hProduct], a
	ld a, [hli]
	ldh [hProduct + 1], a
	ld a, [hli]
	ldh [hProduct + 2], a
	ld a, [hl]
	ldh [hProduct + 3], a
; move bc back into hl and return
	ld h, b
	ld l, c
	pop bc
	ret

BigDivision:
; 40-bit by 32-bit bitwise long division
; Inputs:
; hBigMultiplicand: 40bit top
; de:hl : 32bit bottom
; Initialize result
	ld bc, 0
	xor a
	ld [wExpScratchByte], a
; Check for div/0 and don't divide at all if it happens
	ld a, l
	and a
	jr nz, .dontquit
	ld a, h
	and a
	jr nz, .dontquit
	ld a, e
	and a
	jr nz, .dontquit
	ld a, d
	and a
	jr nz, .dontquit
	ret
.dontquit
; clear temp storage
	xor a
	push hl
	ld hl, wExpScratch40_1
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, wExpScratch40_2
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
; final byte in scratch2 should be 1 to be the shifter
	ld a, $1
	ld [hl], a
; get back original HL
	pop hl
; copy initial value of de:hl into the lower 4 bytes of scratch1
	ld a, l
	ld [wExpScratch40_1 + 4], a
	ld a, h
	ld [wExpScratch40_1 + 3], a
	ld a, e
	ld [wExpScratch40_1 + 2], a
	ld a, d
	ld [wExpScratch40_1 + 1], a
; setup for the division
.setup
	ld hl, wExpScratch40_1
	ld de, hBigMultiplicand
	call FortyBitCompare
	jr nc, .loop
	ld hl, wExpScratch40_1 + 4
	call FortyBitLeftShift
	ld hl, wExpScratch40_2 + 4
	call FortyBitLeftShift
	jr .setup

.loop
	ld hl, wExpScratch40_1
	ld de, hBigMultiplicand
	call FortyBitCompare
	jr nc, .aftersubtract
	ld de, hBigMultiplicand + 4
	ld hl, wExpScratch40_1 + 4
	call FortyBitSubtract
	call BigDiv_AccumulateAnswer

.aftersubtract
	ld hl, wExpScratch40_2
	call FortyBitRightShift
	ret c ; if carry is set, the accumulator finished so we're done.
	ld hl, wExpScratch40_1
	call FortyBitRightShift
	jr .loop

BigDiv_AccumulateAnswer::
; set the appropriate answer bit when we do a division step
	push de
	ld a, [wExpScratch40_2 + 2]
	and a
	jr z, .checkSecondByte
	ld d, a
	ld a, [wExpScratchByte]
	or d
	ld [wExpScratchByte], a
	jr .done

.checkSecondByte
	ld a, [wExpScratch40_2 + 3]
	and a
	jr z, .checkThirdByte
	ld d, a
	ld a, b
	or d
	ld b, a
	jr .done

.checkThirdByte
	ld a, [wExpScratch40_2 + 4]
	and a
	jr z, .done
	ld d, a
	ld a, c
	or d
	ld c, a

.done
	pop de
	ret

FortyBitSubtract::
; 40-bit subtract value ending at [hl] from value ending at [de]
	ld a, [de]
	sub [hl]
	ld [de], a
rept 4
	dec de
	dec hl
	ld a, [de]
	sbc [hl]
	ld [de], a
endr
	ret

FortyBitCompare::
; 40-bit <=
; sets carry if value starting at [hl] <= value starting at [de], clears otherwise
; uses b as temp storage along with a
rept 4
	ld a, [de]
	cp [hl]
	jr c, .false
	jr nz, .true
	inc de
	inc hl
endr
	ld a, [de]
	cp [hl]
	jr c, .false
.true
	scf
	ret

.false
	and a
	ret

FortyBitLeftShift::
; take hl = last address in memory
; shift it and the four preceding bytes left
	sla [hl]
rept 4
	dec hl
	rl [hl]
endr
	ret

FortyBitRightShift::
; take hl = first address in memory
; shift it and the four following bytes right
	srl [hl]
rept 4
	inc hl
	rr [hl]
endr
	ret
