BillsGardenWildMons:
	def_grass_wildmons 25 ; encounter rate
IF DEF(_RED)
	db 45, PORYGON
	db 35, VULPIX
	db 35, BELLSPROUT
	db 40, WEEPINBELL
	db 30, SANDSHREW
	db 30, MEOWTH
	db 50, PINSIR
	db 50, MAGMAR
	db 45, FARFETCHD
	db 45, LICKITUNG
ENDC
IF DEF(_BLUE)
	db 45, PORYGON
	db 35, GROWLITHE
	db 35, ODDISH
	db 40, GLOOM
	db 30, EKANS
	db 30, MANKEY
	db 50, SCYTHER
	db 50, ELECTABUZZ
	db 45, FARFETCHD
	db 45, LICKITUNG
ENDC
	end_grass_wildmons

	def_water_wildmons 5 ; encounter rate
	db 50, GYARADOS
	db 50, DRAGONAIR
	db 30, DRATINI
	db 50, SEAKING
	db 50, KINGLER
	db 50, SLOWBRO
	db 50, SEADRA
	db 30, HORSEA
	db 30, KRABBY
	db 30, GOLDEEN
	end_water_wildmons
