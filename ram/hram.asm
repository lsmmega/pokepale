SECTION "HRAM", HRAM

hROMBankBackup:: db
hFarByte::
hTempBank:: db
hSRAMBank:: db

hRTCDayHi::   db
hRTCDayLo::   db
hRTCHours::   db
hRTCMinutes:: db
hRTCSeconds:: db

	ds 2

hHours:: db
	ds 1
hMinutes:: db
	ds 1
hSeconds:: db
	ds 1

	ds 1

hVBlankCounter:: db

	ds 1

hROMBank:: db
hVBlank:: db
hMapEntryMethod:: db

hMenuReturn:: db
hUnusedByte:: db

hJoypadReleased:: db
hJoypadPressed::  db
hJoypadDown::     db
hJoypadSum::      db
hJoyReleased::    db
hJoyPressed::     db
hJoyDown::        db
hJoyLast::        db

hInMenu:: db

	ds 1

hPrinter:: db
hGraphicStartTile:: db
hMoveMon:: db

UNION
hMapObjectIndex:: db
hObjectStructIndex:: db
NEXTU
hConnectionStripLength:: db
hConnectedMapWidth:: db
ENDU

hEnemyMonSpeed:: db
hBigMultiplicand:: db
UNION
; math-related values

UNION
; inputs to Multiply
	ds 1
hMultiplicand:: ds 3
hMultiplier::   db
NEXTU
; result of Multiply
hProduct::      ds 4
NEXTU
; inputs to Divide
hDividend::     ds 4
hDivisor::      db
NEXTU
; results of Divide
hQuotient::     ds 4
hRemainder::    db
ENDU

hMathBuffer:: db
hMultiplierStor:: ds 4
NEXTU
; PrintNum scratch space
hPrintNumBuffer:: ds 10

NEXTU
; Mystery Gift
hMGExchangedByte:: db
hMGExchangedWord:: dw
hMGNumBits:: db
hMGChecksum:: dw
	ds 1
hMGUnusedMsgLength:: db
hMGRole:: db
hMGStatusFlags:: db
ENDU

UNION
hUsedSpriteIndex:: db
hUsedSpriteTile::  db
NEXTU
hCurSpriteXCoord::   db
hCurSpriteYCoord::   db
hCurSpriteXPixel::   db
hCurSpriteYPixel::   db
hCurSpriteTile::     db
hCurSpriteOAMFlags:: db
ENDU

UNION
hMoneyTemp:: ds 3
NEXTU
hMGJoypadPressed::  db
hMGJoypadReleased:: db
hMGPrevTIMA::       db
ENDU

hLCDCPointer::     db
hLYOverrideStart:: db
hLYOverrideEnd::   db

hMobileReceive::             db
hSerialReceivedNewData::     db
hSerialConnectionStatus::    db
hSerialIgnoringInitialData:: db
hSerialSend::                db
hSerialReceive::             db

hSCX::           db
hSCY::           db
hWX::            db
hWY::            db
hTilesPerCycle:: db
hBGMapMode::     db
hBGMapHalf::     db
hBGMapAddress::  dw

hOAMUpdate:: db

hSPBuffer::  dw

hBGMapUpdate::    db
hBGMapTileCount:: db

	ds 1

hMapAnims::      db
hTileAnimFrame:: db

hLastTalked:: db

hRandomAdd:: db
hRandomSub:: db

hUnusedBackup:: db

hBattleTurn::
; Which trainer's turn is it? 0: player, 1: opponent trainer
	db

hCGBPalUpdate:: db
hCGB::          db
hSGB::          db

hDMATransfer:: db
hMobile:: db
hSystemBooted:: db

hClockResetTrigger:: db
hRequested2bpp:: db
hRequested1bpp:: db
hRequestedVTileDest:: dw
hRequestedVTileSource:: dw
	ds 13

ENDSECTION
