	object_const_def

Route1West_Object:
	db $0F ; border block $43

	def_warp_events
	warp_event  2,  5, MYSTERY_CAVE, 9

	def_bg_events

	def_object_events

	def_warps_to ROUTE_1_WEST
