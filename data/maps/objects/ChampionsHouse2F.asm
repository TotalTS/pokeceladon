ChampionsHouse2F_Object:
	db $a ; border block

	def_warp_events
	warp_event  7,  1, CHAMPIONS_HOUSE_1F, 3

	def_bg_events
	bg_event  0,  1, TEXT_CHAMPIONSHOUSE2F_PC
	bg_event  3,  5, TEXT_CHAMPIONSHOUSE2F_SNES

	def_object_events
;	object_event  2,  0, SPRITE_FAIRY, STAY, DOWN

	def_warps_to CHAMPIONS_HOUSE_2F
