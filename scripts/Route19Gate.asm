Route19Gate_Script:
	jp EnableAutoTextBoxDrawing

Route19Gate_TextPointers:
	def_text_pointers
	dw_const Route19GateGuardText, TEXT_ROUTE19GATE_GUARD

Route19GateGuardText:
	text_far _Route19GateGuardText
	text_end
