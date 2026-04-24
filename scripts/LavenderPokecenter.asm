LavenderPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

LavenderPokecenter_TextPointers:
	def_text_pointers
	dw_const LavenderPokecenterNurseText,            TEXT_LAVENDERPOKECENTER_NURSE
	dw_const LavenderPokecenterGentlemanText,        TEXT_LAVENDERPOKECENTER_GENTLEMAN
	dw_const LavenderPokecenterLittleGirlText,       TEXT_LAVENDERPOKECENTER_LITTLE_GIRL
	dw_const LavenderPokecenterLinkReceptionistText, TEXT_LAVENDERPOKECENTER_LINK_RECEPTIONIST
	dw_const LavenderPokecenterChanseyText,          TEXT_LAVENDERPOKECENTER_CHANSEY

LavenderPokecenterLinkReceptionistText:
	script_cable_club_receptionist

LavenderPokecenterNurseText:
	script_pokecenter_nurse

LavenderPokecenterGentlemanText:
	text_asm
	ld a, [wIsRocketSuit]
	and a
	jr z, .normalBehavior
	ld hl, .LavenderPokecenterGentlemanRocketSuitText
	call PrintText
	jr .doneGentleman
.normalBehavior
	ld hl, .LavenderPokecenterGentlemanText
	call PrintText
.doneGentleman
	jp TextScriptEnd
	
.LavenderPokecenterGentlemanText:
	text_far _LavenderPokecenterGentlemanText
	text_end
	
.LavenderPokecenterGentlemanRocketSuitText:
	text_far _LavenderPokecenterGentlemanRocketSuitText
	text_end

LavenderPokecenterLittleGirlText:
	text_asm
	ld a, [wIsRocketSuit]
	and a
	jr z, .normalBehavior
	ld hl, .LavenderPokecenterLittleGirlRocketSuitText
	call PrintText
	jr .done
.normalBehavior
	ld hl, .LavenderPokecenterLittleGirlText
	call PrintText
.done
	jp TextScriptEnd
	
.LavenderPokecenterLittleGirlText:
	text_far _LavenderPokecenterLittleGirlText
	text_end
	
.LavenderPokecenterLittleGirlRocketSuitText:
	text_far _LavenderPokecenterLittleGirlRocketSuitText
	text_end

LavenderPokecenterChanseyText:
	text_asm
	callfar PokecenterChanseyText
	jp TextScriptEnd
