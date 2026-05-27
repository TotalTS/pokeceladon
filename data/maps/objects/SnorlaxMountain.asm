	object_const_def

SnorlaxMountain_Object:
	db $7d ; border block

	def_warp_events
	warp_event 6, 19, ROUTE_22, 2
	warp_event 7, 19, ROUTE_22, 2

	def_bg_events
	bg_event 7, 15, TEXT_SNORLAX_MOUNTAIN_SIGN

	def_object_events

	def_warps_to SNORLAX_MOUNTAIN
