ChampionsHouse1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z

	ResetEvent EVENT_GOT_CHAMPIONS_HOUSE_BIRD_GIFT
	call Random
	cp 50
	ld a, TOGGLE_CHAMPIONSHOUSE1F_DAISY
	jr nc, .hideDaisy
	ld [wToggleableObjectIndex], a
	predef ShowObject
	jr .checkOak
.hideDaisy
	ld [wToggleableObjectIndex], a
	predef HideObject
.checkOak
	call Random
	cp 38
	ld a, TOGGLE_CHAMPIONSHOUSE1F_OAK
	jr nc, .hideOak
	ld [wToggleableObjectIndex], a
	predef ShowObject
	jr .checkMom
.hideOak
	ld [wToggleableObjectIndex], a
	predef HideObject
.checkMom
	call Random
	cp 25
	ld a, TOGGLE_CHAMPIONSHOUSE1F_MOM
	jr nc, .hideMom
	ld [wToggleableObjectIndex], a
	predef ShowObject
	jr .checkBill
.hideMom
	ld [wToggleableObjectIndex], a
	predef HideObject
.checkBill
	call Random
	cp 30
	ld a, TOGGLE_CHAMPIONSHOUSE1F_BILL
	jr nc, .hideBill
	ld [wToggleableObjectIndex], a
	predef ShowObject
	jr .checkBird
.hideBill
	ld [wToggleableObjectIndex], a
	predef HideObject
.checkBird
	call Random
	cp 13
	ld a, TOGGLE_CHAMPIONSHOUSE1F_BIRD
	jr nc, .hideBird
	ld [wToggleableObjectIndex], a
	predef ShowObject
	jr .done
.hideBird
	ld [wToggleableObjectIndex], a
	predef HideObject
.done
	ret

ChampionsHouse1F_TextPointers:
	def_text_pointers
	dw_const ChampionsHouse1FDaisyText, TEXT_CHAMPIONSHOUSE1F_DAISY
	dw_const ChampionsHouse1FOakText,   TEXT_CHAMPIONSHOUSE1F_OAK
	dw_const ChampionsHouse1FMomText,   TEXT_CHAMPIONSHOUSE1F_MOM
	dw_const ChampionsHouse1FBillText,  TEXT_CHAMPIONSHOUSE1F_BILL
	dw_const ChampionsHouse1FBirdText,  TEXT_CHAMPIONSHOUSE1F_BIRD
	dw_const ChampionsHouse1FRivalText, TEXT_CHAMPIONSHOUSE1F_RIVAL

ChampionsHouse1FMomText:
	text_far _ChampionsHouse1FMomText
	text_end

ChampionsHouse1FOakText:
	text_far _ChampionsHouse1FOakText
	text_end
	
ChampionsHouse1FDaisyText:
	text_far _ChampionsHouse1FDaisyText
	text_end
	
ChampionsHouse1FBillText:
	text_asm
	CheckEvent EVENT_CHAMPIONS_HOUSE_OPEN_BILLS_GARDEN
    jr nz, .alreadyOpened
	ld hl, .ChampionsHouse1FBillText
	call PrintText
	SetEvent EVENT_CHAMPIONS_HOUSE_OPEN_BILLS_GARDEN
	jr .done
.alreadyOpened:
	ld hl, .ChampionsHouse1FBillEnjoyText
	call PrintText
.done
	jp TextScriptEnd
	
.ChampionsHouse1FBillText:
	text_far _ChampionsHouse1FBillText
	text_end

.ChampionsHouse1FBillEnjoyText:
	text_far _ChampionsHouse1FBillEnjoyText
	text_end
	
ChampionsHouse1FBirdText:
	text_asm
	CheckEvent EVENT_GOT_CHAMPIONS_HOUSE_BIRD_GIFT
	jr nz, .alreadyGotItem
	ld hl, .ChampionsHouse1FBirdText
	call PrintText
	call Random
	cp 60 ; 60/256 chance of receiving Ultra ball
	jr c, .giveUltraBall
	cp 120 ; 60/256 chance of receiving Max Revive
	jr c, .giveMaxRevive
	cp 180 ; 60/256 chance of receiving Nugget
	jr c, .giveNugget
	lb bc, RARE_CANDY, 1 ; 75/256 chance of receiving Rare Candy
	jr .giveIt
.giveNugget
	lb bc, NUGGET, 1
	jr .giveIt
.giveMaxRevive
	lb bc, MAX_REVIVE, 1
	jr .giveIt
.giveUltraBall
	lb bc, ULTRA_BALL, 1
.giveIt
	call GiveItem
	jr nc, .bagFull
	SetEvent EVENT_GOT_CHAMPIONS_HOUSE_BIRD_GIFT
	ld hl, .ChampionsHouse1FBirdGaveItemText
	call PrintText
	jr .done
.bagFull
	ld hl, .ChampionsHouse1FBirdBagFullText
	call PrintText
	jr .done
.alreadyGotItem
	ld hl, .ChampionsHouse1FBirdDoneText
	call PrintText
.done
	jp TextScriptEnd
	
.ChampionsHouse1FBirdText:
	text_far _ChampionsHouse1FBirdText
	text_end
	
.ChampionsHouse1FBirdGaveItemText:
	text_far _ChampionsHouse1FBirdGaveItemText
	sound_get_item_1
	text_end

.ChampionsHouse1FBirdBagFullText:
	text_far _ChampionsHouse1FBirdBagFullText
	text_end

.ChampionsHouse1FBirdDoneText:
	text_far _ChampionsHouse1FBirdDoneText
	text_end

ChampionsHouse1FRivalText:
	text_far _ChampionsHouse1FRivalText
	text_end
