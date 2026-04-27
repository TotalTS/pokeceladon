_HandleMysteryCaveSuperNerdText::
	text_asm
	CheckEitherEventSet EVENT_MYSTERYCAVE_GOT_HELIX_FOSSIL, EVENT_MYSTERYCAVE_GOT_DOME_FOSSIL
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

_HandleMysteryCaveBlackbeltText::
	text_asm
	CheckEitherEventSet EVENT_MYSTERYCAVE_GOT_HITMONLEE, EVENT_MYSTERYCAVE_GOT_HITMONCHAN
	jr nz, .alreadyGot

	CheckEvent EVENT_GOT_HITMONLEE, 
	jr nz, .OfferHitmonchan
	CheckEvent EVENT_GOT_HITMONCHAN
	jr nz, .OfferHitmonlee
	jr .alreadyGot

.OfferHitmonchan
	ld hl, .MysteryCaveBlackbeltText
	call PrintText
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .YouWantHitmonchanText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	lb bc, HITMONCHAN, 40
	call GivePokemon
	jp nc, .done
	SetEvent EVENT_MYSTERYCAVE_GOT_HITMONCHAN
	jr .done

.OfferHitmonlee
	ld hl, .MysteryCaveBlackbeltText
	call PrintText
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .YouWantHitmonleeText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	lb bc, HITMONLEE, 40
	call GivePokemon
	jp nc, .done
	SetEvent EVENT_MYSTERYCAVE_GOT_HITMONLEE
	jr .done

.alreadyGot
	ld hl, .AlreadyGotText
	call PrintText
.done
	jp TextScriptEnd
	
.MysteryCaveBlackbeltText
	text_far _MysteryCaveBlackbeltText
	text_end

.AlreadyGotText
	text_far _MysteryCaveBlackbeltAlreadyGotText
	text_end

.YouWantHitmonchanText
	text_far _FightingDojoHitmonchanPokeBallText
	text_end

.YouWantHitmonleeText
	text_far _FightingDojoHitmonleePokeBallText
	text_end

_MysteryCaveSuperNerdText::
	text "Oh! You're the"
	line "CHAMPION!"
	
	para "Nice to meet you!"
	
	para "I was exploring"
	line "this place..."
	
	para "And I found a"
	line "FOSSIL!"
	prompt

_MysteryCaveSuperNerdAlreadyGotText::
	text "This place is"
	line "huge!"
	
	para "There are many"
	line "TRAINERS..."
	
	para "And strong"
	line "#MON too!"
	done

_MysteryCaveSuperNerdYouHaveNoRoomText::
	text "Look, you've got"
	line "no room for this.@"
	done

_MysteryCaveSuperNerdReceivedFossilText::
	text "<PLAYER> got the"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_MysteryCaveBlackbeltText::
	text "CHAMPION!"

	para "Your fists chose"
	line "one path before."
	cont "I guard the other"
	cont "with discipline."

	para "Take it!"

	para "Master both"
	line "styles!"
	prompt

_MysteryCaveBlackbeltAlreadyGotText::
	text "A true fighter"
	line "adapts to any"
	cont "style."

	para "Keep training!"
	done

_MysteryCaveRookie1BattleText::
	text "Wait! I know your"
	line "battle style!"

	para "I've analyzed your"
	line "strategy, and I"
	cont "have the answer!"
	done
	
_MysteryCaveRookie1EndBattleText::
	text "No!"
	line "My calculations!"
	prompt

_MysteryCaveRookie1AfterBattleText::
	text "Calculations and"
	line "data can't measure"
	cont "your #MON's"
	cont "spirit."

	para "I have a lot"
	line "to learn yet!"
	done

_MysteryCaveRookie2BattleText::
	text "I knew I'd find"
	line "you here!"

	para "They said you go"
	line "where things get"
	cont "strange..."

	para "I had to see it!"
	done

_MysteryCaveRookie2EndBattleText::
	text "No way..."
	line "You're unreal!"
	prompt

_MysteryCaveRookie2AfterBattleText::
	text "My heart was"
	line "pounding the"
	cont "whole time!"
	done

_MysteryCaveBlackbelt1BattleText::
	text "You feel it?"

	para "The silence of"
	line "this cave..."

	para "It sharpens the"
	line "mind!"
	done

_MysteryCaveBlackbelt1EndBattleText::
	text "Darn!"
	line "My focus broke!"
	prompt

_MysteryCaveBlackbelt1AfterBattleText::
	text "Strength alone"
	line "is nothing..."

	para "A single doubt"
	line "breaks the flow."

	para "You have a"
	line "steady mind!"
	done

_MysteryCaveBeauty1BattleText::
	text "You made it"
	line "this far?"

	para "Good."
	line "Don't embarrass"
	cont "yourself now."
	done

_MysteryCaveBeauty1EndBattleText::
	text "Hmph..."
	line "So you're real!"
	prompt

_MysteryCaveBeauty1AfterBattleText::
	text "Most trainers"
	line "lose their nerve"
	cont "down here."

	para "You didn’t."
	line "I like that!"
	done

_MysteryCaveCooltrainerF1BattleText::
	text "You've come far."
	line "But skill alone"
	cont "won't be enough."

	para "Show me control."
	done

_MysteryCaveCooltrainerF1EndBattleText::
	text "No!"
	line "Outplayed..."
	prompt

_MysteryCaveCooltrainerF1AfterBattleText::
	text "Every move you"
	line "made had purpose."

	para "That's what sets"
	line "you apart!"
	done
