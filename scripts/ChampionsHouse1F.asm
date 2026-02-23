ChampionsHouse1F_Script:
	jp EnableAutoTextBoxDrawing

ChampionsHouse1F_TextPointers:
	def_text_pointers
	dw_const ChampionsHouse1FDaisyText, TEXT_CHAMPIONSHOUSE1F_DAISY
	dw_const ChampionsHouse1FOakText,   TEXT_CHAMPIONSHOUSE1F_OAK
	dw_const ChampionsHouse1FMomText,   TEXT_CHAMPIONSHOUSE1F_MOM
	dw_const ChampionsHouse1FRivalText, TEXT_CHAMPIONSHOUSE1F_RIVAL
	dw_const ChampionsHouse1FBillText,  TEXT_CHAMPIONSHOUSE1F_BILL
	dw_const ChampionsHouse1FBirdText,  TEXT_CHAMPIONSHOUSE1F_BIRD
	dw_const ChampionsHouse1FTVText,    TEXT_CHAMPIONSHOUSE1F_TV

ChampionsHouse1FMomText:
	text_far _ChampionsHouse1FMomText
	text_end

ChampionsHouse1FOakText:
	text_far _ChampionsHouse1FOakText
	text_end

ChampionsHouse1FRivalText:
	text_far _ChampionsHouse1FRivalText
	text_end
	
ChampionsHouse1FDaisyText:
	text_far _ChampionsHouse1FDaisyText
	text_end
	
ChampionsHouse1FBillText:
	text_far _ChampionsHouse1FBillText
	text_end
	
ChampionsHouse1FBirdText:
	text_asm
	ld hl, _ChampionsHouse1FBirdText
	call PrintText
;	CheckEvent EVENT_GOT_CHAMPIONS_HOUSE_BIRD_GIFT
;	jr nz, .alreadyGotItem
	lb bc, RARE_CANDY, 1
	call GiveItem
	jr nc, .bagFull
;	SetEvent EVENT_GOT_CHAMPIONS_HOUSE_BIRD_GIFT
	ld hl, _ChampionsHouse1FBirdGaveItemText
	call PrintText
	jr .done
.bagFull
	ld hl, _ChampionsHouse1FBirdBagFullText
	call PrintText
	jr .done
.alreadyGotItem
	ld hl, _ChampionsHouse1FBirdDoneText
	call PrintText
.done
	jp TextScriptEnd

ChampionsHouse1FTVText:
	text_asm
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ld hl, .WrongSideText
	jr nz, .got_text
	ld hl, .StandByMeMovieText
.got_text
	call PrintText
	jp TextScriptEnd

.StandByMeMovieText:
	text_far _ChampionsHouse1FTVStandByMeMovieText
	text_end

.WrongSideText:
	text_far _ChampionsHouse1FTVWrongSideText
	text_end
