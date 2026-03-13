BillsGarden_Script:
	call EnableAutoTextBoxDrawing
	ret

BillsGarden_ScriptPointers:
	def_script_pointers
	dw_const BillsGardenDefaultScript,              SCRIPT_BILLSGARDEN_DEFAULT

BillsGardenDefaultScript:
	ret

BillsGarden_TextPointers:
	def_text_pointers
