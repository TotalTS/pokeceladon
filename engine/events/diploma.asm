DEF CIRCLE_TILE_ID EQU $70

DisplayDiploma::
	call SaveScreenTilesToBuffer2
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	xor a
	ld [wUpdateSpritesEnabled], a
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	call DisableLCD
	ld hl, CircleTile
	ld de, vChars2 tile CIRCLE_TILE_ID
	ld bc, TILE_SIZE
	ld a, BANK(CircleTile)
	call FarCopyData2
	hlcoord 0, 0
	lb bc, 16, 18
	predef Diploma_TextBoxBorder

	ld hl, DiplomaTextPointersAndCoords
	ld a, [wWhichTrade]
    and a
    ld hl, DiplomaTextPointersAndCoords
    jr z, .loadText
    ld hl, MagikarpTextPointersAndCoords
.loadText
	ld c, $5
.placeTextLoop
	push bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
	call PlaceString
	pop hl
	inc hl
	pop bc
	dec c
	jr nz, .placeTextLoop
	hlcoord 10, 4
	ld de, wPlayerName
	call PlaceString

; Move the player 33 pixels right and set the priority bit so he appears
; behind the background layer.
	ld a, [wWhichTrade]
	and a
	jr nz, .magikarpGfx 

	farcall DrawPlayerCharacter
	ld hl, wShadowOAMSprite00XCoord
    lb bc, $80, $28
.adjustPlayerGfxLoop
    ld a, [hl]
    add 33
    ld [hli], a
    inc hl
    ld a, b
    ld [hli], a
    inc hl
    dec c
    jr nz, .adjustPlayerGfxLoop
    jr .afterGfx

.magikarpGfx
    call DrawMagikarpDiploma
    jr .afterGfx
.afterGfx
    call EnableLCD
	farcall LoadTrainerInfoTextBoxTiles
    ld b, SET_PAL_GENERIC2
	call RunPaletteCommand
	call Delay3
	call GBPalNormal
	ld a, $90
	ldh [rOBP0], a
	call WaitForTextScrollButtonPress
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call Delay3
	jp GBPalNormal

DrawMagikarpDiploma:
    ld hl, MagikarpDRSprite
    ld de, vSprites
    ld bc, MagikarpDRSpriteEnd - MagikarpDRSprite
    ld a, BANK(MagikarpDRSprite)
    call FarCopyData2

    call ClearSprites
    xor a
    ld [wPlayerCharacterOAMTile], a
    ld hl, wShadowOAM

    lb de, $60, $7B

    ld b, 7
.loop
    push de
    ld c, 5
.innerLoop
    ld a, d
    ld [hli], a
    ld a, e
    ld [hli], a
    add 8
    ld e, a

    ld a, [wPlayerCharacterOAMTile]
    ld [hli], a
    inc a
    ld [wPlayerCharacterOAMTile], a

    inc hl
    dec c
    jr nz, .innerLoop

    pop de
    ld a, 8
    add d
    ld d, a
    dec b
    jr nz, .loop
    ret


UnusedPlayerNameLengthFunc:
; Unused function that performs bc = -(player name's length)
; leftover from the JPN versions
	ld hl, wPlayerName
	lb bc, $ff, $00
.loop
	ld a, [hli]
	cp '@'
	ret z
	dec c
	jr .loop

MACRO diploma_text
	dw \3
	dwcoord \1, \2
ENDM

DiplomaTextPointersAndCoords:
	; x, y, text
	diploma_text  5,  2, DiplomaText
	diploma_text  3,  4, DiplomaPlayer
	diploma_text 15,  4, DiplomaEmptyText
	diploma_text  2,  6, DiplomaCongrats
	diploma_text  9, 16, DiplomaGameFreak

DiplomaText:
	db CIRCLE_TILE_ID, "Diploma", CIRCLE_TILE_ID, "@"

DiplomaPlayer:
	db "Player@"

DiplomaEmptyText:
	db "@"

DiplomaCongrats:
	db   "Congrats! This"
	next "diploma certifies"
	next "that you have"
	next "completed your"
	next "#DEX.@"

DiplomaGameFreak:
	db "GAME FREAK@"

MagikarpTextPointersAndCoords:
    diploma_text  5,  2, MagikarpTitle
    diploma_text  3,  4, DiplomaPlayer
    diploma_text 15,  4, DiplomaEmptyText
    diploma_text  2,  6, MagikarpCongrats
    diploma_text  1, 16, DiplomaUniversity

MagikarpTitle:
	db CIRCLE_TILE_ID, "Diploma", CIRCLE_TILE_ID, "@"

MagikarpCongrats:
    db   "Congrats! This"
    next "diploma certifies"
    next "that you have"
    next "completed the"
    next "EXAM!@"
	
DiplomaUniversity:
	db "CELADON UNIVERSITY@"
	
MagikarpDRSprite:
    INCBIN "gfx/pokemon/magikarpdr.2bpp"
MagikarpDRSpriteEnd:
