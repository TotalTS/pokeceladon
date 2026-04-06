ChampionsHouse1F_Script:
	call EnableAutoTextBoxDrawing
	ld a, [wChampionsHouse1FCurScript]
	ld hl, ChampionsHouse1F_ScriptPointers
	jp CallFunctionInTable

ChampionsHouse1F_ScriptPointers:
	def_script_pointers
	dw_const ChampionsHouse1FDefaultScript,      SCRIPT_CHAMPIONSHOUSE1F_DEFAULT
	dw_const ChampionsHouse1FPlayerMoveScript,   SCRIPT_CHAMPIONSHOUSE1F_PLAYERMOVE
	dw_const ChampionsHouse1FTeaWaitScript,      SCRIPT_CHAMPIONSHOUSE1F_TEAWAIT
	dw_const ChampionsHouse1FHealSequenceScript, SCRIPT_CHAMPIONSHOUSE1F_HEALSEQUENCE
	
ChampionsHouse1FDefaultScript:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z

	ResetEvent EVENT_CHAMPIONSHOUSE1F_BIRD_GIFT
	ResetEvent EVENT_CHAMPIONSHOUSE1F_DRINK_TEA_WITH_DAISY
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

ChampionsHouse1FPlayerMoveScript:
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	jr z, .noMovementNeeded
	
	cp SPRITE_FACING_DOWN
	ld de, .MovementFromAbove_Daisy
	jr z, .start
	
	cp SPRITE_FACING_RIGHT
	ld de, .MovementFromRight_Daisy
	jr z, .start
	jr .noMovementNeeded
.start
	ld hl, wSimulatedJoypadStatesEnd
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_CHAMPIONSHOUSE1F_TEAWAIT
	ld [wChampionsHouse1FCurScript], a
	ret
.noMovementNeeded
	ld a, SCRIPT_CHAMPIONSHOUSE1F_HEALSEQUENCE
	ld [wChampionsHouse1FCurScript], a
	ret
	
.MovementFromAbove_Daisy:
	db PAD_RIGHT, 1
	db PAD_DOWN, 2
	db PAD_LEFT, 1
	db -1

.MovementFromRight_Daisy:
	db PAD_RIGHT, 1
	db PAD_DOWN, 1
	db -1

ChampionsHouse1FTeaWaitScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, SCRIPT_CHAMPIONSHOUSE1F_HEALSEQUENCE
	ld [wChampionsHouse1FCurScript], a
	ret

ChampionsHouse1FHealSequenceScript:
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

	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, TEXT_CHAMPIONSHOUSE1F_DAISY_SHARED_TEA
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a

	ld a, [wLastMusicSoundID]
	ld [wSavedMusicID], a
	
	call GBFadeOutToWhite
	call ReloadMapData
	predef HealParty
	ld a, MUSIC_PKMN_HEALED
	call PlayMusic
	call WaitForSongToFinish
	
	ld a, [wSavedMusicID]
	call PlayMusic
	call GBFadeInFromWhite
	
	ld a, TEXT_CHAMPIONSHOUSE1F_DAISY_RELAXED
	ldh [hTextID], a
	call DisplayTextID

	xor a
	ld [wChampionsHouse1FCurScript], a
	ret

ChampionsHouse1F_TextPointers:
	def_text_pointers
	dw_const ChampionsHouse1FDaisyText, TEXT_CHAMPIONSHOUSE1F_DAISY
	dw_const ChampionsHouse1FOakText,   TEXT_CHAMPIONSHOUSE1F_OAK
	dw_const ChampionsHouse1FMomText,   TEXT_CHAMPIONSHOUSE1F_MOM
	dw_const ChampionsHouse1FBillText,  TEXT_CHAMPIONSHOUSE1F_BILL
	dw_const ChampionsHouse1FBirdText,  TEXT_CHAMPIONSHOUSE1F_BIRD
	dw_const ChampionsHouse1FRivalText, TEXT_CHAMPIONSHOUSE1F_RIVAL
	dw_const ChampionsHouse1FDaisy2Text, TEXT_CHAMPIONSHOUSE1F_DAISY_SHARED_TEA
	dw_const ChampionsHouse1FDaisy4Text, TEXT_CHAMPIONSHOUSE1F_DAISY_RELAXED

ChampionsHouse1FMomText:
	text_far _ChampionsHouse1FMomText
	text_end

ChampionsHouse1FOakText:
	text_far _ChampionsHouse1FOakText
	text_end

; In PureRGB there's a similar feature made by Vortyne, this inspired me to make my own with a different approach
ChampionsHouse1FDaisyText:
	text_asm
	CheckEvent EVENT_CHAMPIONSHOUSE1F_DRINK_TEA_WITH_DAISY
	jr nz, .alreadyDrinkTea

	ld hl, .ChampionsHouse1FDaisyText
	call PrintText
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a	
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refusedTeaText

	SetEvent EVENT_CHAMPIONSHOUSE1F_DRINK_TEA_WITH_DAISY
	ld a, SCRIPT_CHAMPIONSHOUSE1F_PLAYERMOVE
	ld [wChampionsHouse1FCurScript], a
	jr .exit
	
.ChampionsHouse1FDaisyText:
	text_far _ChampionsHouse1FDaisyText
	text_end
	
.refusedTeaText
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, ChampionsHouse1FDaisy3Text
	call PrintText
	jr .exit
	
.alreadyDrinkTea
	ld hl, ChampionsHouse1FDaisy5Text
	call PrintText
	jr .exit
	
.exit
	jp TextScriptEnd
	
ChampionsHouse1FDaisy2Text:
	text_far _ChampionsHouse1FDaisy2Text
	text_end
	
ChampionsHouse1FDaisy3Text:
	text_far _ChampionsHouse1FDaisy3Text
	text_end

ChampionsHouse1FDaisy4Text:
	text_far _ChampionsHouse1FDaisy4Text
	text_end

ChampionsHouse1FDaisy5Text:
	text_far _ChampionsHouse1FDaisy5Text
	text_end
	
ChampionsHouse1FBillText:
	text_asm
	CheckEvent EVENT_CHAMPIONSHOUSE1F_BILLS_GARDEN
    jr nz, .alreadyOpened
	ld hl, .ChampionsHouse1FBillText
	call PrintText
	SetEvent EVENT_CHAMPIONSHOUSE1F_BILLS_GARDEN
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
	CheckEvent EVENT_CHAMPIONSHOUSE1F_BIRD_GIFT
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
	SetEvent EVENT_CHAMPIONSHOUSE1F_BIRD_GIFT
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
