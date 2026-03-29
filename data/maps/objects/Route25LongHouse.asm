	object_const_def
	const_export ROUTE25LONGHOUSE_SKATER

Route25LongHouse_Object:
	db $c ; border block

	def_warp_events
	warp_event  2, 7, LAST_MAP, 5
	warp_event  3, 7, LAST_MAP, 5

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_HIKER, STAY, RIGHT, TEXT_ROUTE25LONGHOUSE_SKATER

	def_warps_to ROUTE_25_LONG_HOUSE
