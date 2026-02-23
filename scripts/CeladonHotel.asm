CeladonHotel_Script:
	jp EnableAutoTextBoxDrawing

CeladonHotel_TextPointers:
	def_text_pointers
	dw_const CeladonHotelGrannyText,    TEXT_CELADONHOTEL_GRANNY
	dw_const CeladonHotelBeautyText,    TEXT_CELADONHOTEL_BEAUTY
	dw_const CeladonHotelSuperNerdText, TEXT_CELADONHOTEL_SUPER_NERD
	dw_const CeladonHotelSatoText,      TEXT_CELADONHOTEL_SATO

CeladonHotelGrannyText:
	text_far _CeladonHotelGrannyText
	text_end

CeladonHotelBeautyText:
	text_far _CeladonHotelBeautyText
	text_end

CeladonHotelSuperNerdText:
	text_far _CeladonHotelSuperNerdText
	text_end

CeladonHotelSatoText:
	text_asm

	ld a, [wNumHoFTeams]
	and a
	jr z, .notChampion

	ld hl, MrSatoChampionGreetingText
	call PrintText

	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a

.loop
	ld hl, MrSatoChooseHomeText
	call PrintText

	ld hl, .HomeItemList
	call LoadItemList

	ld hl, wItemList
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a

	xor a
	ld [wPrintItemPrices], a
	ld [wMenuItemToSwap], a

	ld a, SPECIALLISTMENU
	ld [wListMenuID], a

	call DisplayListMenuID
	jr c, .cancel ; B pressed

	ld a, [wCurItem]
	sub HOME_PALLET_ITEM
	ld [wPlayerHomeLocation], a

	ld hl, MrSatoConfirmedText
	call PrintText
	jr .done

.cancel
	ld hl, MrSatoNoHomeText
	call PrintText
	jr .done

.notChampion
	ld hl, MrSatoNormalText
	call PrintText

.done
	jp TextScriptEnd

.HomeItemList:
	db 11
	table_width 1
	db HOME_PALLET_ITEM
	db HOME_VIRIDIAN_ITEM
	db HOME_PEWTER_ITEM
	db HOME_CERULEAN_ITEM
	db HOME_VERMILION_ITEM
	db HOME_LAVENDER_ITEM
	db HOME_CELADON_ITEM
	db HOME_SAFFRON_ITEM
	db HOME_FUCHSIA_ITEM
	db HOME_CINNABAR_ITEM
	db HOME_INDIGO_ITEM
	db -1

MrSatoChooseHomeText:
	text_far _MrSatoChooseHomeText
	text_end

MrSatoNormalText:
    text_far _MrSatoNormalText
    text_end
    
MrSatoChampionGreetingText:
    text_far _MrSatoChampionGreetingText
    text_end

MrSatoNoHomeText:
    text_far _MrSatoNoHomeText
    text_end

MrSatoConfirmedText:
    text_far _MrSatoConfirmedText
    text_end
