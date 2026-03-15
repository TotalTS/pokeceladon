MysteryCaveWildMons:
	def_grass_wildmons 10 ; encounter rate
IF DEF(_RED)
	db 52, SANDSLASH
	db 52, NINETALES
	db 52, VICTREEBEL
	db 52, PERSIAN
	db 50, MACHAMP
	db 50, GENGAR
	db 40, JYNX
	db 40, MR_MIME
	db 50, GOLEM
	db 50, ALAKAZAM
ENDC
IF DEF(_BLUE)
	db 52, ARBOK
	db 52, ARCANINE
	db 52, VILEPLUME
	db 52, PRIMEAPE
	db 50, GOLEM
	db 50, ALAKAZAM
	db 40, MR_MIME
	db 40, JYNX
	db 50, MACHAMP
	db 50, GENGAR
ENDC
	end_grass_wildmons

	def_water_wildmons 5 ; encounter rate
	db 60, GYARADOS
	db 50, DRAGONAIR
	db 60, DRAGONITE
	db 50, SEAKING
	db 50, KINGLER
	db 50, SLOWBRO
	db 50, SEADRA
	db 60, GYARADOS
	db 50, DRAGONAIR
	db 60, DRAGONITE
	end_water_wildmons
