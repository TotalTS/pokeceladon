	object_const_def

Route1SouthWest_Object:
	db $0A ; border block

	def_warp_events

	def_bg_events
	bg_event    5,  9, TEXT_ROUTE1SOUTHWEST_MYSTERY_CAVE_SIGN

	def_object_events

	def_warps_to ROUTE_1_SOUTH_WEST
