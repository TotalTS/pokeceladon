HandleLedges::
	ld a, [wMovementFlags]
	bit BIT_LEDGE_OR_FISHING, a
	ret nz
	ld a, [wCurMapTileset]
	and a ; OVERWORLD
	ret nz
	predef GetTileAndCoordsInFrontOfPlayer
	ld a, [wWalkBikeSurfState]
	cp 3
	jr z, .isSkatingLedge
	ld a, [wSpritePlayerStateData1FacingDirection]
	ld b, a
	lda_coord 8, 9
	ld c, a
	ld a, [wTileInFrontOfPlayer]
	ld d, a
	ld hl, LedgeTiles
.loop
	ld a, [hli]
	cp $ff
	ret z
	cp b
	jr nz, .nextLedgeTile1
	ld a, [hli]
	cp c
	jr nz, .nextLedgeTile2
	ld a, [hli]
	cp d
	jr nz, .nextLedgeTile3
	ld a, [hl]
	ld e, a
	jr .foundMatch
.nextLedgeTile1
	inc hl
.nextLedgeTile2
	inc hl
.nextLedgeTile3
	inc hl
	jr .loop
.foundMatch
	ldh a, [hJoyHeld]
	and e
	ret z
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld hl, wMovementFlags
	set BIT_LEDGE_OR_FISHING, [hl]
	call StartSimulatingJoypadStates
	ld a, e
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSimulatedJoypadStatesEnd + 1], a
	ld a, $2
	ld [wSimulatedJoypadStatesIndex], a
	call LoadHoppingShadowOAM
	ld a, SFX_LEDGE
	call PlaySound
	ret
.isSkatingLedge
	ld a, [wTileInFrontOfPlayer]
	ld d, a

	cp $37 ; vertical
	jr z, .checkVertical
	cp $36 ; vertical
	jr z, .checkVertical

	cp $27 ; horizontal
	jr z, .checkHorizontal
	cp $0D ; horizontal
	jr z, .checkHorizontal
	cp $1D ; horizontal
	jr z, .checkHorizontal

	ret

.checkVertical
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	jr z, .skateJumpUp
	cp SPRITE_FACING_DOWN
	jr z, .skateJumpDown
	ret

.checkHorizontal
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_LEFT
	jr z, .skateJumpLeft
	cp SPRITE_FACING_RIGHT
	jr z, .skateJumpRight
	ret

.skateJumpUp
	ld e, PAD_UP
	jr .foundMatch

.skateJumpDown
	ld e, PAD_DOWN
	jr .foundMatch

.skateJumpLeft
	ld e, PAD_LEFT
	jr .foundMatch

.skateJumpRight
	ld e, PAD_RIGHT
	jr .foundMatch

INCLUDE "data/tilesets/ledge_tiles.asm"

LoadHoppingShadowOAM:
	ld hl, vChars1 tile $7f
	ld de, LedgeHoppingShadow
	lb bc, BANK(LedgeHoppingShadow), (LedgeHoppingShadowEnd - LedgeHoppingShadow) / TILE_1BPP_SIZE
	call CopyVideoDataDouble
	ld a, $9
	lb bc, $54, $48 ; b, c = y, x coordinates of shadow
	ld de, LedgeHoppingShadowOAMBlock
	call WriteOAMBlock
	ret

LedgeHoppingShadow:
	INCBIN "gfx/overworld/shadow.1bpp"
LedgeHoppingShadowEnd:

LedgeHoppingShadowOAMBlock:
; tile ID, attributes
	db $ff, OAM_PAL1
	db $ff, OAM_XFLIP
	db $ff, OAM_YFLIP
	db $ff, OAM_XFLIP | OAM_YFLIP
