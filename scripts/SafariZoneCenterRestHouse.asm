SafariZoneCenterRestHouse_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneCenterRestHouse_TextPointers:
	def_text_pointers
	dw_const SafariZoneCenterRestHouseGirlText,      TEXT_SAFARIZONECENTERRESTHOUSE_GIRL
	dw_const SafariZoneCenterRestHouseScientistText, TEXT_SAFARIZONECENTERRESTHOUSE_SCIENTIST
	dw_const SafariZoneCenterRestHouseErikText,      TEXT_SAFARI_REST_HOUSE_ERIK

SafariZoneCenterRestHouseGirlText:
	text_asm
	CheckEvent EVENT_GAVE_POKEGEAR_TO_ERIK
	jr nz, .reunion ; if they've met
	CheckEvent EVENT_GOT_POKEGEAR_FROM_SARA
	jr nz, .waiting ; If you have the item but didn't delivered it yet
	CheckEvent EVENT_SPOKE_TO_ERIK_IN_FUCHSIA
	jr nz, .giveItem ; if talked to Erik first
	
	; normal text
	ld hl, .SafariZoneCenterRestHouseGirlText 
	call PrintText
	jr .done

.giveItem:
	ld hl, .SaraGivePokegearText
	call PrintText
	lb bc, POKEGEAR, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .GotPokeGearText
	call PrintText
	SetEvent EVENT_GOT_POKEGEAR_FROM_SARA
	ld hl, .SaraGivePokegearText2
	call PrintText
	jr .done

.bag_full:
	ld hl, .SafariZoneCenterBagFullText ; "Your bag is full!"
	call PrintText
	jr .done

.waiting:
	ld hl, .SaraFindErikText ; "Find Erik!"
	call PrintText
	jr .done

.reunion:
	ld hl, .SaraReunionText
	call PrintText
.done:
	jp TextScriptEnd
	
.SafariZoneCenterRestHouseGirlText:
	text_far _SafariZoneCenterRestHouseGirlText
	text_end
	
.SaraGivePokegearText:
	text_far _SaraGivePokegearText
	text_end
	
.SaraGivePokegearText2
	text_far _SaraGivePokegearText2
	text_end
	
.SafariZoneCenterBagFullText:
	text_far _SafariZoneCenterBagFullText
	text_end
	
.GotPokeGearText:
	text_far _SafariZoneCenterSaraGotPokeGearText
	sound_get_item_1
	text_end

.SaraFindErikText:
	text_far _SaraFindErikText
	text_end
	
.SaraReunionText:
	text_far _SaraReunionText
	text_end

SafariZoneCenterRestHouseScientistText:
	text_far _SafariZoneCenterRestHouseScientistText
	text_end

SafariZoneCenterRestHouseErikText:
	text_far _ErikReunionText
	text_end
