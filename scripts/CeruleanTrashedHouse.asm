CeruleanTrashedHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

CeruleanTrashedHouse_TextPointers:
	def_text_pointers
	dw_const CeruleanTrashedHouseFishingGuruText, TEXT_CERULEANTRASHEDHOUSE_FISHING_GURU
	dw_const CeruleanTrashedHouseGirlText,        TEXT_CERULEANTRASHEDHOUSE_GIRL
	dw_const CeruleanTrashedHouseWallHoleText,    TEXT_CERULEANTRASHEDHOUSE_WALL_HOLE

CeruleanTrashedHouseFishingGuruText:
	text_asm
	ld a, [wIsRocketSuit]
	and a
	jr z, .normalBehavior
	ld b, TM_DIG
	predef GetQuantityOfItemInBag
	and b
	jr z, .no_dig_tmRocket
	ld hl, .FishingGuruRocketSuitAfterText
	call PrintText
	jr .done
.no_dig_tmRocket
	ld hl, .FishingGuruRocketSuitText
	call PrintText
	jr .done
.normalBehavior
	ld b, TM_DIG
	predef GetQuantityOfItemInBag
	and b
	jr z, .no_dig_tm
	ld hl, .WhatsLostIsLostText
	call PrintText
	jr .done
.no_dig_tm
	ld hl, .TheyStoleATMText
	call PrintText
.done
	jp TextScriptEnd

.TheyStoleATMText:
	text_far _CeruleanTrashedHouseFishingGuruTheyStoleATMText
	text_end

.WhatsLostIsLostText:
	text_far _CeruleanTrashedHouseFishingGuruWhatsLostIsLostText
	text_end
	
.FishingGuruRocketSuitText:
	text_far _CeruleanTrashedHouseFishingGuruRocketSuitText
	text_end

.FishingGuruRocketSuitAfterText:
	text_far _CeruleanTrashedHouseFishingGuruRocketSuitAfterText
	text_end

CeruleanTrashedHouseGirlText:
	text_asm
	ld a, [wIsRocketSuit]
	and a
	jr z, .normalBehavior
	ld hl, .CeruleanTrashedHouseGirlRocketSuitText
	call PrintText
	jr .doneGirl
.normalBehavior
	ld hl, .CeruleanTrashedHouseGirlText
	call PrintText
.doneGirl
	jp TextScriptEnd

.CeruleanTrashedHouseGirlText:
	text_far _CeruleanTrashedHouseGirlText
	text_end
	
.CeruleanTrashedHouseGirlRocketSuitText:
	text_far _CeruleanTrashedHouseGirlRocketSuitText
	text_end

CeruleanTrashedHouseWallHoleText:
	text_far _CeruleanTrashedHouseWallHoleText
	text_end
