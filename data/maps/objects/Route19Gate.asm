	object_const_def
	const_export ROUTE19GATE_GUARD

Route19Gate_Object:
	db $a ; border block

	def_warp_events
	warp_event  4,  0, LAST_MAP, 2
	warp_event  5,  0, LAST_MAP, 3
	warp_event  4,  7, LAST_MAP, 4
	warp_event  5,  7, LAST_MAP, 4

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_GUARD, STAY, NONE, TEXT_ROUTE19GATE_GUARD

	def_warps_to ROUTE_19_GATE
