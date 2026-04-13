	object_const_def

Route1Museum1F_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 2
	warp_event  3,  7, LAST_MAP, 2
	warp_event  2,  0, ROUTE_1_MUSEUM_1F, 5
	warp_event  3,  0, ROUTE_1_MUSEUM_1F, 6
	warp_event 28,  7, ROUTE_1_MUSEUM_1F, 3
	warp_event 29,  7, ROUTE_1_MUSEUM_1F, 4
	warp_event 17,  7, ROUTE_1_MUSEUM_1F, 8
	warp_event 69,  7, ROUTE_1_MUSEUM_1F, 7

	def_bg_events

	def_object_events
	object_event  8,  5, SPRITE_LINK_RECEPTIONIST, STAY, LEFT, TEXT_ROUTE1MUSEUM1F_RECEPTIONIST
	object_event  4,  3, SPRITE_SCIENTIST, STAY, NONE,  TEXT_ROUTE1MUSEUM1F_SCIENTIST
	object_event 16,  2, SPRITE_SCIENTIST, STAY, DOWN,  TEXT_ROUTE1MUSEUM1F_SCIENTIST2
	object_event 68,  1, SPRITE_HO_OH, STAY, NONE,  TEXT_ROUTE1MUSEUM1F_POKEMON
	object_event 69,  1, SPRITE_LUGIA, STAY, NONE,  TEXT_ROUTE1MUSEUM1F_POKEMON2
	object_event 32,  4, SPRITE_GRAMPS, STAY, DOWN, TEXT_ROUTE1MUSEUM1F_GRAMPS

	def_warps_to ROUTE_1_MUSEUM_1F
