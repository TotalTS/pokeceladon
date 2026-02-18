VermilionDock_Script:
	call EnableAutoTextBoxDrawing
	ld hl, VermilionDockTrainerHeaders
	ld de, VermilionDock_ScriptPointers
	call ExecuteCurMapScriptInTable
	call TruckCheck
	CheckEventHL EVENT_STARTED_WALKING_OUT_OF_DOCK
	jr nz, .walking_out_of_dock
	CheckEventReuseHL EVENT_GOT_HM01
	ret z
	ld a, [wNumHoFTeams]
	and a
	ret nz
	ld a, [wDestinationWarpID]
	cp $1
	ret nz
	CheckEventReuseHL EVENT_SS_ANNE_LEFT
	jp z, VermilionDockSSAnneLeavesScript
	SetEventReuseHL EVENT_STARTED_WALKING_OUT_OF_DOCK
	call Delay3
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld hl, wSimulatedJoypadStatesEnd
	ld a, PAD_UP
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, $3
	ld [wSimulatedJoypadStatesIndex], a
	xor a
	ld [wSpritePlayerStateData2MovementByte1], a
	ld [wOverrideSimulatedJoypadStatesMask], a
	dec a
	ld [wJoyIgnore], a
	ret
.walking_out_of_dock
	CheckEventAfterBranchReuseHL EVENT_WALKED_OUT_OF_DOCK, EVENT_STARTED_WALKING_OUT_OF_DOCK
	ret nz
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld [wJoyIgnore], a
	SetEventReuseHL EVENT_WALKED_OUT_OF_DOCK
	ret

VermilionDock_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

VermilionDockSSAnneLeavesScript:
	SetEventForceReuseHL EVENT_SS_ANNE_LEFT
	ld a, SFX_STOP_ALL_MUSIC
	ld [wJoyIgnore], a
;	ld [wNewSoundID], a
	call PlaySound
	ld c, 0 ; BANK(Music_Surfing)
	ld a, MUSIC_SURFING
	call PlayMusic
	farcall LoadSmokeTileFourTimes
	xor a
	ld [wSpritePlayerStateData1ImageIndex], a
	ld c, 120
	call DelayFrames
	ld b, HIGH(vBGMap1)
	call CopyScreenTileBufferToVRAM
	hlcoord 0, 10
	ld bc, SCREEN_WIDTH * 6
	ld a, $14 ; water tile
	call FillMemory
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	xor a
	ldh [hAutoBGTransferEnabled], a
	ld [wSSAnneSmokeDriftAmount], a
	ldh [rOBP1], a
	ld a, 88
	ld [wSSAnneSmokeX], a
	ld hl, wMapViewVRAMPointer
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	push hl
	ld a, SFX_SS_ANNE_HORN
	call PlaySoundWaitForCurrent
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	ld d, $0
	ld e, $8
.shift_columns_up
	ld hl, $2
	add hl, bc
	ld a, l
	ld [wMapViewVRAMPointer], a
	ld a, h
	ld [wMapViewVRAMPointer + 1], a
	push hl
	push de
	call ScheduleEastColumnRedraw
	call VermilionDock_EmitSmokePuff
	pop de
	ld b, $10
.smoke_puff_drift_loop
	call VermilionDock_AnimSmokePuffDriftRight
	ld c, $8
.delay_between_drifts
	call VermilionDock_SyncScrollWithLY
	dec c
	jr nz, .delay_between_drifts
	inc d
	dec b
	jr nz, .smoke_puff_drift_loop
	pop bc
	dec e
	jr nz, .shift_columns_up
	xor a
	ldh [rWY], a
	ldh [hWY], a
	call VermilionDock_EraseSSAnne
	ld a, $90
	ldh [hWY], a
	ld a, $1
	ld [wUpdateSpritesEnabled], a
	pop hl
	pop bc
	ld [hl], b
	dec hl
	ld [hl], c
	call LoadPlayerSpriteGraphics
	ld hl, wNumberOfWarps
	dec [hl]
	ret

VermilionDock_AnimSmokePuffDriftRight:
	push bc
	push de
	ld hl, wShadowOAMSprite04XCoord
	ld a, [wSSAnneSmokeDriftAmount]
	swap a
	ld c, a
	ld de, OBJ_SIZE
.drift_loop
	inc [hl]
	inc [hl]
	add hl, de
	dec c
	jr nz, .drift_loop
	pop de
	pop bc
	ret

VermilionDock_EmitSmokePuff:
; new smoke puff above the S.S. Anne's front smokestack
	ld a, [wSSAnneSmokeX]
	sub 16
	ld [wSSAnneSmokeX], a
	ld c, a
	ld b, 100 ; Y
	ld a, [wSSAnneSmokeDriftAmount]
	inc a
	ld [wSSAnneSmokeDriftAmount], a
	ld a, $1
	ld de, VermilionDockOAMBlock
	call WriteOAMBlock
	ret

VermilionDockOAMBlock:
; tile ID, attributes
	db $fc, OAM_PAL1
	db $fd, OAM_PAL1
	db $fe, OAM_PAL1
	db $ff, OAM_PAL1

VermilionDock_SyncScrollWithLY:
	ld h, d
	ld l, $50
	call .sync_scroll_ly
	ld h, $0
	ld l, $80
.sync_scroll_ly
	ldh a, [rLY]
	cp l
	jr nz, .sync_scroll_ly
	ld a, h
	ldh [rSCX], a
.wait_for_ly_match
	ldh a, [rLY]
	cp h
	jr z, .wait_for_ly_match
	ret

VermilionDock_EraseSSAnne:
; Fill the area the S.S. Anne occupies in BG map 0 with water tiles.
	ld hl, wVermilionDockTileMapBuffer
	ld bc, wVermilionDockTileMapBufferEnd - wVermilionDockTileMapBuffer
	ld a, $14 ; water tile
	call FillMemory
	hlbgcoord 0, 10
	ld de, wVermilionDockTileMapBuffer
	lb bc, BANK(wVermilionDockTileMapBuffer), 12
	call CopyVideoData

; Replace the blocks of the lower half of the ship with water blocks. This
; leaves the upper half alone, but that doesn't matter because replacing any of
; the blocks is unnecessary because the blocks the ship occupies are south of
; the player and won't be redrawn when the player automatically walks north and
; exits the map. This code could be removed without affecting anything.
	hlowcoord 5, 2, VERMILION_DOCK_WIDTH
	ld a, $d ; water block
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a

	ld a, SFX_SS_ANNE_HORN
	call PlaySound
	ld c, 120
	call DelayFrames
	ret

VermilionDock_TextPointers:
	def_text_pointers
	dw_const VermilionDockUnusedText, TEXT_VERMILIONDOCK_UNUSED
	dw_const VermilionDockMewText,    TEXT_VERMILIONDOCK_MEW

VermilionDockUnusedText:
	text_far _VermilionDockUnusedText
	text_end

VermilionDockTrainerHeaders:
	def_trainers
MewTrainerHeader:
	trainer EVENT_ENCOUNTERED_MEW, 0, MewBattleText, MewBattleText, MewBattleText
	db -1 ; end

VermilionDockMewText:
	text_asm
	ld hl, MewTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

MewBattleText:
	text_far _MewtwoBattleText ; Mew!
	text_asm
	ld a, MEW
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

TruckOAMTable_Left:
	db $50, $28, $C0, $10
	db $50, $30, $C1, $10
	db $50, $38, $C2, $10
	db $50, $40, $C3, $10
	db $58, $28, $C4, $10
	db $58, $30, $C5, $10
	db $58, $38, $C6, $10
	db $58, $40, $C7, $10
	
TruckOAMTable_Right:
	db $50, $58, $C0, $10
	db $50, $60, $C1, $10
	db $50, $68, $C2, $10
	db $50, $70, $C3, $10
	db $58, $58, $C4, $10
	db $58, $60, $C5, $10
	db $58, $68, $C6, $10
	db $58, $70, $C7, $10

RedLeftOAMTable:
	db $8,$0,$9,$0
	db $a,$2,$b,$3
	
RedRightOAMTable:
	db $8,$20,$9,$20
	db $a,$22,$b,$23

TruckSpriteGFX: INCBIN  "gfx/sprites/truck_sprite.2bpp"
TruckWhiteGFX: INCBIN  "gfx/sprites/truck_white.2bpp"

NoTruckAction:
	ld hl, wCurrentMapScriptFlags
	res 7, [hl]
	ret

TruckCheck:
	CheckEventHL EVENT_FOUND_MEW
	jp nz, ChangeTruckTile
	ld hl, wCurrentMapScriptFlags
	res 5, [hl]
	ld c, VERMILION_DOCK_MEW
	ld b, $2
	ld hl, wToggleableObjectFlags
	predef FlagActionPredef
	ld a, c
	and a
	jr nz, .skiphidingmew
	ld a, VERMILION_DOCK_MEW
	ld [wToggleableObjectIndex], a
	predef HideObject
.skiphidingmew
	ld a, [wStatusFlags1]
	bit 0, a ; using Strength?
	jr z, NoTruckAction
	; check Y == 0
	ld hl, wYCoord
	ld a, [hli]
	and a
	jr nz, NoTruckAction

	ld a, [hl]        ; X coord
	cp 22             ; truck right
	jr z, .fromRight
	cp 19             ; truck left
	jr z, .fromLeft
	jr NoTruckAction
	; if the player is trying to walk left
.fromRight
	ld a, [wPlayerMovingDirection]
	bit PLAYER_DIR_BIT_LEFT, a
	jr z, NoTruckAction
	ld hl, wCurrentMapScriptFlags
	bit 7, [hl]
	set 7, [hl] ; wait until the next time the player presses left
	ret z
	ldh a, [hJoyHeld]
	bit B_PAD_LEFT, a	
	ret z
	res 7, [hl]
	call PushTruckLeft
	ret
	
.fromLeft
	ld a, [wPlayerMovingDirection]
	bit PLAYER_DIR_BIT_RIGHT, a
	jr z, NoTruckAction
	ld hl, wCurrentMapScriptFlags
	bit 7, [hl]
	set 7, [hl] ; wait until the next time the player presses right
	ret z
	ldh a, [hJoyHeld]
	bit B_PAD_RIGHT, a
	ret z
	res 7, [hl]
	call PushTruckRight
	ret

PushTruckLeft:
	ld a, $ff
	ld [wJoyIgnore], a
	ld [wUpdateSpritesEnabled], a
	; make it look like the player bumped into the truck
	call VermilionDockRedLeftAnimate
	xor a
	ld bc, (Bank(TruckSpriteGFX) << 8) | 8
	ld hl, vChars1 + $400
	ld de, TruckSpriteGFX
	call CopyVideoData
	; new: white background truck
	xor a
    ld bc, (Bank(TruckWhiteGFX) << 8) | 8
    ld hl, vChars1 + $480 ; Tile $C8
    ld de, TruckWhiteGFX
    call CopyVideoData
	ld hl, TruckOAMTable_Left
	ld bc, $20
	ld de, wShadowOAM + $20
	call CopyData
	ld hl, TruckOAMTable_Left
    ld bc, $20
    ld de, wShadowOAM + $40 ; below truck white sprite
    call CopyData
	ld hl, wShadowOAM + $40 + 2 ; First byte of Tile ID of first sprite of 2nd layer
    ld d, 8
.setWhiteTilesLoop
	ld a, [hl]
    add 8
    ld [hl], a
    inc hl
    ld a, [hl]
    res 4, a
    ld [hl], a 
    ld bc, 3
    add hl, bc
    dec d
    jr nz, .setWhiteTilesLoop
	ld a, $c
	ld [wNewTileBlockID], a ; used to be wd09f
	ld bc, $a
	predef ReplaceTileBlock
; moving the truck
    ld a, SFX_PUSH_BOULDER
    call PlaySound
    ld b, 32
.movingtruck
    ; Move top layer (8 sprites)
    ld hl, wShadowOAM + $21 ; X coordinate
    ld a, 8
    ld de, 4
.moveTop
    dec [hl]
    add hl, de
    dec a
    jr nz, .moveTop
    ; Move bottom layer (8 sprites)
    ld hl, wShadowOAM + $41 ; X coordinate
    ld a, 8
    ld de, 4
.moveBottom
    dec [hl]
    add hl, de
    dec a
    jr nz, .moveBottom
    ld c, 2
    call DelayFrames
    dec b
    jr nz, .movingtruck
	ld a, $3
    ld [wNewTileBlockID], a
    ld bc, $9
    predef ReplaceTileBlock
	call UpdateSprites
    ld a, 1
    ldh [hAutoBGTransferEnabled], a
    call Delay3
; Hide OAM sprites after moving
    ld hl, wShadowOAM + $20
    ld d, $10
    ld e, 4
    xor a
.hideSpritesLoop
    ld [hl], 160
    inc hl
    ld [hl], 0
    inc hl
    ld [hl], 0
    inc hl
    ld [hl], 0
    inc hl
    dec d
    jr nz, .hideSpritesLoop
	SetEvent EVENT_FOUND_MEW
	ResetEvent EVENT_TRUCK_PUSHED_RIGHT
	xor a
    ldh [hAutoBGTransferEnabled], a
    call Delay3
	callfar RedrawMapView
	callfar AnimateBoulderDust
	call ShowMew
	ld c, 20
	call DelayFrames
	xor a
	ld [wJoyIgnore], a
	ret

PushTruckRight:
	ld a, $ff
	ld [wJoyIgnore], a
	ld [wUpdateSpritesEnabled], a
	; make it look like the player bumped into the truck
	call VermilionDockRedLeftAnimate
	xor a
	ld bc, (Bank(TruckSpriteGFX) << 8) | 8
	ld hl, vChars1 + $400
	ld de, TruckSpriteGFX
	call CopyVideoData
	; new: white background truck
	xor a
    ld bc, (Bank(TruckWhiteGFX) << 8) | 8
    ld hl, vChars1 + $480 ; Tile $C8
    ld de, TruckWhiteGFX
    call CopyVideoData
	ld hl, TruckOAMTable_Right
	ld bc, $20
	ld de, wShadowOAM + $20
	call CopyData
	ld hl, TruckOAMTable_Right
    ld bc, $20
    ld de, wShadowOAM + $40 ; below truck white sprite
    call CopyData
	ld hl, wShadowOAM + $40 + 2 ; First byte of Tile ID of first sprite of 2nd layer
    ld d, 8
.setWhiteTilesLoop
	ld a, [hl]
    add 8
    ld [hl], a
    inc hl
    ld a, [hl]
    res 4, a
    ld [hl], a 
    ld bc, 3
    add hl, bc
    dec d
    jr nz, .setWhiteTilesLoop
	ld a, $c
	ld [wNewTileBlockID], a ; used to be wd09f
	ld bc, $a
	predef ReplaceTileBlock
; moving the truck
    ld a, SFX_PUSH_BOULDER
    call PlaySound
    ld b, 32
.movingtruck
    ; Move top layer (8 sprites)
    ld hl, wShadowOAM + $21 ; X coordinate
    ld a, 8
    ld de, 4
.moveTop
    inc [hl]
    add hl, de
    dec a
    jr nz, .moveTop
    ; Move bottom layer (8 sprites)
    ld hl, wShadowOAM + $41 ; X coordinate
    ld a, 8
    ld de, 4
.moveBottom
    inc [hl]
    add hl, de
    dec a
    jr nz, .moveBottom
    ld c, 2
    call DelayFrames
    dec b
    jr nz, .movingtruck
	ld a, $3
    ld [wNewTileBlockID], a
    ld bc, $b
    predef ReplaceTileBlock
	call UpdateSprites
    ld a, 1
    ldh [hAutoBGTransferEnabled], a
    call Delay3
; Hide OAM sprites after moving
    ld hl, wShadowOAM + $20
    ld d, $10
    ld e, 4
    xor a
.hideSpritesLoop
    ld [hl], 160
    inc hl
    ld [hl], 0
    inc hl
    ld [hl], 0
    inc hl
    ld [hl], 0
    inc hl
    dec d
    jr nz, .hideSpritesLoop
	SetEvent EVENT_FOUND_MEW
	SetEvent EVENT_TRUCK_PUSHED_RIGHT
	xor a
    ldh [hAutoBGTransferEnabled], a
    call Delay3
	callfar RedrawMapView
	callfar AnimateBoulderDust
	call ShowMew
	ld c, 20
	call DelayFrames
	xor a
	ld [wJoyIgnore], a
	ret

ShowMew:	
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	ld a, TOGGLE_MEW
	ld [wToggleableObjectIndex], a
	predef ShowObject
	call CorruptMewAudio
	ret
	
CorruptMewAudio:
    ld a, $44
    ld [wChannel1VibratoRate], a
    ld a, $0A
    ld [wChannel1VibratoExtent], a
    ld hl, wChannel1Flags2
    set 0, [hl]

    ld a, $33
    ld [wChannel2VibratoRate], a
    ld a, $0C
    ld [wChannel2VibratoExtent], a
    ld hl, wChannel2Flags2
    set 0, [hl]

    ret

ChangeTruckTile:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	res 7, [hl]
	ret z
	CheckEvent EVENT_TRUCK_PUSHED_RIGHT
    jr nz, .pushedRight
	
.pushedLeft
	ld bc, $9
	call GetOWCoord
	ld a, [hl]
	cp $3
	jr z, .checkMew
	ld a, $3
	ld [hli], a
	ld [hl], $c
	jr .checkMew

.pushedRight	
	ld bc, $9
    call GetOWCoord
    ld a, $c
    ld [hli], a
    ld [hl], $c

    ld bc, $b
    call GetOWCoord
    ld a, [hl]
    cp $3
    jr z, .checkMew
    ld a, $3
    ld [hli], a
    ld [hl], $c

.checkMew
	CheckEvent EVENT_ENCOUNTERED_MEW
	call z, ShowMew
	jpfar RedrawMapView

GetOWCoord:
	ld hl, wOverworldMap + 2
	ld a, [wCurMapWidth]
	add $6
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	inc b
	inc c
.bloop
	add hl, de
	dec b
	jr nz, .bloop
.cloop
	inc hl
	dec c
	jr nz, .cloop
	ret

VermilionDockRedLeftAnimate:
	ld a, [wWalkBikeSurfState]
	ld de, RedSprite tile 20
	lb bc, BANK(RedSprite), 4
	and a
	jr z, .load
	ld de, RedBikeSprite tile 20
	lb bc, BANK(RedBikeSprite), 4
.load
	ld hl, vSprites tile 8
	call CopyVideoData
	ld c, 10
	call DelayFrames
	ld a, [wWalkBikeSurfState]
	ld de, RedSprite tile 8
	lb bc, BANK(RedSprite), 4
	and a
	jr z, .load2
	ld de, RedBikeSprite tile 8
	lb bc, BANK(RedBikeSprite), 4
.load2
	ld hl, vSprites tile 8
	jp CopyVideoData
