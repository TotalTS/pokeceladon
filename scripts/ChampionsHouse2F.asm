; Visual reference only: This describes how the sprite sheet (png/2bpp) is arranged visually.
; It does NOT reflect engine behavior or code logic.

;SPRITE DOLL_SET1 (2bpp sprite sheet layout):
;DOWN = SPRITE CHARMANDER
;UP = SPRITE SQUIRTLE
;LEFT = SPRITE BULBASAUR

;SPRITE DOLL_SET2 (2bpp sprite sheet layout):
;DOWN = SPRITE PIKACHU
;UP = SPRITE JIGGLYPUFF
;LEFT = SPRITE SURF PIKACHU

;SPRITE DOLL_SET3 (2bpp sprite sheet layout):
;DOWN = SPRITE GENGAR
;UP = SPRITE CLEFAIRY
;LEFT = SPRITE GEODUDE

ChampionsHouse2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, ChampionsHouse2F_ScriptPointers
	ld a, [wChampionsHouse2FCurScript]
	jp CallFunctionInTable

ChampionsHouse2F_ScriptPointers:
	def_script_pointers
	dw_const ChampionsHouse2FDefaultScript, SCRIPT_CHAMPIONSHOUSE2F_DEFAULT

ChampionsHouse2FDefaultScript:
    ld hl, wStatusFlags3
    set BIT_NO_NPC_FACE_PLAYER, [hl]

    ld hl, wCurrentMapScriptFlags
    bit BIT_CUR_MAP_LOADED_2, [hl]
    res BIT_CUR_MAP_LOADED_2, [hl]
    ret z

    CheckEvent EVENT_CHAMPIONSHOUSE2F_USED_DOLL_SWAP
    ret z

    farcall RestoreDollFacings
    ret

ChampionsHouse2F_TextPointers:
	def_text_pointers
	dw_const ChampionsHouse2FCharmanderDollText,  TEXT_CHAMPIONSHOUSE2F_CHARMANDERDOLL
	dw_const ChampionsHouse2FSquirtleDollText,    TEXT_CHAMPIONSHOUSE2F_SQUIRTLEDOLL
	dw_const ChampionsHouse2FBulbasaurDollText,   TEXT_CHAMPIONSHOUSE2F_BULBASAURDOLL
	dw_const ChampionsHouse2FPikachuDollText,     TEXT_CHAMPIONSHOUSE2F_PIKACHUDOLL
	dw_const ChampionsHouse2FJigglypuffDollText,  TEXT_CHAMPIONSHOUSE2F_JIGGLYPUFFDOLL
	dw_const ChampionsHouse2FSurfPikachuDollText, TEXT_CHAMPIONSHOUSE2F_SURFPIKACHUDOLL
	dw_const ChampionsHouse2FGengarDollText,      TEXT_CHAMPIONSHOUSE2F_GENGARDOLL
	dw_const ChampionsHouse2FClefairyDollText,    TEXT_CHAMPIONSHOUSE2F_CLEFAIRYDOLL
	dw_const ChampionsHouse2FGeodudeDollText,     TEXT_CHAMPIONSHOUSE2F_GEODUDEDOLL
	dw_const ChampionsHouse2FCupText,             TEXT_CHAMPIONSHOUSE2F_CUP
	dw_const ChampionsHouse2FGameboyText,         TEXT_CHAMPIONSHOUSE2F_GAMEBOY
	dw_const ChampionsHouse2FBedText,             TEXT_CHAMPIONSHOUSE2F_BED

; this logic repeats for all dolls from Charmander to Geodude, depending on their facing, displays different texts according to the current sprite shown.
ChampionsHouse2FCharmanderDollText:
	text_asm
	call GetSpriteMovementByte2Pointer
	ld a, [hl]
	cp DOWN
	jr z, .isDown
	cp UP
	jr z, .isUp
	jr .isLeft
.isDown
	ld hl, .Doll1isCharmanderText
	jr .print
.isUp
	ld hl, .Doll1isSquirtleText
	jr .print
.isLeft
	ld hl, .Doll1isBulbasaurText
.print
	call PrintText
	jp TextScriptEnd
	
.Doll1isCharmanderText
	text_far _ChampionsHouse2FCharmanderDollText
	text_end
	
.Doll1isSquirtleText
	text_far _ChampionsHouse2FSquirtleDollText
	text_end
	
.Doll1isBulbasaurText
	text_far _ChampionsHouse2FBulbasaurDollText
	text_end

ChampionsHouse2FSquirtleDollText:
	text_asm
	call GetSpriteMovementByte2Pointer
	ld a, [hl]
	cp DOWN
	jr z, .isDown
	cp UP
	jr z, .isUp
	jr .isLeft
.isDown
	ld hl, .Doll2isCharmanderText
	jr .print
.isUp
	ld hl, .Doll2isSquirtleText
	jr .print
.isLeft
	ld hl, .Doll2isBulbasaurText
.print
	call PrintText
	jp TextScriptEnd
	
.Doll2isCharmanderText
	text_far _ChampionsHouse2FCharmanderDollText
	text_end
	
.Doll2isSquirtleText
	text_far _ChampionsHouse2FSquirtleDollText
	text_end
	
.Doll2isBulbasaurText
	text_far _ChampionsHouse2FBulbasaurDollText
	text_end

ChampionsHouse2FBulbasaurDollText:
	text_asm
	call GetSpriteMovementByte2Pointer
	ld a, [hl]
	cp DOWN
	jr z, .isDown
	cp UP
	jr z, .isUp
	jr .isLeft
.isDown
	ld hl, .Doll3isCharmanderText
	jr .print
.isUp
	ld hl, .Doll3isSquirtleText
	jr .print
.isLeft
	ld hl, .Doll3isBulbasaurText
.print
	call PrintText
	jp TextScriptEnd
	
.Doll3isCharmanderText
	text_far _ChampionsHouse2FCharmanderDollText
	text_end
	
.Doll3isSquirtleText
	text_far _ChampionsHouse2FSquirtleDollText
	text_end
	
.Doll3isBulbasaurText
	text_far _ChampionsHouse2FBulbasaurDollText
	text_end
	
ChampionsHouse2FPikachuDollText:
	text_asm
	call GetSpriteMovementByte2Pointer
	ld a, [hl]
	cp DOWN
	jr z, .isDown
	cp UP
	jr z, .isUp
	jr .isLeft
.isDown
	ld hl, .Doll1isPikachuText
	jr .print
.isUp
	ld hl, .Doll1isJigglyPuffText
	jr .print
.isLeft
	ld hl, .Doll1isSurfPikachuText
.print
	call PrintText
	jp TextScriptEnd
	
.Doll1isPikachuText
	text_far _ChampionsHouse2FPikachuDollText
	text_end
	
.Doll1isJigglyPuffText
	text_far _ChampionsHouse2FJigglypuffDollText
	text_end
	
.Doll1isSurfPikachuText
	text_far _ChampionsHouse2FSurfPikachuDollText
	text_end

ChampionsHouse2FJigglypuffDollText:
	text_asm
	call GetSpriteMovementByte2Pointer
	ld a, [hl]
	cp DOWN
	jr z, .isDown
	cp UP
	jr z, .isUp
	jr .isLeft
.isDown
	ld hl, .Doll2isPikachuText
	jr .print
.isUp
	ld hl, .Doll2isJigglyPuffText
	jr .print
.isLeft
	ld hl, .Doll2isSurfPikachuText
.print
	call PrintText
	jp TextScriptEnd
	
.Doll2isPikachuText
	text_far _ChampionsHouse2FPikachuDollText
	text_end
	
.Doll2isJigglyPuffText
	text_far _ChampionsHouse2FJigglypuffDollText
	text_end
	
.Doll2isSurfPikachuText
	text_far _ChampionsHouse2FSurfPikachuDollText
	text_end

ChampionsHouse2FSurfPikachuDollText:
	text_asm
	call GetSpriteMovementByte2Pointer
	ld a, [hl]
	cp DOWN
	jr z, .isDown
	cp UP
	jr z, .isUp
	jr .isLeft
.isDown
	ld hl, .Doll3isPikachuText
	jr .print
.isUp
	ld hl, .Doll3isJigglyPuffText
	jr .print
.isLeft
	ld hl, .Doll3isSurfPikachuText
.print
	call PrintText
	jp TextScriptEnd
	
.Doll3isPikachuText
	text_far _ChampionsHouse2FPikachuDollText
	text_end
	
.Doll3isJigglyPuffText
	text_far _ChampionsHouse2FJigglypuffDollText
	text_end
	
.Doll3isSurfPikachuText
	text_far _ChampionsHouse2FSurfPikachuDollText
	text_end
	
ChampionsHouse2FGengarDollText:
	text_asm
	call GetSpriteMovementByte2Pointer
	ld a, [hl]
	cp DOWN
	jr z, .isDown
	cp UP
	jr z, .isUp
	jr .isLeft
.isDown
	ld hl, .Doll1isGengarText
	jr .print
.isUp
	ld hl, .Doll1isClefairyText
	jr .print
.isLeft
	ld hl, .Doll1isGeodudeText
.print
	call PrintText
	jp TextScriptEnd
	
.Doll1isGengarText
	text_far _ChampionsHouse2FGengarDollText
	text_end
	
.Doll1isClefairyText
	text_far _ChampionsHouse2FClefairyDollText
	text_end
	
.Doll1isGeodudeText
	text_far _ChampionsHouse2FGeodudeDollText
	text_end

ChampionsHouse2FClefairyDollText:
	text_asm
	call GetSpriteMovementByte2Pointer
	ld a, [hl]
	cp DOWN
	jr z, .isDown
	cp UP
	jr z, .isUp
	jr .isLeft
.isDown
	ld hl, .Doll2isGengarText
	jr .print
.isUp
	ld hl, .Doll2isClefairyText
	jr .print
.isLeft
	ld hl, .Doll2isGeodudeText
.print
	call PrintText
	jp TextScriptEnd
	
.Doll2isGengarText
	text_far _ChampionsHouse2FGengarDollText
	text_end
	
.Doll2isClefairyText
	text_far _ChampionsHouse2FClefairyDollText
	text_end
	
.Doll2isGeodudeText
	text_far _ChampionsHouse2FGeodudeDollText
	text_end
	
ChampionsHouse2FGeodudeDollText:
	text_asm
	call GetSpriteMovementByte2Pointer
	ld a, [hl]
	cp DOWN
	jr z, .isDown
	cp UP
	jr z, .isUp
	jr .isLeft
.isDown
	ld hl, .Doll3isGengarText
	jr .print
.isUp
	ld hl, .Doll3isClefairyText
	jr .print
.isLeft
	ld hl, .Doll3isGeodudeText
.print
	call PrintText
	jp TextScriptEnd
	
.Doll3isGengarText
	text_far _ChampionsHouse2FGengarDollText
	text_end
	
.Doll3isClefairyText
	text_far _ChampionsHouse2FClefairyDollText
	text_end
	
.Doll3isGeodudeText
	text_far _ChampionsHouse2FGeodudeDollText
	text_end
	
ChampionsHouse2FCupText:
	text_far _ChampionsHouse2FCupText
	text_end

ChampionsHouse2FGameboyText:
	text_asm
	call SaveScreenTilesToBuffer1
	ld hl, .TextGameboy
	call PrintText
	
	call YesNoChoice ; yes/no menu
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .exit
	
	ld hl, .SelectADollText
	call PrintText
	
	farcall HandleDollSelection

.exit
	call LoadScreenTilesFromBuffer1
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	jp TextScriptEnd
	
.TextGameboy
	text_far _ChampionsHouse2FGameboyText
	text_end

.SelectADollText
	text_far _SelectADollText
	text_end

ChampionsHouse2FBedText:
	text_asm
	ld hl, .ChampionsHouse2FBedText
	call PrintText
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a	
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, ChampionsHouse2FBedChoiceEnd
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a

	ld a, [wLastMusicSoundID]
	ld [wSavedMusicID], a
	
	call GBFadeOutToWhite
	call ReloadMapData
	predef HealParty
	ld a, MUSIC_PKMN_HEALED
	call PlayMusic
	call WaitForSongToFinish
	
	ld a, [wSavedMusicID]
	call PlayMusic
	call GBFadeInFromWhite
	ld hl, .ChampionsHouse2FBedWellRestedText
	call PrintText
	jp TextScriptEnd

.ChampionsHouse2FBedText
	text_far _ChampionsHouse2FBedText
	text_end
	
.ChampionsHouse2FBedWellRestedText
	text_far _ChampionsHouse2FBedWellRestedText
	text_end

ChampionsHouse2FBedChoiceEnd:
	jp TextScriptEnd
