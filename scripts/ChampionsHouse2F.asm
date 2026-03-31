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
	ret

ChampionsHouse2F_TextPointers:
	def_text_pointers
	dw_const ChampionsHouse2FCupText,             TEXT_CHAMPIONSHOUSE2F_CUP
;	dw_const ChampionsHouse2FPikachuDollText,     TEXT_CHAMPIONSHOUSE2F_PIKACHUDOLL
;	dw_const ChampionsHouse2FBallText,            TEXT_CHAMPIONSHOUSE2F_BALL
	dw_const ChampionsHouse2FCharmanderDollText,  TEXT_CHAMPIONSHOUSE2F_CHARMANDERDOLL
	dw_const ChampionsHouse2FSquirtleDollText,    TEXT_CHAMPIONSHOUSE2F_SQUIRTLEDOLL
	dw_const ChampionsHouse2FBulbasaurDollText,   TEXT_CHAMPIONSHOUSE2F_BULBASAURDOLL
	dw_const ChampionsHouse2FGameboyText,         TEXT_CHAMPIONSHOUSE2F_GAMEBOY
	
ChampionsHouse2FGameboyText:
	text_far _ChampionsHouse2FGameboyText
	text_end

ChampionsHouse2FCupText:
	text_far _FuchsiaCityPokemonText
	text_end

ChampionsHouse2FPikachuDollText:
	text_far _ChampionsHouse2FPikachuDollText
	text_end
	
ChampionsHouse2FBallText:
	text_far _FuchsiaCityPokemonText
	text_end

ChampionsHouse2FCharmanderDollText:
	text_far _FuchsiaCityPokemonText
	text_end

ChampionsHouse2FSquirtleDollText:
	text_far _FuchsiaCityPokemonText
	text_end

ChampionsHouse2FBulbasaurDollText:
	text_far _FuchsiaCityPokemonText
	text_end
