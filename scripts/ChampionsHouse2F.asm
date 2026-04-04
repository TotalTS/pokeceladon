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
	CheckEvent EVENT_USED_DOLL_SWAP
	jr z, .done
	call RestoreDollFacings
	ret
	
.done
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
	
	ld de, ChooseADollOptionsText
	call ShowGenericDollMenu
	jr c, .exit
	ld [wSelectedDoll], a

	ld de, DollMenuOptionsText
	call ShowGenericDollMenu
	jr c, .exit
	ld b, a ; b = selected set

	push bc
	ld a, b
	call GetDollSetTextPointer
	ld d, h
	ld e, l
	call ShowGenericDollMenu
	jr c, .cancel

	ld [wSelectedDollOption], a
	pop bc
	ld a, b
	ld [wSelectedDollSet], a
	call ApplyDollSelection
	jr .exit

.cancel
	pop bc

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

ApplyDollSelection:
	ld a, [wSelectedDollSet]
	ld b, a
	ld a, [wSelectedDollOption]
	ld c, a

	ld a, [wSelectedDoll]
	cp 0
	jr z, .saveDoll1
	cp 1
	jr z, .saveDoll2
	jr .saveDoll3

.saveDoll1
	ld a, c
	ld [wDoll1Facing], a
	jr .saveDone

.saveDoll2
	ld a, c
	ld [wDoll2Facing], a
	jr .saveDone

.saveDoll3
	ld a, c
	ld [wDoll3Facing], a

.saveDone
	ld a, [wSelectedDoll]
	and a
	jr z, .hideDoll1
	dec a
	jr z, .hideDoll2
	jr .hideDoll3
.hideDoll1
	ld a, TOGGLE_CHAMPIONSHOUSE2F_CHARMANDERDOLL
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_CHAMPIONSHOUSE2F_PIKACHUDOLL
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_CHAMPIONSHOUSE2F_GENGARDOLL
	ld [wToggleableObjectIndex], a
	predef HideObject
	jr .hideDone
.hideDoll2
	ld a, TOGGLE_CHAMPIONSHOUSE2F_SQUIRTLEDOLL
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_CHAMPIONSHOUSE2F_JIGGLYPUFFDOLL
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_CHAMPIONSHOUSE2F_CLEFAIRYDOLL
	ld [wToggleableObjectIndex], a
	predef HideObject
	jr .hideDone
.hideDoll3
	ld a, TOGGLE_CHAMPIONSHOUSE2F_BULBASAURDOLL
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_CHAMPIONSHOUSE2F_SURFPIKACHUDOLL
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_CHAMPIONSHOUSE2F_GEODUDEDOLL
	ld [wToggleableObjectIndex], a
	predef HideObject
.hideDone
	ld a, [wSelectedDollSet]
	ld b, a
	ld a, [wSelectedDollOption]
	ld c, a
	; a = (doll * 3) + set
	ld a, [wSelectedDoll]
	add a          ; *2
	ld d, a
	ld a, [wSelectedDoll]
	add d          ; *3
	add b          ; + set
	ld [wSelectedDollIndex], a
	
	ld a, [wSelectedDoll]
	cp 0
	jr z, .saveIndex1
	cp 1
	jr z, .saveIndex2
	jr .saveIndex3

.saveIndex1
	ld a, [wSelectedDollIndex]
	ld [wDoll1Index], a
	jr .saveIndexDone

.saveIndex2
	ld a, [wSelectedDollIndex]
	ld [wDoll2Index], a
	jr .saveIndexDone

.saveIndex3
	ld a, [wSelectedDollIndex]
	ld [wDoll3Index], a

.saveIndexDone
	ld a, [wSelectedDollIndex]

	ld hl, DollObjectIndexes
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ldh [hSpriteIndex], a

	ld a, c
	ld hl, DollFacingDirections
	ld d, 0
	ld e, a
	add hl, de
	ld d, [hl] ; d = DOWN / UP / LEFT

	call GetSpriteMovementByte1Pointer
	ld [hl], STAY ; Movement Byte 1 = $FF

	call GetSpriteMovementByte2Pointer
	ld a, d
	ld [hl], a ; Movement Byte 2 = actual facing direction
	ld a, [wSelectedDollIndex]

	cp 0
	jr z, .c1s1
	cp 1
	jr z, .c1s2
	cp 2
	jr z, .c1s3
	cp 3
	jr z, .c2s1
	cp 4
	jr z, .c2s2
	cp 5
	jr z, .c2s3
	cp 6
	jr z, .c3s1
	cp 7
	jr z, .c3s2
	jr .c3s3

; Charmander slot
.c1s1
	ld a, TOGGLE_CHAMPIONSHOUSE2F_CHARMANDERDOLL
	jr .showCommon
.c1s2
	ld a, TOGGLE_CHAMPIONSHOUSE2F_PIKACHUDOLL
	jr .showCommon
.c1s3
	ld a, TOGGLE_CHAMPIONSHOUSE2F_GENGARDOLL
	jr .showCommon

; Squirtle slot
.c2s1
	ld a, TOGGLE_CHAMPIONSHOUSE2F_SQUIRTLEDOLL
	jr .showCommon
.c2s2
	ld a, TOGGLE_CHAMPIONSHOUSE2F_JIGGLYPUFFDOLL
	jr .showCommon
.c2s3
	ld a, TOGGLE_CHAMPIONSHOUSE2F_CLEFAIRYDOLL
	jr .showCommon

; Bulbasaur slot
.c3s1
	ld a, TOGGLE_CHAMPIONSHOUSE2F_BULBASAURDOLL
	jr .showCommon
.c3s2
	ld a, TOGGLE_CHAMPIONSHOUSE2F_SURFPIKACHUDOLL
	jr .showCommon
.c3s3
	ld a, TOGGLE_CHAMPIONSHOUSE2F_GEODUDEDOLL
	jr .showCommon

.showCommon
	ld [wToggleableObjectIndex], a
	predef ShowObject
	SetEvent EVENT_USED_DOLL_SWAP
	call UpdateSprites
.done
	ret
	
ShowGenericDollMenu:
	push de
	hlcoord 5, 5
	lb bc, 6, 13
	call TextBoxBorder
	call UpdateSprites
	xor a
	ld [wLetterPrintingDelayFlags], a
	hlcoord 7, 7
	pop de
	call PlaceString
	ld hl, wTopMenuItemY
	ld a, 7
	ld [hli], a
	ld a, 6
	ld [hli], a
	xor a
	ld [hli], a
	inc hl
	ld a, 2
	ld [hli], a
	ld a, PAD_A | PAD_B
	ld [hli], a
	call HandleMenuInput
	bit B_PAD_B, a
	jr nz, .b
	ld a, [wCurrentMenuItem]
	and a
	ret
.b
	scf
	ret

ChooseADollOptionsText:
	db "DOLL 1" ; CHAMPIONSHOUSE2F_CHARMANDERDOLL
	next "DOLL 2" ; CHAMPIONSHOUSE2F_SQUIRTLEDOLL
	next "DOLL 3@" ; CHAMPIONSHOUSE2F_BULBASAURDOLL

DollMenuOptionsText:
	db "DOLL SET 1"
	next "DOLL SET 2"
	next "DOLL SET 3@"
	
DollSetTexts:
	dw DollSet1Text
	dw DollSet2Text
	dw DollSet3Text
	
GetDollSetTextPointer:
	ld hl, DollSetTexts
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret


DollSet1Text:
	db "CHARMANDER"
	next "SQUIRTLE"
	next "BULBASAUR@"

DollSet2Text:
	db "PIKACHU"
	next "JIGGLYPUFF"
	next "SURF PIKACHU@"

DollSet3Text:
	db "GENGAR"
	next "CLEFAIRY"
	next "GEODUDE@"
	
DollObjectIndexes:
	db CHAMPIONSHOUSE2F_CHARMANDERDOLL ; set 0 for Charmander
	db CHAMPIONSHOUSE2F_PIKACHUDOLL ; set 1 for Charmander
	db CHAMPIONSHOUSE2F_GENGARDOLL ; set 2 for Charmander
	db CHAMPIONSHOUSE2F_SQUIRTLEDOLL ; set 0 for Squirtle
	db CHAMPIONSHOUSE2F_JIGGLYPUFFDOLL ; set 1 for Squirtle
	db CHAMPIONSHOUSE2F_CLEFAIRYDOLL ; set 2 for Squirtle
	db CHAMPIONSHOUSE2F_BULBASAURDOLL ; set 0 for Bulbasaur
	db CHAMPIONSHOUSE2F_SURFPIKACHUDOLL ; set 1 for Bulbasaur
	db CHAMPIONSHOUSE2F_GEODUDEDOLL ; set 2 for Bulbasaur

DollFacingDirections:
	db DOWN
	db UP
	db LEFT

RestoreDollFacings:
	ld a, [wDoll1Index]
	ld b, a
	ld a, [wDoll1Facing]
	ld c, a
	call .Apply
	ld a, [wDoll2Index]
	ld b, a
	ld a, [wDoll2Facing]
	ld c, a
	call .Apply
	ld a, [wDoll3Index]
	ld b, a
	ld a, [wDoll3Facing]
	ld c, a
	call .Apply
	ret


.Apply
	; b = index (0–8)
	; c = facing (0–2)
	; sprite
	ld hl, DollObjectIndexes
	ld e, b
	ld d, 0
	add hl, de
	ld a, [hl]
	ldh [hSpriteIndex], a
	; facing
	ld a, c
	ld hl, DollFacingDirections
	ld d, 0
	ld e, a
	add hl, de
	ld d, [hl]
	call GetSpriteMovementByte1Pointer
	ld [hl], STAY
	call GetSpriteMovementByte2Pointer
	ld a, d
	ld [hl], a
	ret
