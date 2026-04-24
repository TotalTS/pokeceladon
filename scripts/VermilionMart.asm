VermilionMart_Script:
	jp EnableAutoTextBoxDrawing

VermilionMart_TextPointers:
	def_text_pointers
	dw_const VermilionMartClerkText,        TEXT_VERMILIONMART_CLERK
	dw_const VermilionMartCooltrainerMText, TEXT_VERMILIONMART_COOLTRAINER_M
	dw_const VermilionMartCooltrainerFText, TEXT_VERMILIONMART_COOLTRAINER_F

VermilionMartCooltrainerMText:
	text_asm
	ld a, [wIsRocketSuit]
	and a
	jr z, .normalBehavior
	ld hl, .VermilionMartCooltrainerMRocketSuitText
	call PrintText
	jr .done
.normalBehavior
	ld hl, .VermilionMartCooltrainerMText
	call PrintText
.done
	jp TextScriptEnd
	
.VermilionMartCooltrainerMText:
	text_far _VermilionMartCooltrainerMText
	text_end

.VermilionMartCooltrainerMRocketSuitText:
	text_far _VermilionMartCooltrainerMRocketSuitText
	text_end

VermilionMartCooltrainerFText:
	text_far _VermilionMartCooltrainerFText
	text_end
