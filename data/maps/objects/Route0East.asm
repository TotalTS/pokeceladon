	object_const_def

Route0East_Object:
	db $b ; border block

	def_warp_events
	warp_event 10, 5, MYSTERY_CAVE, 11

	def_bg_events
	bg_event  9,  7, TEXT_ROUTE_0_EAST_MYSTERY_CAVE_SIGN

	def_object_events

	def_warps_to ROUTE_0_EAST
