PrintRedSNESText:
	call EnableAutoTextBoxDrawing
	tx_pre_jump RedBedroomSNESText

RedBedroomSNESText::
	text_far _RedBedroomSNESText
	text_end

OpenRedsPC:
	call EnableAutoTextBoxDrawing
	tx_pre_jump RedBedroomPCText

RedBedroomPCText::
	script_players_pc

PrintChampionCupText:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump ChampionsHouseCupText

ChampionsHouseCupText::
	text_far _ChampionsHouse2FCupText
	text_end
