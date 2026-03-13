BillsGarden_Script:
	jp EnableAutoTextBoxDrawing

BillsGarden_TextPointers:
	def_text_pointers
	dw_const BillsGardenSignText,            TEXT_BILLS_GARDEN_SIGN
	dw_const BillsGardenMysteryCaveSignText, TEXT_BILLS_GARDEN_MYSTERY_CAVE_SIGN

BillsGardenSignText:
	text_far _BillsGardenSignText
	text_end

BillsGardenMysteryCaveSignText:
	text_far _BillsGardenMysteryCaveSignText
	text_end
