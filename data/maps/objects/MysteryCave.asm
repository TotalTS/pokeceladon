	object_const_def

MysteryCave_Object:
	db $7d ; border block

	def_warp_events
	warp_event 56, 19, BILLS_GARDEN, 1
	warp_event 57, 19, BILLS_GARDEN, 1
	warp_event 57, 15, MYSTERY_CAVE, 4
	warp_event 43,  9, MYSTERY_CAVE, 3
	warp_event 31,  9, MYSTERY_CAVE, 6
	warp_event 14,  0, MYSTERY_CAVE, 5
	warp_event 15,  7, MYSTERY_CAVE, 8
	warp_event 20, 14, MYSTERY_CAVE, 7
	warp_event  3,  9, ROUTE_1_WEST, 1

	def_bg_events

	def_object_events

	def_warps_to MYSTERY_CAVE
