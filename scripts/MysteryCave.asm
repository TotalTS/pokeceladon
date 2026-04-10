MysteryCave_Script:
	jp EnableAutoTextBoxDrawing

MysteryCave_TextPointers:
	def_text_pointers
	dw_const MysteryCaveSuperNerdText, TEXT_MYSTERYCAVE_SUPER_NERD
	
MysteryCaveSuperNerdText:
    text_asm
    CheckEvent EVENT_MYSTERYCAVE_GOT_HELIX_FOSSIL
    jr nz, .alreadyGot
    CheckEvent EVENT_MYSTERYCAVE_GOT_DOME_FOSSIL
    jr nz, .alreadyGot

    CheckEvent EVENT_GOT_HELIX_FOSSIL
    jr nz, .OfferDome
    CheckEvent EVENT_GOT_DOME_FOSSIL
    jr nz, .OfferHelix
    jr .alreadyGot

.OfferDome
    ld hl, .MysteryCaveSuperNerdText
    call PrintText
    ld a, $1
    ld [wDoNotWaitForButtonPressAfterDisplayingText], a
    ld hl, .YouWantDomeText
    call PrintText
    call YesNoChoice
    ld a, [wCurrentMenuItem]
    and a
    jr nz, .done
    lb bc, DOME_FOSSIL, 1
    call GiveItem
    jp nc, .bag_full
    ld hl, .MysteryCaveSuperNerdReceivedFossilText
    call PrintText
    SetEvent EVENT_MYSTERYCAVE_GOT_DOME_FOSSIL
    jr .done

.OfferHelix
    ld hl, .MysteryCaveSuperNerdText
    call PrintText
    ld a, $1
    ld [wDoNotWaitForButtonPressAfterDisplayingText], a
    ld hl, .YouWantHelixText
    call PrintText
    call YesNoChoice
    ld a, [wCurrentMenuItem]
    and a
    jr nz, .done
    lb bc, HELIX_FOSSIL, 1
    call GiveItem
    jp nc, .bag_full
    ld hl, .MysteryCaveSuperNerdReceivedFossilText
    call PrintText
    SetEvent EVENT_MYSTERYCAVE_GOT_HELIX_FOSSIL
    jr .done

.alreadyGot
    ld hl, .AlreadyGotText
    call PrintText
.done
    jp TextScriptEnd

.bag_full
    ld hl, .MysteryCaveSuperNerdYouHaveNoRoomText
    call PrintText
    jp TextScriptEnd
	
.MysteryCaveSuperNerdText
    text_far _MysteryCaveSuperNerdText
    text_end

.AlreadyGotText
    text_far _MysteryCaveSuperNerdAlreadyGotText
    text_end
	
.MysteryCaveSuperNerdYouHaveNoRoomText
    text_far _MysteryCaveSuperNerdYouHaveNoRoomText
    text_end

.YouWantDomeText
    text_far _MtMoonB2FDomeFossilYouWantText
    text_end

.YouWantHelixText
    text_far _MtMoonB2FHelixFossilYouWantText
    text_end

.MysteryCaveSuperNerdReceivedFossilText
    text_far _MysteryCaveSuperNerdReceivedFossilText
    sound_get_item_1
    text_promptbutton
    text_end
