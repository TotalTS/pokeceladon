	object_const_def
	const_export CHAMPIONSHOUSE1F_MOM

ChampionsHouse1F_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 1
	warp_event  3,  7, LAST_MAP, 1
	warp_event  7,  1, CHAMPIONS_HOUSE_2F, 1

	def_bg_events
	bg_event  3,  1, TEXT_CHAMPIONSHOUSE1F_TV

	def_object_events
	object_event  2,  4, SPRITE_DAISY, STAY, RIGHT, TEXT_CHAMPIONSHOUSE1F_DAISY
	object_event  6,  4, SPRITE_OAK, WALK, UP_DOWN, TEXT_CHAMPIONSHOUSE1F_OAK
	object_event  5,  4, SPRITE_MOM, STAY, LEFT, TEXT_CHAMPIONSHOUSE1F_MOM

	def_warps_to CHAMPIONS_HOUSE_1F
