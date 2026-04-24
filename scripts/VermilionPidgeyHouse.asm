VermilionPidgeyHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

VermilionPidgeyHouse_TextPointers:
	def_text_pointers
	dw_const VermilionPidgeyHouseYoungsterText, TEXT_VERMILIONPIDGEYHOUSE_YOUNGSTER
	dw_const VermilionPidgeyHousePidgeyText,    TEXT_VERMILIONPIDGEYHOUSE_PIDGEY
	dw_const VermilionPidgeyHouseLetterText,    TEXT_VERMILIONPIDGEYHOUSE_LETTER

VermilionPidgeyHouseYoungsterText:
	text_asm
	ld a, [wIsRocketSuit]
	and a
	jr z, .normalBehavior
	ld hl, .VermilionPidgeyHouseYoungsterRocketSuitText
	call PrintText
	jr .done
.normalBehavior
	ld hl, .VermilionPidgeyHouseYoungsterText
	call PrintText
.done
	jp TextScriptEnd
	
.VermilionPidgeyHouseYoungsterText:
	text_far _VermilionPidgeyHouseYoungsterText
	text_end

.VermilionPidgeyHouseYoungsterRocketSuitText:
	text_far _VermilionPidgeyHouseYoungsterRocketSuitText
	text_end

VermilionPidgeyHousePidgeyText:
	text_far _VermilionPidgeyHousePidgeyText
	text_asm
	ld a, PIDGEY
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

VermilionPidgeyHouseLetterText:
	text_far _VermilionPidgeyHouseLetterText
	text_end
