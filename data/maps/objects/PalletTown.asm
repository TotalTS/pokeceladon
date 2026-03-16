	object_const_def
	const_export PALLETTOWN_OAK
	const_export PALLETTOWN_GIRL
	const_export PALLETTOWN_FISHER

PalletTown_Object:
	db $b ; border block

	def_warp_events
	warp_event 11,  5, REDS_HOUSE_1F, 1
	warp_event 19,  5, BLUES_HOUSE, 1
	warp_event 18, 11, OAKS_LAB, 2

	def_bg_events
	bg_event 19, 13, TEXT_PALLETTOWN_OAKSLAB_SIGN
	bg_event 13,  9, TEXT_PALLETTOWN_SIGN
	bg_event  9,  5, TEXT_PALLETTOWN_PLAYERSHOUSE_SIGN
	bg_event 17,  5, TEXT_PALLETTOWN_RIVALSHOUSE_SIGN

	def_object_events
	object_event 14,  5, SPRITE_OAK, STAY, NONE, TEXT_PALLETTOWN_OAK
	object_event  9,  8, SPRITE_GIRL, WALK, ANY_DIR, TEXT_PALLETTOWN_GIRL
	object_event 17, 14, SPRITE_FISHER, WALK, ANY_DIR, TEXT_PALLETTOWN_FISHER

	def_warps_to PALLET_TOWN
