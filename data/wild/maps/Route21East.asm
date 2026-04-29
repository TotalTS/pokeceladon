Route21EastWildMons:
	def_grass_wildmons 25 ; encounter rate
	db 21, RATTATA
	db 23, PIDGEY
	db 30, RATICATE
	db 23, RATTATA
	db 21, PIDGEY
	db 50, RATICATE
	db 52, PIDGEOT
	db 55, KANGASKHAN
	db 55, LICKITUNG
IF DEF(_RED)
	db 50, SCYTHER
ENDC
IF DEF(_BLUE)
	db 50, PINSIR
ENDC
	end_grass_wildmons

	def_water_wildmons 5 ; encounter rate
	db  5, TENTACOOL
	db 10, TENTACOOL
	db 15, TENTACOOL
	db  5, TENTACOOL
	db 10, TENTACOOL
	db 45, TENTACRUEL
	db 48, SEADRA
IF DEF(_RED)
	db 50, STARMIE
ENDC
IF DEF(_BLUE)
	db 50, CLOYSTER
ENDC
	db 55, GYARADOS
	db 60, LAPRAS
	end_water_wildmons
