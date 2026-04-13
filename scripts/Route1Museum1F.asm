Route1Museum1F_Script:
	jp EnableAutoTextBoxDrawing

Route1Museum1F_TextPointers:
	def_text_pointers
	dw_const Route1Museum1FRecepcionistText, TEXT_ROUTE1MUSEUM1F_RECEPTIONIST
	dw_const Route1Museum1FScientistText,    TEXT_ROUTE1MUSEUM1F_SCIENTIST
	dw_const Route1Museum1FScientist2Text,   TEXT_ROUTE1MUSEUM1F_SCIENTIST2
	dw_const Route1Museum1FSHoOhText,        TEXT_ROUTE1MUSEUM1F_HO_OH
	dw_const Route1Museum1FSLugiaText,       TEXT_ROUTE1MUSEUM1F_LUGIA
	dw_const Route1Museum1FSGrampsText,      TEXT_ROUTE1MUSEUM1F_GRAMPS

Route1Museum1FRecepcionistText:
	text_far _Route1Museum1FRecepcionistText
	text_end

Route1Museum1FScientistText:
	text_far _Route1Museum1FScientistText
	text_end

Route1Museum1FScientist2Text:
	text_far _Route1Museum1FScientist2Text
	text_end

Route1Museum1FSHoOhText:
	text_asm
    farcall HoOhShowSprite
    ld a, 1
    ld [wDoNotWaitForButtonPressAfterDisplayingText], a
    jp TextScriptEnd
	
Route1Museum1FSLugiaText:
	text_asm
    farcall LugiaShowSprite
    ld a, 1
    ld [wDoNotWaitForButtonPressAfterDisplayingText], a
    jp TextScriptEnd

Route1Museum1FSGrampsText:
	text_far _Route1Museum1FSGrampsText
	text_end
