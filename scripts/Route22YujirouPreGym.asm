Route22YujirouPreGym_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route22YujirouTrainerHeaders
	ld de, Route22YujirouPreGym_ScriptPointers
	ld a, [wRoute22YujirouPreGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute22YujirouPreGymCurScript], a
	ret

Route22YujirouPreGymResetScripts:
	xor a
	ld [wJoyIgnore], a
	ld [wRoute22YujirouPreGymCurScript], a
	ld [wCurMapScript], a
	ret

Route22YujirouPreGym_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE22YUJIROU_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE22YUJIROU_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE22YUJIROU_END_BATTLE
	dw_const Route22YujirouPostBattle,              SCRIPT_ROUTE22YUJIROU_POST_BATTLE
	
Route22YujirouTrainerHeaders:
	def_trainers
Route22YujirouTrainerHeader0:
	trainer EVENT_BEAT_YUJIROU_PRE_GYM, 0, YujirouPreBattleText, YujirouEndBattleText, YujirouPostBattleAdviceText
	db -1

Route22YujirouPostBattle:
	ld a, [wIsInBattle]
	cp $ff
	jp z, Route22YujirouPreGymResetScripts
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
; fallthrough
Route22YujirouScriptReceiveTM19:
	ld a, TEXT_ROUTE22YUJIROU_WAIT_TAKE_THIS
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_YUJIROU_PRE_GYM
	lb bc, TM_SEISMIC_TOSS, 1
	call GiveItem
	jr nc, .BagFull
	ld a, TEXT_ROUTE22YUJIROU_RECEIVED_TM19
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM19
	jr .battleVictory
.BagFull
	ld a, TEXT_ROUTE22YUJIROU_TM19_NO_ROOM
	ldh [hTextID], a
	call DisplayTextID
.battleVictory
	jp Route22YujirouPreGymResetScripts

Route22YujirouPreGym_TextPointers:
	def_text_pointers
	dw_const Route22YujirouText,             TEXT_ROUTE22YUJIROU_YUJIROU
	dw_const YujirouWaitTakeThisText,        TEXT_ROUTE22YUJIROU_WAIT_TAKE_THIS
	dw_const YujirouReceivedTM19Text,        TEXT_ROUTE22YUJIROU_RECEIVED_TM19
	dw_const YujirouTM19NoRoomText,          TEXT_ROUTE22YUJIROU_TM19_NO_ROOM

Route22YujirouText:
	text_asm
	CheckEvent EVENT_BEAT_YUJIROU_PRE_GYM
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM19
	jr nz, .afterBeat
	call z, Route22YujirouScriptReceiveTM19
	call DisableWaitingAfterTextDisplay
	jr .done
.afterBeat
	ld hl, YujirouPostBattleAdviceText
	call PrintText
	jr .done
.beforeBeat
	ld hl, YujirouPreBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, YujirouEndBattleText
	ld de, YujirouEndBattleText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, 1
	ld [wTrainerNo], a
	ld a, $1
	ld [wGymLeaderNo], a
	xor a
	ldh [hJoyHeld], a
	ld a, SCRIPT_ROUTE22YUJIROU_POST_BATTLE
	ld [wRoute22YujirouPreGymCurScript], a
	ld [wCurMapScript], a
.done
	jp TextScriptEnd
	
YujirouPreBattleText:
	text_far _YujirouPreBattleText
	text_end

YujirouPostBattleAdviceText:
	text_far _YujirouPostBattleAdviceText
	text_end

YujirouWaitTakeThisText:
	text_far _YujirouWaitTakeThisText
	text_end

YujirouReceivedTM19Text:
	text_far _YujirouReceivedTM19Text
	sound_get_item_1
	text_far _YujirouTM19ExplanationText
	text_end

YujirouTM19NoRoomText:
	text_far _YujirouTM19NoRoomText
	text_end

YujirouEndBattleText:
	text_far _YujirouEndBattleText
	text_end
