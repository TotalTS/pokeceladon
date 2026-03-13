	object_const_def

BillsGarden_Object:
	db $2c ; border block

	def_warp_events

	def_bg_events
	bg_event 11, 49, TEXT_BILLS_GARDEN_SIGN
	bg_event 13,  5, TEXT_BILLS_GARDEN_MYSTERY_CAVE_SIGN

	def_object_events

	def_warps_to BILLS_GARDEN
