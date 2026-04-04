ChampionsHouse1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z

	ResetEvent EVENT_GOT_CHAMPIONS_HOUSE_BIRD_GIFT
	ResetEvent EVENT_DRINK_TEA_WITH_DAISY
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

; In PureRGB there's a similar feature made by Vortyne, this ispired me to make my own with a different approach
ChampionsHouse1FDaisyText:
	text_asm
	CheckEvent EVENT_DRINK_TEA_WITH_DAISY
	jr nz, .alreadyDrinkTea
	
	ld hl, .ChampionsHouse1FDaisyText
	call PrintText

	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refusedTeaText

	SetEvent EVENT_DRINK_TEA_WITH_DAISY

	ld a, $16
	ld [wNewTileBlockID], a
	lb bc, 2, 1
	predef ReplaceTileBlock

	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	ld a, SPRITE_FACING_RIGHT
	ldh [hSpriteFacingDirection], a
	ld a, 1
	ldh [hSpriteIndex], a
	call SetSpriteFacingDirectionAndDelay
	ld hl, .ChampionsHouse1FDaisy2Text
	call PrintText
	ld a, [wLastMusicSoundID]
	ld e, a
	push de
	call GBFadeOutToWhite
	call ReloadMapData
	predef HealParty
	ld a, MUSIC_PKMN_HEALED
	call PlayMusic
	call WaitForSongToFinish
	pop de
	ld a, e
	ld [wLastMusicSoundID], a
	call PlayMusic
	call GBFadeInFromWhite
	ld hl, .ChampionsHouse1FDaisy4Text
	call PrintText	
	jr .exit
	
.ChampionsHouse1FDaisyText
	text_far _ChampionsHouse1FDaisyText
	text_end
	
.ChampionsHouse1FDaisy2Text
	text_far _ChampionsHouse1FDaisy2Text
	text_end
	
.refusedTeaText
	ld hl, .ChampionsHouse1FDaisy3Text
	call PrintText
	jr .exit
	
.ChampionsHouse1FDaisy3Text
	text_far _ChampionsHouse1FDaisy3Text
	text_end
	
.ChampionsHouse1FDaisy4Text
	text_far _ChampionsHouse1FDaisy4Text
	text_end

.alreadyDrinkTea
	ld hl, .ChampionsHouse1FDaisy5Text
	call PrintText
	jr .exit

.ChampionsHouse1FDaisy5Text
	text_far _ChampionsHouse1FDaisy5Text
	text_end

.exit
	jp TextScriptEnd
	
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
