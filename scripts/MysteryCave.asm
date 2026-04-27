MysteryCave_Script:
	call EnableAutoTextBoxDrawing
	ld hl, MysteryCaveTrainerHeaders
	ld de, MysteryCave_ScriptPointers
	ld a, [wMysteryCaveCurScript]
	call ExecuteCurMapScriptInTable
	ld [wMysteryCaveCurScript], a
	ret

MysteryCave_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,                SCRIPT_MYSTERYCAVE_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle,   SCRIPT_MYSTERYCAVE_START_BATTLE
	dw_const EndTrainerBattle,                        SCRIPT_MYSTERYCAVE_END_BATTLE

MysteryCave_TextPointers:
	def_text_pointers
	dw_const MysteryCaveSuperNerdText,         TEXT_MYSTERYCAVE_SUPER_NERD
	dw_const MysteryCaveBlackbeltText,         TEXT_MYSTERYCAVE_BLACKBELT
	dw_const MysteryCaveRookie1Text,           TEXT_MYSTERYCAVE_ROOKIE1
	dw_const MysteryCaveRookie2Text,           TEXT_MYSTERYCAVE_ROOKIE2
	dw_const MysteryCaveBlackbelt1Text,        TEXT_MYSTERYCAVE_BLACKBELT1
	dw_const MysteryCaveBeauty1Text,           TEXT_MYSTERYCAVE_BEAUTY1
	dw_const MysteryCaveCooltrainerF1Text,     TEXT_MYSTERYCAVE_COOLTRAINER_F1

MysteryCaveTrainerHeaders:
	def_trainers
MysteryCaveTrainerHeader0:
	trainer EVENT_BEAT_MYSTERYCAVE_ROOKIE1_TRAINER_0, 2, MysteryCaveRookie1BattleText, MysteryCaveRookie1EndBattleText, MysteryCaveRookie1AfterBattleText
MysteryCaveTrainerHeader1:
	trainer EVENT_BEAT_MYSTERYCAVE_ROOKIE2_TRAINER_1, 1, MysteryCaveRookie2BattleText, MysteryCaveRookie2EndBattleText, MysteryCaveRookie2AfterBattleText
MysteryCaveTrainerHeader2:
	trainer EVENT_BEAT_MYSTERYCAVE_BLACKBELT1_TRAINER_2, 2, MysteryCaveBlackbelt1BattleText, MysteryCaveBlackbelt1EndBattleText, MysteryCaveBlackbelt1AfterBattleText
MysteryCaveTrainerHeader3:
	trainer EVENT_BEAT_MYSTERYCAVE_BEAUTY1_TRAINER_3, 2, MysteryCaveBeauty1BattleText, MysteryCaveBeauty1EndBattleText, MysteryCaveBeauty1AfterBattleText
MysteryCaveTrainerHeader4:
	trainer EVENT_BEAT_MYSTERYCAVE_COOLTRAINER_F1_TRAINER_4, 2, MysteryCaveCooltrainerF1BattleText, MysteryCaveCooltrainerF1EndBattleText, MysteryCaveCooltrainerF1AfterBattleText
	db -1 ; end

MysteryCaveSuperNerdText:
	text_far _HandleMysteryCaveSuperNerdText
	text_end

MysteryCaveBlackbeltText:
	text_far _HandleMysteryCaveBlackbeltText
	text_end

MysteryCaveRookie1Text:
	text_asm
	ld hl, MysteryCaveTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

MysteryCaveRookie1BattleText:
	text_far _MysteryCaveRookie1BattleText
	text_end

MysteryCaveRookie1EndBattleText:
	text_far _MysteryCaveRookie1EndBattleText
	text_end

MysteryCaveRookie1AfterBattleText:
	text_far _MysteryCaveRookie1AfterBattleText
	text_end

MysteryCaveRookie2Text:
	text_asm
	ld hl, MysteryCaveTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

MysteryCaveRookie2BattleText:
	text_far _MysteryCaveRookie2BattleText
	text_end

MysteryCaveRookie2EndBattleText:
	text_far _MysteryCaveRookie2EndBattleText
	text_end

MysteryCaveRookie2AfterBattleText:
	text_far _MysteryCaveRookie2AfterBattleText
	text_end

MysteryCaveBlackbelt1Text:
	text_asm
	ld hl, MysteryCaveTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

MysteryCaveBlackbelt1BattleText:
	text_far _MysteryCaveBlackbelt1BattleText
	text_end

MysteryCaveBlackbelt1EndBattleText:
	text_far _MysteryCaveBlackbelt1EndBattleText
	text_end

MysteryCaveBlackbelt1AfterBattleText:
	text_far _MysteryCaveBlackbelt1AfterBattleText
	text_end

MysteryCaveBeauty1Text:
	text_asm
	ld hl, MysteryCaveTrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

MysteryCaveBeauty1BattleText:
	text_far _MysteryCaveBeauty1BattleText
	text_end

MysteryCaveBeauty1EndBattleText:
	text_far _MysteryCaveBeauty1EndBattleText
	text_end

MysteryCaveBeauty1AfterBattleText:
	text_far _MysteryCaveBeauty1AfterBattleText
	text_end

MysteryCaveCooltrainerF1Text:
	text_asm
	ld hl, MysteryCaveTrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

MysteryCaveCooltrainerF1BattleText:
	text_far _MysteryCaveCooltrainerF1BattleText
	text_end

MysteryCaveCooltrainerF1EndBattleText:
	text_far _MysteryCaveCooltrainerF1EndBattleText
	text_end

MysteryCaveCooltrainerF1AfterBattleText:
	text_far _MysteryCaveCooltrainerF1AfterBattleText
	text_end
