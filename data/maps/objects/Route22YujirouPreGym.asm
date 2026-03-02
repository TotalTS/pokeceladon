	object_const_def
	const_export ROUTE_22_YUJIROU_PRE_GYM_YUJIROU

Route22YujirouPreGym_Object:
	db $a

	def_warp_events
	warp_event  9,  5, ROUTE_22_GATE, 5

	def_bg_events

	def_object_events
	object_event  4,  1, SPRITE_SUPER_NERD, STAY, DOWN, TEXT_ROUTE22YUJIROU_YUJIROU, OPP_YUJIROU, 1

	def_warps_to ROUTE_22_YUJIROU_PRE_GYM
