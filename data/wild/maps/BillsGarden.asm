BillsGardenWildMons:
	def_grass_wildmons 25 ; encounter rate
IF DEF(_RED)
	db 52, SANDSLASH
	db 34, VULPIX
	db 28, BELLSPROUT
	db 30, WEEPINBELL
	db 28, SANDSHREW
	db 28, MEOWTH
	db 28, PINSIR
	db 36, MAGMAR
	db 40, FARFETCHD
	db 40, JYNX
ENDC
IF DEF(_BLUE)
	db 52, ARBOK
	db 34, GROWLITHE
	db 28, ODDISH
	db 30, GLOOM
	db 28, EKANS
	db 28, MANKEY
	db 28, SCYTHER
	db 36, ELECTABUZZ
	db 40, MR_MIME
	db 40, LICKITUNG
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
