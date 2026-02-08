	object_const_def
	const_export VERMILION_DOCK_MEW

VermilionDock_Object:
	db $f ; border block

	def_warp_events
	warp_event 14,  0, LAST_MAP, 6
	warp_event 14,  2, SS_ANNE_1F, 2

	def_bg_events

	def_object_events
	object_event 21,  0, SPRITE_MONSTER, STAY, DOWN, 2, MEW, 5

	def_warps_to VERMILION_DOCK
