SnorlaxMountain_Script:
	jp EnableAutoTextBoxDrawing

SnorlaxMountain_TextPointers:
	def_text_pointers
	dw_const SnorlaxMountainSignText,            TEXT_SNORLAX_MOUNTAIN_SIGN

SnorlaxMountainSignText:
	text_far _SnorlaxMountainSignText
	text_end
