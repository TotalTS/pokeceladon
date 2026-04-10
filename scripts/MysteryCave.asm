MysteryCave_Script:
	jp EnableAutoTextBoxDrawing

MysteryCave_TextPointers:
	def_text_pointers
	dw_const MysteryCaveSuperNerdText, TEXT_MYSTERYCAVE_SUPER_NERD
	
MysteryCaveSuperNerdText:
	text_far _MysteryCaveSuperNerdText
	text_end
