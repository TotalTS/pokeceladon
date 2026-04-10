HandleDollSelection::
	ld de, ChooseADollOptionsText
	call ShowGenericDollMenu
	ret c

	ld [wSelectedDoll], a

	ld de, DollMenuOptionsText
	call ShowGenericDollMenu
	ret c
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
	ret

.cancel
	pop bc
	ret

; Doll index mapping:
; Index = (selected Doll slot * 3) + selected Set
; This index is used to:
; * Lookup sprite object in DollObjectIndexes
; * Determine which map object to Show/Hide

ApplyDollSelection:
	ld a, [wSelectedDollSet]
	ld b, a
	ld a, [wSelectedDollOption]
	ld c, a
	
; if Doll 1, 2 or 3 is selected, save facing on WRAM

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

; hide objects in map if selected Doll 1, 2, 3
.saveDone
	ld a, [wSelectedDoll]
	and a
	jr z, .hideDoll1
	dec a
	jr z, .hideDoll2
	jr .hideDoll3

; Charmander slot (Doll 1)
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

; Squirtle slot (Doll 2)
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

; Bulbasaur slot (Doll 3)
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
; calculate new Index
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

; save selected Doll 1, 2 or 3 in wDollXIndex

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
	
; set facing of Doll 1, 2 or 3

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

; show the selected Doll (after Hide)

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

; Charmander slot (Doll 1)
.c1s1
	ld a, TOGGLE_CHAMPIONSHOUSE2F_CHARMANDERDOLL
	jr .showCommon
.c1s2
	ld a, TOGGLE_CHAMPIONSHOUSE2F_PIKACHUDOLL
	jr .showCommon
.c1s3
	ld a, TOGGLE_CHAMPIONSHOUSE2F_GENGARDOLL
	jr .showCommon

; Squirtle slot (Doll 2)
.c2s1
	ld a, TOGGLE_CHAMPIONSHOUSE2F_SQUIRTLEDOLL
	jr .showCommon
.c2s2
	ld a, TOGGLE_CHAMPIONSHOUSE2F_JIGGLYPUFFDOLL
	jr .showCommon
.c2s3
	ld a, TOGGLE_CHAMPIONSHOUSE2F_CLEFAIRYDOLL
	jr .showCommon

; Bulbasaur slot (Doll 3)
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
; Show selected doll object (map object toggle)
	ld [wToggleableObjectIndex], a
	predef ShowObject

	SetEvent EVENT_CHAMPIONSHOUSE2F_USED_DOLL_SWAP
	call UpdateSprites
.done
	ret

; handles menu ChooseADollOptionsText, DollMenuOptionsText, DollSet1Text/DollSet2Text/DollSet3Text
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

; Applies facing ONLY to sprite state
RestoreDollFacings::
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
	ld a, [wDoll1Index]
	ld b, a
	ld a, [wDoll1Facing]
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
