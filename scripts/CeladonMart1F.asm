CeladonMart1F_Script:
	jp EnableAutoTextBoxDrawing

CeladonMart1F_TextPointers:
	def_text_pointers
	dw_const CeladonMart1FReceptionistText,     TEXT_CELADONMART1F_RECEPTIONIST
	dw_const CeladonMart1FDirectorySignText,    TEXT_CELADONMART1F_DIRECTORY_SIGN
	dw_const CeladonMart1FCurrentFloorSignText, TEXT_CELADONMART1F_CURRENT_FLOOR_SIGN
	dw_const CeladonMart1FPhoneText,            TEXT_CELADONMART1F_PHONE

CeladonMart1FReceptionistText:
	text_far _CeladonMart1FReceptionistText
	text_end

CeladonMart1FDirectorySignText:
	text_far _CeladonMart1FDirectorySignText
	text_end

CeladonMart1FCurrentFloorSignText:
	text_far _CeladonMart1FCurrentFloorSignText
	text_end

CeladonMart1FPhoneText:
	text_asm
	ld hl, .CeladonMart1FPhoneText
	call PrintText
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a	
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, CeladonMart1FPhoneChoiceEnd
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a

	ld a, SFX_CALL
	call PlaySound
	ld c, 30
	call DelayFrames
	ld hl, .CeladonMart1FPhoneEllipseText
	call PrintText
	ld a, SFX_CALL
	call PlaySound
	ld c, 30
	call DelayFrames
	ld hl, .CeladonMart1FPhoneEllipseText
	call PrintText
	ld hl, .MomPhoneText_Default
	call PrintText
	call MomPhone_StatusText
	ld hl, .MomPhoneText_EndText
	call PrintText
	ld hl, .PhoneClickText
	call PrintText
	ld a, SFX_HANG_UP
	call PlaySound
	ld c, 40
	call DelayFrames
	ld hl, .CeladonMart1FPhoneEllipseText
	call PrintText
	ld c, 40
	call DelayFrames
	ld hl, .CeladonMart1FPhoneEllipseText
	call PrintText
	ld c, 40
	call DelayFrames
	ld hl, .CeladonMart1FPhoneEllipseText
	call PrintText
	ld c, 40
	call DelayFrames
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a	
	jp TextScriptEnd

.CeladonMart1FPhoneText
	text_far _CeladonMart1FPhoneText
	text_end

.CeladonMart1FPhoneEllipseText
	text_far _CeladonMart1FPhoneEllipseText
	text_end
	
.MomPhoneText_Default
	text_far _MomPhoneText_Default
	text_end
	
.MomPhoneText_EndText
	text_far _MomPhoneText_EndText
	text_end
	
.PhoneClickText
	text_far _PhoneClickText
	text_end

CeladonMart1FPhoneChoiceEnd:
	jp TextScriptEnd


MomPhone_StatusText:
	; Check fainted first
	ld hl, wPartyMon1HP
	ld a, [hli]
	or [hl]
	jr nz, .checkStatus
	ld hl, MomPhoneText_StatusFainted
	jr .done

.checkStatus
	ld a, [wPartyMon1Status]
	and a
	jr z, .healthy

	; Sleep (multi-bit)
	and SLP_MASK
	jr nz, .asleep

	ld a, [wPartyMon1Status]

	; Freeze
	bit FRZ, a
	jr nz, .frozen

	; Paralysis
	bit PAR, a
	jr nz, .paralyzed

	; Burn
	bit BRN, a
	jr nz, .burned

	; Poison
	bit PSN, a
	jr nz, .poisoned

.healthy
	ld hl, MomPhoneText_StatusOK
	jr .done

.poisoned
	ld hl, MomPhoneText_StatusPoisoned
	jr .done

.paralyzed
	ld hl, MomPhoneText_StatusParalyzed
	jr .done

.burned
	ld hl, MomPhoneText_StatusBurned
	jr .done

.frozen
	ld hl, MomPhoneText_StatusFrozen
	jr .done

.asleep
	ld hl, MomPhoneText_StatusAsleep
	jr .done

.done
	ld a, [wPartyMon1Species]
	ld [wNamedObjectIndex], a
	call GetMonName

	call PrintText
	ret
	
MomPhoneText_StatusOK:
	text_far _MomPhoneText_StatusOK
	text_end
	
MomPhoneText_StatusPoisoned:
	text_far _MomPhoneText_StatusPoisoned
	text_end
	
MomPhoneText_StatusParalyzed:
	text_far _MomPhoneText_StatusParalyzed
	text_end

MomPhoneText_StatusBurned:
	text_far _MomPhoneText_StatusBurned
	text_end

MomPhoneText_StatusFrozen:
	text_far _MomPhoneText_StatusFrozen
	text_end

MomPhoneText_StatusAsleep:
	text_far _MomPhoneText_StatusAsleep
	text_end
	
MomPhoneText_StatusFainted:
	text_far _MomPhoneText_StatusFainted
	text_end
