	object_const_def

Route0West_Object:
	db $b ; border block

	def_warp_events
	warp_event 6, 7, MYSTERY_CAVE, 10

	def_bg_events
	bg_event  5,  9, TEXT_ROUTE_0_WEST_MYSTERY_CAVE_SIGN

	def_object_events

	def_warps_to ROUTE_0_WEST
