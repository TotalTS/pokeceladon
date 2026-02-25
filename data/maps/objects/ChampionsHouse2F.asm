const_export CHAMPIONSHOUSE2F_CUP
const_export CHAMPIONSHOUSE2F_PIKACHUDOLL

ChampionsHouse2F_Object:
	db $a ; border block

	def_warp_events
	warp_event  7,  1, CHAMPIONS_HOUSE_1F, 3

	def_bg_events
	bg_event  0,  1, TEXT_CHAMPIONSHOUSE2F_PC
	bg_event  3,  5, TEXT_CHAMPIONSHOUSE2F_SNES

	def_object_events
	object_event  4,  1, SPRITE_GOLD_TROPHY, STAY, NONE, TEXT_CHAMPIONSHOUSE2F_CUP
	object_event  4,  6, SPRITE_PIKACHU, STAY, DOWN, TEXT_CHAMPIONSHOUSE2F_PIKACHUDOLL

	def_warps_to CHAMPIONS_HOUSE_2F
