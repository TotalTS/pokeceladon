MomPhoneText::
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump CeladonMart1FMomPhoneText

CeladonMart1FMomPhoneText::
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
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld hl, .CeladonMart1FPhoneEllipseText
	call PrintText
	ld a, SFX_CALL
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld hl, .CeladonMart1FPhoneEllipseText
	call PrintText
	ld hl, .MomPhoneText_Default
	call PrintText
	farcall MomPhone_RunDialogue
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
