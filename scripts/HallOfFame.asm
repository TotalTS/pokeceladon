HallOfFame_Script:
	call EnableAutoTextBoxDrawing
	ld hl, HallOfFame_ScriptPointers
	ld a, [wHallOfFameCurScript]
	jp CallFunctionInTable

HallofFameRoomClearScripts: ; unreferenced
	xor a
	ld [wJoyIgnore], a
	ld [wHallOfFameCurScript], a
	ret

HallOfFame_ScriptPointers:
	def_script_pointers
	dw_const HallOfFameDefaultScript,            SCRIPT_HALLOFFAME_DEFAULT
	dw_const HallOfFameOakCongratulationsScript, SCRIPT_HALLOFFAME_OAK_CONGRATULATIONS
	dw_const HallOfFameResetEventsAndSaveScript, SCRIPT_HALLOFFAME_RESET_EVENTS_AND_SAVE
	dw_const HallOfFameNoopScript,               SCRIPT_HALLOFFAME_NOOP
	dw_const InitOakBattle,                      SCRIPT_INIT_OAK_BATTLE
	dw_const InitOakBattle2,                     SCRIPT_INIT_OAK_BATTLE2
	dw_const AfterOakBattle,                     SCRIPT_AFTER_OAK_BATTLE
	dw_const AfterOakBattle2,                    SCRIPT_AFTER_OAK_BATTLE2

HallOfFameNoopScript:
	ret

HallOfFameResetEventsAndSaveScript:
	call Delay3
	ld a, [wLetterPrintingDelayFlags]
	push af
	xor a
	ld [wJoyIgnore], a
	predef HallOfFamePC
	pop af
	ld [wLetterPrintingDelayFlags], a
	ld hl, wStatusFlags7
	res BIT_NO_MAP_MUSIC, [hl]
	ASSERT wStatusFlags7 + 1 == wElite4Flags
	inc hl
	set BIT_UNUSED_BEAT_ELITE_4, [hl] ; unused
	xor a ; SCRIPT_*_DEFAULT
	ld hl, wLoreleisRoomCurScript
	ld [hli], a ; wLoreleisRoomCurScript
	ld [hli], a ; wBrunosRoomCurScript
	ld [hl], a ; wAgathasRoomCurScript
	ld [wLancesRoomCurScript], a
	ld [wHallOfFameCurScript], a
	; Elite 4 events
	ResetEvent EVENT_SS_ANNE_LEFT
	ResetEventRange INDIGO_PLATEAU_EVENTS_START, INDIGO_PLATEAU_EVENTS_END, 1
	xor a
	ld [wHallOfFameCurScript], a
	ld a, PALLET_TOWN
	ld [wLastBlackoutMap], a
	farcall SaveGameData
	ld b, 5
.delayLoop
	ld c, 600 / 5
	call DelayFrames
	dec b
	jr nz, .delayLoop
	call WaitForTextScrollButtonPress
	jp Init

HallOfFameDefaultScript:
	ld hl, wPokedexOwned ; Pokedex
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wPokedexNum]
	cp 151 ; Catch all 151 or riot!
	jr c, .skip
	ld a, $ff
	ld [wJoyIgnore], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RLEMovementOakBattle
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $4
	ld [wHallOfFameCurScript], a
	ret
.skip
	ld hl, wSimulatedJoypadStatesEnd
	ld de, HallOfFameEntryMovement
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $1
	ld [wHallOfFameCurScript], a
	ret

HallOfFameEntryMovement:
	db PAD_UP, 5
	db -1 ; end
	
RLEMovementOakBattle:
	db PAD_UP, 3, $ff

MovementData_OakBattle:
	db 0, 0, $ff
	
MovementData_OakBattle2:
	db $40, $40, $ff

HallOfFameOakCongratulationsScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	ld a, HALLOFFAME_OAK
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld a, SPRITE_FACING_LEFT
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	call Delay3
	xor a
	ld [wJoyIgnore], a
	inc a ; PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	ld a, TEXT_HALLOFFAME_OAK
	ldh [hTextID], a
	call DisplayTextID
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, TOGGLE_CERULEAN_CAVE_GUY
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, SCRIPT_HALLOFFAME_RESET_EVENTS_AND_SAVE
	ld [wHallOfFameCurScript], a
	ret

InitOakBattle:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $1
	ld [hSpriteIndex], a
	ld de, MovementData_OakBattle
	call MoveSprite
	ld a, $5
	ld [wHallOfFameCurScript], a
	ret
	
InitOakBattle2:
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, [wStatusFlags5]
	and a
	ret nz
	ld a, $fc
	ld [wJoyIgnore], a
	call RedOakFace2Face
	ld [wJoyIgnore], a
	ld a, $2
	ld [hTextID], a
	call DisplayTextID
	call Delay3
	ld hl, wStatusFlags3
    set BIT_TALKED_TO_TRAINER, [hl]
    set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, OakVictorySpeech
	ld de, OakVictorySpeech
	call SaveEndBattleTextPointers
	ld a, PROF_OAK + $c8
	ld [wCurOpponent], a
	
	; select which team to use during the encounter
	ld a, [wRivalStarter]
	cp STARTER2
	jr nz, .NotStarter2
	ld a, $2
	jr .saveTrainerId
.NotStarter2
	cp STARTER3
	jr nz, .NotStarter3
	ld a, $3
	jr .saveTrainerId
.NotStarter3
	ld a, $1
.saveTrainerId
	ld [wTrainerNo], a

	xor a
	ld [hJoyHeld], a
	ld a, SCRIPT_AFTER_OAK_BATTLE
	ld [wHallOfFameCurScript], a
	ret
	
AfterOakBattle:
	ld a, [wIsInBattle]
	cp $ff
	jp nz, .theend
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_AFTER_OAK_BATTLE2
	ld [wHallOfFameCurScript], a
	ret
.theend
	farcall Music_Cities1AlternateTempo
	call UpdateSprites ; move sprites
	ld a, $ff
	ld [wJoyIgnore], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RLEMovementOakBattle
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $1
	ld [hSpriteIndex], a
	ld de, MovementData_OakBattle2
	call MoveSprite
	ld a, $7
	ld [wHallOfFameCurScript], a
	ret
	
AfterOakBattle2:
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, [wSimulatedJoypadStatesIndex]
	ld b, a
	ld a, [wStatusFlags5]
	or b
	ret nz
	call RedOakFace2Face
	ld a, $1
	ld [wHallOfFameCurScript], a
	ret
	
RedOakFace2Face:
	ld a, $0
	ld [hSpriteIndex], a
	ld a, $c
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirection
	ld a, $1
	ld [hSpriteIndex], a
	ld a, $8
	ld [hSpriteFacingDirection], a
	jp SetSpriteFacingDirectionAndDelay

HallOfFame_TextPointers:
	def_text_pointers
	dw_const HallOfFameOakText, TEXT_HALLOFFAME_OAK
	dw_const OakPreBattleText, TEXT_PREBATTLE_OAK

HallOfFameOakText:
	text_far _HallOfFameOakText
	text_end

OakPreBattleText:
	text_asm
	ld hl, OakPreBattleText1
	call PrintText
	call GBFadeOutToWhite
	call ReloadMapData
	predef HealParty
	ld a, MUSIC_PKMN_HEALED
;	ld [wNewSoundID], a
	call PlayMusic

	call WaitForSongToFinish
;.next
;	ld a, [wChannelSoundIDs]
;	cp MUSIC_PKMN_HEALED
;	jr z, .next

;	ld a, [wMapMusicSoundID]
;	ld [wNewSoundID], a
	farcall Music_Cities1AlternateTempo
	call GBFadeInFromWhite
	ld hl, OakPreBattleText2
	call PrintText
	jp TextScriptEnd
	
OakPreBattleText1:
	text_far _OakPreBattleText1
	text_end
	
OakPreBattleText2:
	text_far _OakPreBattleText2
	text_end
	
OakVictorySpeech:
	text_far _OakVictorySpeech
	text_end
