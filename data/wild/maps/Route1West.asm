Route1WestWildMons:
	def_grass_wildmons 25 ; encounter rate
	db  3, PIDGEY
	db  3, RATTATA
	db  3, RATTATA
	db  2, RATTATA
	db  2, PIDGEY
IF DEF(_RED)
	db 55, BUTTERFREE
	db 48, PERSIAN
ENDC
IF DEF(_BLUE)
	db 55, BEEDRILL
	db 48, PRIMEAPE
ENDC
	db 52, NIDOQUEEN
	db 52, NIDOKING
	db 60, SNORLAX
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
