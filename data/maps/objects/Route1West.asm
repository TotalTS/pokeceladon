	object_const_def

Route1West_Object:
	db $b ; border block

	def_warp_events
	warp_event  8,  5, MYSTERY_CAVE, 9

	def_bg_events
	bg_event  7,  7, TEXT_ROUTE1WEST_MYSTERY_CAVE_SIGN

	def_object_events

	def_warps_to ROUTE_1_WEST
