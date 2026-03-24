	object_const_def

MysteryCave_Object:
	db $7d ; border block

	def_warp_events
	warp_event 56, 35, BILLS_GARDEN, 1
	warp_event 57, 35, BILLS_GARDEN, 1
	warp_event 57, 31, MYSTERY_CAVE, 4
	warp_event 43, 25, MYSTERY_CAVE, 3
	warp_event 31, 25, MYSTERY_CAVE, 6
	warp_event 14, 16, MYSTERY_CAVE, 5
	warp_event 15, 23, MYSTERY_CAVE, 8
	warp_event 20, 30, MYSTERY_CAVE, 7
	warp_event  3, 25, ROUTE_1_WEST, 1
	warp_event  7,  5, ROUTE_0_WEST, 1
	warp_event 53,  7, ROUTE_0_EAST, 1

	def_bg_events

	def_object_events

	def_warps_to MYSTERY_CAVE
