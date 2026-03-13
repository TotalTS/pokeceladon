	object_const_def
	const_export BILLSHOUSE_BILL_POKEMON
	const_export BILLSHOUSE_BILL1
	const_export BILLSHOUSE_BILL2

BillsHouse_Object:
	db $d ; border block

	def_warp_events
	warp_event  2, 21, LAST_MAP, 1
	warp_event  3, 21, LAST_MAP, 1
	warp_event 15,  8, LAST_MAP, 2
	warp_event  3,  0, ROUTE_25, 3

	def_bg_events

	def_object_events
	object_event  6, 19, SPRITE_MONSTER, STAY, NONE, TEXT_BILLSHOUSE_BILL_POKEMON
	object_event  4, 18, SPRITE_BILL, STAY, NONE, TEXT_BILLSHOUSE_BILL_SS_TICKET
	object_event  6, 19, SPRITE_BILL, STAY, NONE, TEXT_BILLSHOUSE_BILL_CHECK_OUT_MY_RARE_POKEMON

	def_warps_to BILLS_HOUSE
