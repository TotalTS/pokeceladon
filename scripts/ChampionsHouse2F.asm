ChampionsHouse2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, ChampionsHouse2F_ScriptPointers
	ld a, [wChampionsHouse2FCurScript]
	jp CallFunctionInTable

ChampionsHouse2F_ScriptPointers:
	def_script_pointers
	dw_const ChampionsHouse2FDefaultScript, SCRIPT_CHAMPIONSHOUSE2F_DEFAULT
	dw_const ChampionsHouse2FNoopScript,    SCRIPT_CHAMPIONSHOUSE2F_NOOP

ChampionsHouse2FDefaultScript:
	xor a
	ldh [hJoyHeld], a
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	ld a, SCRIPT_CHAMPIONSHOUSE2F_NOOP
	ld [wChampionsHouse2FCurScript], a
	ret

ChampionsHouse2FNoopScript:
	ret

ChampionsHouse2F_TextPointers:
	def_text_pointers
	dw_const ChampionsHouse2FCupText,          TEXT_CHAMPIONSHOUSE2F_CUP
	dw_const ChampionsHouse2FPikachuDollText,  TEXT_CHAMPIONSHOUSE2F_PIKACHUDOLL
	dw_const ChampionsHouse2FPC,               TEXT_CHAMPIONSHOUSE2F_PC
	dw_const ChampionsHouse2FSNES,             TEXT_CHAMPIONSHOUSE2F_SNES

ChampionsHouse2FPC:
	db TX_SCRIPT_POKECENTER_PC

ChampionsHouse2FSNES:
	text_far _RedBedroomSNESText
	text_end

ChampionsHouse2FCupText:
	text_far _ChampionsHouse2FCupText
	text_end

ChampionsHouse2FPikachuDollText:
	text_far _ChampionsHouse2FPikachuDollText
	text_end
