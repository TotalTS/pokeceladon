CeladonUniversity_Script:
	call EnableAutoTextBoxDrawing
	ret

CeladonUniversity_TextPointers:
	def_text_pointers
	dw_const CeladonUniversityProfText, TEXT_CELADONUNIVERSITY_PROF
	dw_const CeladonUniversityReceText, TEXT_CELADONUNIVERSITY_RECEPTIONIST
	dw_const CeladonUniversityGBKText,  TEXT_CELADONUNIVERSITY_GAMEBOY_KID
	dw_const CeladonUniversityCTFText,  TEXT_CELADONUNIVERSITY_COOLTRAINER_F
	dw_const CeladonUniversitySignText, TEXT_CELADONUNIVERSITY_SIGN
	dw_const CeladonUniversitySignText2,TEXT_CELADONUNIVERSITY_SIGN2
	dw_const CeladonUniversitySignText3,TEXT_CELADONUNIVERSITY_SIGN3
	dw_const CeladonUniversitySignText4,TEXT_CELADONUNIVERSITY_SIGN4
	dw_const CeladonUniversitySignText5,TEXT_CELADONUNIVERSITY_SIGN5
	dw_const CeladonUniversityStatueGD, TEXT_CELADONUNIVERSITY_SIGN6
	dw_const CeladonUniversityBlackboard,TEXT_CELADONUNIVERSITY_SIGN7
	dw_const CeladonUniversityBookcaseText, TEXT_CELADONUNIVERSITY_SIGN8

CeladonUniversitySignText:
	text_far _CeladonUniversitySignText
	text_end
	
CeladonUniversitySignText2:
	text_far _CeladonUniversitySignText2
	text_end
	
CeladonUniversitySignText3:
	text_far _CeladonUniversitySignText3
	text_end
	
CeladonUniversitySignText4:
	text_asm
	CheckEvent EVENT_GOT_UNIVERSITY_MAGIKARP
    jp nz, .diplomaWon
	
	ld hl, .CeladonUniversityDiploma1
	call PrintText
	
	jp TextScriptEnd
	
.diplomaWon
	ld hl, .CeladonUniversityDiploma2
	call PrintText
	
	ld a, 1 ; Diploma check
	ld [wWhichTrade], a
	
	callfar DisplayDiploma
	ld a, TRUE
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	
	xor a
	ld [wWhichTrade], a
	jp TextScriptEnd

.CeladonUniversityDiploma1:
	text_far _CeladonUniversityDiploma1
	text_end

.CeladonUniversityDiploma2:
	text_far _CeladonUniversityDiploma2
	text_end
	
CeladonUniversitySignText5:
	text_far _CeladonUniversitySignText5
	text_end
	
CeladonUniversityStatueGD:
	text_far _CeladonUniversityStatueGD
	text_end
	
CeladonUniversityBlackboard:
	text_far _CeladonUniversityBlackboard
	text_end
	
CeladonUniversityBookcaseText:
    text_far _BookcaseText
    text_end

CeladonUniversityProfText:
	text_asm
	CheckEvent EVENT_GOT_UNIVERSITY_MAGIKARP
    jp nz, .alreadyWon
    ld hl, .IntroText
    call PrintText

    call YesNoChoice
    ld a, [wCurrentMenuItem]
    and a
    jp nz, .refusedExam
	
	call CeladonUniversityHyperExam
    jp c, .failedExam
	
    ld a, [wPartyCount]
    cp 6
    jr nz, .giveMagikarp
    ld hl, .PartyFullText
    call PrintText
    jp .done

.giveMagikarp
    ld hl, .CeladonUniversityProfPassText
    call PrintText

    ; --- PREPARE DATA ---
    ld a, MAGIKARP
    ld [wInGameTradeReceiveMonSpecies], a
    ld [wCurPartySpecies], a
    ld a, 5
    ld [wCurEnemyLevel], a

    ; Prepare OT ID and Name (Based on the player)
	ld a, [wPartyCount]
    dec a
    ld hl, wPartyMonOT
    ld bc, NAME_LENGTH
    call AddNTimes
    ld d, h
    ld e, l
    ld hl, wPlayerName ; Copy player name as Original Trainer
    ld bc, NAME_LENGTH
    call CopyData
	
    ld hl, wPlayerName
    ld de, wTradedEnemyMonOT
	ld bc, NAME_LENGTH
    call CopyData

    ld hl, wPlayerID
    ld de, wTradedEnemyMonOTID
    ld bc, 2
    call CopyData
	
	ld hl, .CustomOTName
    ld de, wLinkEnemyTrainerName
	ld bc, NAME_LENGTH
    call CopyData
	
    ld a, 1
    ldh [hSpriteIndex], a
    ld a, SPRITE_FACING_UP
    ldh [hSpriteFacingDirection], a
    call SetSpriteFacingDirectionAndDelay

    ld hl, .CeladonUniversityProfPassText2
    call PrintText
	
	ld a, SFX_TELEPORT_EXIT_1
    call PlaySound
    call WaitForSoundToFinish

    ; --- ANIMATION AND ADDITION ---
    call LoadHpBarAndStatusTilePatterns
    predef UniversityDistroAnim

    ; Define origins of data for AddPartyMon
	ld hl, .ReceivedMagikarpText
    call PrintText
    ld a, SFX_GET_KEY_ITEM ; Music
    call PlaySound
    call WaitForSoundToFinish
    xor a
    ld [wMonDataLocation], a
    call AddPartyMon
	
	ld a, [wPartyCount]
    dec a
    ld hl, wPartyMon1Moves
    ld bc, wPartyMon2 - wPartyMon1
    call AddNTimes ; HL now points the moves of te recently acquired Magikarp

    ; Define moves
    ld [hl], SPLASH        ; First move
    inc hl
    ld [hl], DRAGON_RAGE   ; Second move
    inc hl
    ld [hl], 0             ; Empty
    inc hl
    ld [hl], 0             ; Empty

    ; Define PP
    push hl
    ld bc, wPartyMon1PP - (wPartyMon1Moves + 4)
    add hl, bc
    inc hl
    ld [hl], 40            ; Splash PP
    inc hl
    ld [hl], 10            ; Dragon Rage PP
    pop hl

	SetEvent EVENT_GOT_UNIVERSITY_MAGIKARP
    ; --- CLEANING ---
	ld a, $90
    ldh [hWY], a
	
    call ClearScreen
    farcall InGameTrade_RestoreScreen
	
	farcall RedrawMapView
	call UpdateSprites
	
	call DelayFrame
	call DelayFrame
	xor a
    ldh [hWY], a      ; re-enable window for textbox
	
	ld hl, .AfterGiftText
    call PrintText

    jp TextScriptEnd

.done
    jp TextScriptEnd

.CeladonUniversityProfPassText:
    text_far _CeladonUniversityProfPassText
    text_end
	
.CeladonUniversityProfPassText2:
    text_far _CeladonUniversityProfPassText2
    text_end

.ReceivedMagikarpText:
    text "Received a"
	line "MAGIKARP with"
	cont "DRAGON RAGE!@"
    text_end
	
.CustomOTName:
    db "UNIVERSITY@"
	
.PartyFullText:
	text_far _PartyFullText
	text_end
	
.alreadyWon
    ld hl, .AlreadyWonText
    call PrintText
    jp .done

.refusedExam
    ld hl, .RefusedText
    call PrintText
    jp .done

.failedExam
    ld hl, .FailedText
    call PrintText
    jp .done

.IntroText:
    text_far _CeladonUniversityProfText
    text_end

.RefusedText:
    text_far _CeladonUniversityProfNoText
    text_end

.FailedText:
    text_far _CeladonUniversityProfFailText
    text_end

.AlreadyWonText:
    text_far _CeladonUniversityProfAlreadyWonText
    text_end

.AfterGiftText:
    text_far _CeladonUniversityProfAfterGiftText
    text_end


CeladonUniversityReceText:
	text_far _CeladonUniversityReceText
	text_end

CeladonUniversityGBKText:
	text_far _CeladonUniversityGBKText
	text_end
	
CeladonUniversityCTFText:
	text_far _CeladonUniversityCTFText
	text_end

CeladonUniversityHyperExam:
	ld hl, CeladonUniversityProfStartExamText
    call PrintText	
	
    call EnableAutoTextBoxDrawing

; ========== Question 1 ==========
    ld hl, CeladonUniversityProfQ1Text
    call PrintText
    call YesNoChoice
    ld a, [wCurrentMenuItem]
    and a
    jr nz, .fail

    ld hl, CeladonUniversityProfCorrectText
    call PrintText

; ========== Question 2 ==========
    ld hl, CeladonUniversityProfQ2Text
    call PrintText
    call YesNoChoice
    ld a, [wCurrentMenuItem]
    and a
    jr z, .fail

    ld hl, CeladonUniversityProfCorrectText
    call PrintText

; success
    and a
    ret

.fail
    scf
    ret

CeladonUniversityProfStartExamText:
    text_far _CeladonUniversityProfStartExamText
    text_end

CeladonUniversityProfPassedText:
    text_far _CeladonUniversityProfPassText
    text_end

CeladonUniversityProfQ1Text:
    text_far _CeladonUniversityProfQ1Text
    text_end

CeladonUniversityProfQ2Text:
    text_far _CeladonUniversityProfQ2Text
    text_end

CeladonUniversityProfCorrectText:
    text_far _CeladonUniversityProfCorrectText
    text_end

CeladonUniversityProfFailText:
    text_far _CeladonUniversityProfFailText
    text_end
