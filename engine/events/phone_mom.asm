MomPhone_RunDialogue::
	call MomPhone_StatusText
	call MomPhone_CheckPokemonText
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .Champion
	call MomPhone_CheckProgressText
	CheckEvent EVENT_BEAT_BLAINE
	jr nz, .skipHM
	call MomPhone_CheckHMText
.skipHM
	CheckEvent EVENT_BEAT_ROUTE22_RIVAL_2ND_BATTLE
	jr nz, .skipGym
	ld a, [wLastGymEvent]
	and a
	jr z, .skipGym
	call MomPhone_CheckGymText
.skipGym
	CheckEvent EVENT_PASSED_EARTHBADGE_CHECK
	jr nz, .skipRival
	call MomPhone_CheckRivalText
.skipRival
	call CheckAnyVictoryRoadTrainerBeaten
	jr nz, .skipBadge
	call MomPhone_CheckBadgeCheckText
.skipBadge
	jr .End
.Champion
	ld hl, MomPhoneText_Champion
	call PrintText
.End
	ret

MomPhone_StatusText:
	; Check fainted first
	ld hl, wPartyMon1HP
	ld a, [hli]
	or [hl]
	jr nz, .checkStatus
	ld hl, MomPhoneText_StatusFainted
	jr .doneCheckStatus
.checkStatus
	ld a, [wPartyMon1Status]
	and a
	jr z, .healthy
	; Sleep (multi-bit)
	and SLP_MASK
	jr nz, .asleep
	ld a, [wPartyMon1Status]
	; Freeze
	bit FRZ, a
	jr nz, .frozen
	; Paralysis
	bit PAR, a
	jr nz, .paralyzed
	; Burn
	bit BRN, a
	jr nz, .burned
	; Poison
	bit PSN, a
	jr nz, .poisoned
.healthy
	ld hl, MomPhoneText_StatusOK
	jr .doneCheckStatus
.poisoned
	ld hl, MomPhoneText_StatusPoisoned
	jr .doneCheckStatus
.paralyzed
	ld hl, MomPhoneText_StatusParalyzed
	jr .doneCheckStatus
.burned
	ld hl, MomPhoneText_StatusBurned
	jr .doneCheckStatus
.frozen
	ld hl, MomPhoneText_StatusFrozen
	jr .doneCheckStatus
.asleep
	ld hl, MomPhoneText_StatusAsleep
	jr .doneCheckStatus
.doneCheckStatus
	ld a, [wPartyMon1Species]
	ld [wNamedObjectIndex], a
	call GetMonName
	call PrintText
	ret
	
MomPhoneText_StatusOK:
	text_far _MomPhoneText_StatusOK
	text_end
	
MomPhoneText_StatusPoisoned:
	text_far _MomPhoneText_StatusPoisoned
	text_end
	
MomPhoneText_StatusParalyzed:
	text_far _MomPhoneText_StatusParalyzed
	text_end

MomPhoneText_StatusBurned:
	text_far _MomPhoneText_StatusBurned
	text_end

MomPhoneText_StatusFrozen:
	text_far _MomPhoneText_StatusFrozen
	text_end

MomPhoneText_StatusAsleep:
	text_far _MomPhoneText_StatusAsleep
	text_end
	
MomPhoneText_StatusFainted:
	text_far _MomPhoneText_StatusFainted
	text_end

MomPhone_CheckPokemonText:
	; higher priority first
	CheckEvent EVENT_FOUND_MEW
	jr nz, .Mew
	CheckEvent EVENT_BEAT_MEWTWO
	jr nz, .Mewtwo
	CheckEvent EVENT_BEAT_MOLTRES
	jr nz, .Moltres
	CheckEvent EVENT_BEAT_ARTICUNO
	jr nz, .Articuno
	CheckEvent EVENT_BEAT_ZAPDOS
	jr nz, .Zapdos
	ld a, [wStatusFlags4]
	bit BIT_GOT_LAPRAS, a
	jr nz, .Lapras
	CheckEvent EVENT_GOT_HITMONLEE
	jr nz, .Hitmonlee
	CheckEvent EVENT_GOT_HITMONCHAN
	jr nz, .Hitmonchan
	CheckEvent EVENT_GOT_UNIVERSITY_MAGIKARP
	jr nz, .Magikarp
	CheckEvent EVENT_GOT_EEVEE
	jr nz, .Eevee
	CheckEvent EVENT_GOT_SQUIRTLE_FROM_OFFICER_JENNY
	jr nz, .Squirtle
	CheckEvent EVENT_GOT_CHARMANDER_FROM_DAMIAN
	jr nz, .Charmander
	CheckEvent EVENT_GOT_BULBASAUR_IN_CERULEAN
	jr nz, .Bulbasaur
	ret
.Mew
	ld hl, MomPhoneText_Mew
	jr .doneCheckPokemon
.Mewtwo
	ld hl, MomPhoneText_Mewtwo
	jr .doneCheckPokemon
.Moltres
	ld hl, MomPhoneText_Moltres
	jr .doneCheckPokemon
.Articuno
	ld hl, MomPhoneText_Articuno
	jr .doneCheckPokemon
.Zapdos
	ld hl, MomPhoneText_Zapdos
	jr .doneCheckPokemon
.Lapras
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr nz, .returnCheckPokemon
	ld hl, MomPhoneText_Lapras
	jr .doneCheckPokemon
.Hitmonlee
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr nz, .returnCheckPokemon
	ld hl, MomPhoneText_Hitmonlee
	jr .doneCheckPokemon
.Hitmonchan
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr nz, .returnCheckPokemon
	ld hl, MomPhoneText_Hitmonchan
	jr .doneCheckPokemon
.Magikarp
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	jr nz, .returnCheckPokemon
	ld hl, MomPhoneText_Magikarp
	jr .doneCheckPokemon
.Eevee
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	jr nz, .returnCheckPokemon
	ld hl, MomPhoneText_Eevee
	jr .doneCheckPokemon
.Squirtle
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	jr nz, .returnCheckPokemon
	ld hl, MomPhoneText_Squirtle
	jr .doneCheckPokemon
.Charmander
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	jr nz, .returnCheckPokemon
	ld hl, MomPhoneText_Charmander
	jr .doneCheckPokemon
.Bulbasaur
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	jr nz, .returnCheckPokemon
	ld hl, MomPhoneText_Bulbasaur
	jr .doneCheckPokemon
.returnCheckPokemon
	ret
.doneCheckPokemon
	call PrintText
	ret
	
MomPhoneText_Mew:
	text_far _MomPhoneText_Mew
	text_end

MomPhoneText_Mewtwo:
	text_far _MomPhoneText_Mewtwo
	text_end
	
MomPhoneText_Moltres:
	text_far _MomPhoneText_Moltres
	text_end

MomPhoneText_Articuno:
	text_far _MomPhoneText_Articuno
	text_end

MomPhoneText_Zapdos:
	text_far _MomPhoneText_Zapdos
	text_end

MomPhoneText_Lapras:
	text_far _MomPhoneText_Lapras
	text_end

MomPhoneText_Hitmonlee:
	text_far _MomPhoneText_Hitmonlee
	text_end

MomPhoneText_Hitmonchan:
	text_far _MomPhoneText_Hitmonchan
	text_end

MomPhoneText_Magikarp:
	text_far _MomPhoneText_Magikarp
	text_end

MomPhoneText_Eevee:
	text_far _MomPhoneText_Eevee
	text_end

MomPhoneText_Squirtle:
	text_far _MomPhoneText_Squirtle
	text_end

MomPhoneText_Charmander:
	text_far _MomPhoneText_Charmander
	text_end

MomPhoneText_Bulbasaur:
	text_far _MomPhoneText_Bulbasaur
	text_end
	
MomPhone_CheckProgressText:
	ld a, [wLastProgressEvent]
	cp PROGRESS_CINNABAR
	jr z, .Cinnabar
	cp PROGRESS_FUCHSIA
	jr z, .Fuchsia
	cp PROGRESS_SAFFRON
	jr z, .Saffron
	cp PROGRESS_CELADON
	jr z, .Celadon
	cp PROGRESS_LAVENDER_LATE
	jr z, .LavenderLate
	; default
	jp MomPhone_CheckLavenderEarly
.Cinnabar
	jp MomPhone_CheckCinnabarText
.Fuchsia
	jp MomPhone_CheckFuchsiaText
.Saffron
	jp MomPhone_CheckSaffronText
.Celadon
	jp MomPhone_CheckCeladon
.LavenderLate
	jp MomPhone_CheckLavenderLate

MomPhone_CheckHMText:
	; higher priority first
	CheckEvent EVENT_GOT_HM04
	jr nz, .Strength
	CheckEvent EVENT_GOT_HM03
	jr nz, .Surf
	CheckEvent EVENT_GOT_HM02
	jr nz, .Fly
	ret ; none
.Strength
	ld hl, MomPhoneText_Strength
	jr .doneCheckHM
.Surf
	ld hl, MomPhoneText_Surf
	jr .doneCheckHM
.Fly
	ld hl, MomPhoneText_Fly
	jr .doneCheckHM
.doneCheckHM
	call PrintText
	ret

MomPhoneText_Fly:
	text_far _MomPhoneText_Fly
	text_end

MomPhoneText_Surf:
	text_far _MomPhoneText_Surf
	text_end

MomPhoneText_Strength:
	text_far _MomPhoneText_Strength
	text_end

MomPhone_CheckLavenderEarly:
	; Lavender Part 1
	CheckEvent EVENT_ROCK_TUNNEL_FLASH_HELP2
	jr nz, .FlashHelp
	CheckEvent EVENT_ROCK_TUNNEL_FLASH_HELP
	jr nz, .FlashHelp
	ld hl, MomPhoneText_Flash
	jr .doneCheckLavenderEarly
.FlashHelp
	ld hl, MomPhoneText_FlashHelp1or2
	jr .doneCheckLavenderEarly
.doneCheckLavenderEarly
	call PrintText
	ret
	
MomPhoneText_Flash:
	text_far _MomPhoneText_Flash
	text_end

MomPhoneText_FlashHelp1or2:
	text_far _MomPhoneText_FlashHelp1or2
	text_end

MomPhone_CheckCeladon:
	CheckEvent EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI
	jr nz, .GiovanniCeladon
	CheckEvent EVENT_FOUND_ROCKET_HIDEOUT
	jr nz, .RocketHideout
.RocketHideout
	ld hl, MomPhoneText_RocketHideoutFound
	jr .doneCheckCeladon
.GiovanniCeladon
	ld hl, MomPhoneText_GiovanniCeladon
	jr .doneCheckCeladon
.doneCheckCeladon
	call PrintText
	ret

MomPhoneText_RocketHideoutFound:
	text_far _MomPhoneText_RocketHideoutFound
	text_end

MomPhoneText_GiovanniCeladon:
	text_far _MomPhoneText_GiovanniCeladon
	text_end
	
MomPhone_CheckLavenderLate:
	; Lavender Part 2
	CheckEvent EVENT_GOT_POKE_FLUTE
	jr nz, .Flute
	CheckEvent EVENT_RESCUED_MR_FUJI
	jr nz, .Fuji
	CheckEvent EVENT_BEAT_GHOST_MAROWAK
	jr nz, .Marowak
.Marowak
	ld hl, MomPhoneText_Marowak
	jr .doneCheckLavenderLate
.Fuji
	ld hl, MomPhoneText_Marowak
	call PrintText
	ld hl, MomPhoneText_Fuji
	jr .doneCheckLavenderLate
.Flute
	ld hl, MomPhoneText_Marowak
	call PrintText
	ld hl, MomPhoneText_Fuji
	call PrintText
	ld hl, MomPhoneText_Flute
	jr .doneCheckLavenderLate
.doneCheckLavenderLate
	call PrintText
	ret
	
MomPhoneText_Marowak:
	text_far _MomPhoneText_Marowak
	text_end
	
MomPhoneText_Fuji:
	text_far _MomPhoneText_Fuji
	text_end
	
MomPhoneText_Flute:
	text_far _MomPhoneText_Flute
	text_end

MomPhone_CheckSaffronText:
	; higher priority first
	CheckEvent EVENT_GOT_MASTER_BALL
	jr nz, .MasterBall
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	jr nz, .GiovanniSilph
	ld a, [wTownVisitedFlag + 1]
	bit 2, a ; SAFFRON_CITY
	jr z, .doneCheckSaffron
	ld a, [wStatusFlags1]
	bit BIT_GAVE_SAFFRON_GUARDS_DRINK, a
	jr z, .SilphBlocked
	CheckEvent EVENT_RESCUED_MR_FUJI
	jr z, .SilphBlocked
	jr .GuardSleeping
.GiovanniSilph
	ld hl, MomPhoneText_GiovanniSilph
	jr .printCheckSaffron
.MasterBall
	ld hl, MomPhoneText_GiovanniSilph
	call PrintText
	ld hl, MomPhoneText_MasterBall
	jr .printCheckSaffron
.GuardSleeping
	ld hl, MomPhoneText_GuardSleeping
	jr .printCheckSaffron
.SilphBlocked
	ld hl, MomPhoneText_SilphCoBlocked
	jr .printCheckSaffron
.doneCheckSaffron
	ret
.printCheckSaffron
	call PrintText
	ret

MomPhoneText_SilphCoBlocked:
	text_far _MomPhoneText_SilphCoBlocked
	text_end

MomPhoneText_GuardSleeping:
	text_far _MomPhoneText_GuardSleeping
	text_end

MomPhoneText_GiovanniSilph:
	text_far _MomPhoneText_GiovanniSilph
	text_end

MomPhoneText_MasterBall:
	text_far _MomPhoneText_MasterBall
	text_end

MomPhone_CheckFuchsiaText:
	CheckEvent EVENT_GAVE_GOLD_TEETH
	jr nz, .GoldTeeth
	ld a, [wTownVisitedFlag]
	bit 7, a ; FUCHSIA_CITY
	jr z, .doneCheckFuchsia
	CheckEvent EVENT_BEAT_ROUTE12_SNORLAX
	jr z, .checkRoute16
	CheckEvent EVENT_BEAT_ROUTE16_SNORLAX
	jr nz, .BothSnorlax
.checkRoute16
	CheckEvent EVENT_BEAT_ROUTE16_SNORLAX
	jr nz, .Snorlax16
	CheckEvent EVENT_BEAT_ROUTE12_SNORLAX
	jr nz, .Snorlax12
	ret
.BothSnorlax
	ld hl, MomPhoneText_BothSnorlax
	jr .printCheckFuchsia
.Snorlax12
	ld hl, MomPhoneText_Snorlax12
	jr .printCheckFuchsia
.Snorlax16
	ld hl, MomPhoneText_Snorlax16
	jr .printCheckFuchsia
.GoldTeeth
	CheckEvent EVENT_BEAT_BLAINE
	jr nz, .doneCheckFuchsia
	ld hl, MomPhoneText_GoldTeeth
	jr .printCheckFuchsia
.printCheckFuchsia
	call PrintText
.doneCheckFuchsia
	ret
	
MomPhoneText_Snorlax12:
	text_far _MomPhoneText_Snorlax12
	text_end

MomPhoneText_Snorlax16:
	text_far _MomPhoneText_Snorlax16
	text_end

MomPhoneText_BothSnorlax:
	text_far _MomPhoneText_BothSnorlax
	text_end

MomPhoneText_GoldTeeth:
	text_far _MomPhoneText_GoldTeeth
	text_end

MomPhone_CheckCinnabarText:
	; higher priority first
	CheckEvent EVENT_MANSION_SECRET_KEY
	jr nz, .SecretKey
	CheckEvent EVENT_GAVE_FOSSIL_TO_LAB
	jr nz, .Fossil
	ret
.SecretKey
	CheckEvent EVENT_BEAT_BLAINE
	jr nz, .returnCheckCinnabar
	ld hl, MomPhoneText_SecretKey
	jr .doneCheckCinnabar
.Fossil
	ld hl, MomPhoneText_FossilToLab
	jr .doneCheckCinnabar
.doneCheckCinnabar
	call PrintText
	ret
.returnCheckCinnabar
	ret
	
MomPhoneText_FossilToLab:
	text_far _MomPhoneText_FossilToLab
	text_end

MomPhoneText_SecretKey:
	text_far _MomPhoneText_SecretKey
	text_end

MomPhone_CheckGymText:
	; higher priority first
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr nz, .GiovanniViridian
	ld a, [wLastGymEvent]
	cp GYM_VIRIDIAN_OPEN
	jr z, .ViridianGymOpen
	cp GYM_BLAINE
	jr z, .Blaine
	cp GYM_KOGA
	jr z, .Koga
	cp GYM_SABRINA
	jr z, .Sabrina
	cp GYM_ERIKA
	jr z, .Erika
	cp GYM_KARATE_MASTER
	jr z, .KarateMaster
	ret

.GiovanniViridian
	ld hl, MomPhoneText_GiovanniViridian
	jr .doneCheckGym
.ViridianGymOpen
	ld hl, MomPhoneText_ViridianGymOpen
	jr .doneCheckGym
.Blaine
	ld hl, MomPhoneText_Blaine
	jr .doneCheckGym
.Koga
	ld hl, MomPhoneText_Koga
	jr .doneCheckGym
.Sabrina
	ld hl, MomPhoneText_Sabrina
	jr .doneCheckGym
.Erika
	ld hl, MomPhoneText_Erika
	jr .doneCheckGym
.KarateMaster
	ld hl, MomPhoneText_KarateMaster
	jr .doneCheckGym
.doneCheckGym
	call PrintText
	ret

MomPhoneText_Erika:
	text_far _MomPhoneText_Erika
	text_end

MomPhoneText_KarateMaster:
	text_far _MomPhoneText_KarateMaster
	text_end

MomPhoneText_Sabrina:
	text_far _MomPhoneText_Sabrina
	text_end

MomPhoneText_Koga:
	text_far _MomPhoneText_Koga
	text_end

MomPhoneText_Blaine:
	text_far _MomPhoneText_Blaine
	text_end

MomPhoneText_ViridianGymOpen:
	text_far _MomPhoneText_ViridianGymOpen
	text_end

MomPhoneText_GiovanniViridian:
	text_far _MomPhoneText_GiovanniViridian
	text_end

MomPhone_CheckRivalText:
	; higher priority first
	CheckEvent EVENT_BEAT_ROUTE22_RIVAL_2ND_BATTLE
	jr nz, .RivalRoute22
	CheckEvent EVENT_BEAT_SILPH_CO_RIVAL
	jr nz, .RivalSilph
	CheckEvent EVENT_BEAT_POKEMON_TOWER_RIVAL
	jr nz, .RivalTower
	ret
.RivalRoute22
	ld hl, MomPhoneText_RivalRoute22
	jr .doneCheckRival
.RivalSilph
	CheckEvent EVENT_BEAT_SABRINA
	jr nz, .returnCheckRival
	ld hl, MomPhoneText_RivalSilph
	jr .doneCheckRival
.RivalTower
	CheckEvent EVENT_RESCUED_MR_FUJI
	jr nz, .returnCheckRival
	ld hl, MomPhoneText_RivalTower
	jr .doneCheckRival
.doneCheckRival
	call PrintText
	ret
.returnCheckRival
	ret
	
MomPhoneText_RivalTower:
	text_far _MomPhoneText_RivalTower
	text_end

MomPhoneText_RivalSilph:
	text_far _MomPhoneText_RivalSilph
	text_end

MomPhoneText_RivalRoute22:
	text_far _MomPhoneText_RivalRoute22
	text_end

MomPhone_CheckBadgeCheckText:
	; higher priority first
	CheckEvent EVENT_PASSED_EARTHBADGE_CHECK
	jr nz, .Earth
	CheckEvent EVENT_PASSED_VOLCANOBADGE_CHECK
	jr nz, .Volcano
	CheckEvent EVENT_PASSED_MARSHBADGE_CHECK
	jr nz, .Marsh
	CheckEvent EVENT_PASSED_SOULBADGE_CHECK
	jr nz, .Soul
	CheckEvent EVENT_PASSED_RAINBOWBADGE_CHECK
	jr nz, .Rainbow
	CheckEvent EVENT_PASSED_THUNDERBADGE_CHECK
	jr nz, .Thunder
	CheckEvent EVENT_PASSED_CASCADEBADGE_CHECK
	jr nz, .Cascade
	ret
.Earth
	ld hl, MomPhoneText_EarthBadgeCheck
	jr .doneCheckBadge
.Volcano
	ld hl, MomPhoneText_VolcanoBadgeCheck
	jr .doneCheckBadge
.Marsh
	ld hl, MomPhoneText_MarshBadgeCheck
	jr .doneCheckBadge
.Soul
	ld hl, MomPhoneText_SoulBadgeCheck
	jr .doneCheckBadge
.Rainbow
	ld hl, MomPhoneText_RainbowBadgeCheck
	jr .doneCheckBadge
.Thunder
	ld hl, MomPhoneText_ThunderBadgeCheck
	jr .doneCheckBadge
.Cascade
	ld hl, MomPhoneText_CascadeBadgeCheck
	jr .doneCheckBadge
.doneCheckBadge
	call PrintText
	ret
	
MomPhoneText_CascadeBadgeCheck:
	text_far _MomPhoneText_CascadeBadgeCheck
	text_end

MomPhoneText_ThunderBadgeCheck:
	text_far _MomPhoneText_ThunderBadgeCheck
	text_end

MomPhoneText_RainbowBadgeCheck:
	text_far _MomPhoneText_RainbowBadgeCheck
	text_end

MomPhoneText_SoulBadgeCheck:
	text_far _MomPhoneText_SoulBadgeCheck
	text_end

MomPhoneText_MarshBadgeCheck:
	text_far _MomPhoneText_MarshBadgeCheck
	text_end

MomPhoneText_VolcanoBadgeCheck:
	text_far _MomPhoneText_VolcanoBadgeCheck
	text_end

MomPhoneText_EarthBadgeCheck:
	text_far _MomPhoneText_EarthBadgeCheck
	text_end

MomPhoneText_Champion:
	text_far _MomPhoneText_Champion
	text_end

CheckAnyVictoryRoadTrainerBeaten:
	CheckEvent EVENT_BEAT_VICTORY_ROAD_1_TRAINER_0
	ret nz
	CheckEvent EVENT_BEAT_VICTORY_ROAD_2_TRAINER_1
	ret nz
	CheckEvent EVENT_BEAT_VICTORY_ROAD_2_TRAINER_2
	ret nz
	CheckEvent EVENT_BEAT_VICTORY_ROAD_2_TRAINER_3
	ret nz
	CheckEvent EVENT_BEAT_VICTORY_ROAD_2_TRAINER_4
	ret nz
	xor a
	ret
