CeladonMart1F_Script:
	jp EnableAutoTextBoxDrawing

CeladonMart1F_TextPointers:
	def_text_pointers
	dw_const CeladonMart1FReceptionistText,     TEXT_CELADONMART1F_RECEPTIONIST
	dw_const CeladonMart1FDirectorySignText,    TEXT_CELADONMART1F_DIRECTORY_SIGN
	dw_const CeladonMart1FCurrentFloorSignText, TEXT_CELADONMART1F_CURRENT_FLOOR_SIGN
	dw_const CeladonMart1FPhoneText,            TEXT_CELADONMART1F_PHONE

CeladonMart1FReceptionistText:
	text_far _CeladonMart1FReceptionistText
	text_end

CeladonMart1FDirectorySignText:
	text_far _CeladonMart1FDirectorySignText
	text_end

CeladonMart1FCurrentFloorSignText:
	text_far _CeladonMart1FCurrentFloorSignText
	text_end

CeladonMart1FPhoneText:
	text_asm
	ld hl, .CeladonMart1FPhoneText
	call PrintText
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a	
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, CeladonMart1FPhoneChoiceEnd
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a

	ld a, SFX_CALL
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld hl, .CeladonMart1FPhoneEllipseText
	call PrintText
	ld a, SFX_CALL
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld hl, .CeladonMart1FPhoneEllipseText
	call PrintText
	ld hl, .MomPhoneText_Default
	call PrintText
	call MomPhone_StatusText
	call MomPhone_CheckPokemonText
	call MomPhone_CheckHMText
	call MomPhone_CheckLavenderText
	ld hl, .MomPhoneText_EndText
	call PrintText
	ld hl, .PhoneClickText
	call PrintText
	ld a, SFX_HANG_UP
	call PlaySound
	ld c, 40
	call DelayFrames
	ld hl, .CeladonMart1FPhoneEllipseText
	call PrintText
	ld c, 40
	call DelayFrames
	ld hl, .CeladonMart1FPhoneEllipseText
	call PrintText
	ld c, 40
	call DelayFrames
	ld hl, .CeladonMart1FPhoneEllipseText
	call PrintText
	ld c, 40
	call DelayFrames
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a	
	jp TextScriptEnd

.CeladonMart1FPhoneText
	text_far _CeladonMart1FPhoneText
	text_end

.CeladonMart1FPhoneEllipseText
	text_far _CeladonMart1FPhoneEllipseText
	text_end
	
.MomPhoneText_Default
	text_far _MomPhoneText_Default
	text_end
	
.MomPhoneText_EndText
	text_far _MomPhoneText_EndText
	text_end
	
.PhoneClickText
	text_far _PhoneClickText
	text_end

CeladonMart1FPhoneChoiceEnd:
	jp TextScriptEnd


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
	CheckEvent EVENT_GOT_HITMONLEE
	jr nz, .Hitmonlee
	CheckEvent EVENT_GOT_HITMONCHAN
	jr nz, .Hitmonchan
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
.Hitmonlee
	ld hl, MomPhoneText_Hitmonlee
	jr .doneCheckPokemon
.Hitmonchan
	ld hl, MomPhoneText_Hitmonchan
	jr .doneCheckPokemon
.Squirtle
	ld hl, MomPhoneText_Squirtle
	jr .doneCheckPokemon
.Charmander
	ld hl, MomPhoneText_Charmander
	jr .doneCheckPokemon
.Bulbasaur
	ld hl, MomPhoneText_Bulbasaur
	jr .doneCheckPokemon
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

MomPhoneText_Hitmonlee:
	text_far _MomPhoneText_Hitmonlee
	text_end

MomPhoneText_Hitmonchan:
	text_far _MomPhoneText_Hitmonchan
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

MomPhone_CheckLavenderText:
	; higher priority first
	CheckEvent EVENT_GOT_POKE_FLUTE
	jr z, .checkFuji
	ld hl, MomPhoneText_Marowak
	call PrintText
	ld hl, MomPhoneText_Fuji
	call PrintText
	ld hl, MomPhoneText_Flute
	call PrintText
	ret
.checkFuji
	CheckEvent EVENT_RESCUED_MR_FUJI
	jr z, .checkMarowak
	ld hl, MomPhoneText_Marowak
	call PrintText
	ld hl, MomPhoneText_Fuji
	call PrintText
	ret
.checkMarowak
	CheckEvent EVENT_BEAT_GHOST_MAROWAK
	jr z, .checkFlashHelp
	ld hl, MomPhoneText_Marowak
	call PrintText
	ret
.checkFlashHelp
	CheckEvent EVENT_ROCK_TUNNEL_FLASH_HELP2
	jr nz, .FlashHelp
	CheckEvent EVENT_ROCK_TUNNEL_FLASH_HELP
	jr nz, .FlashHelp
.checkFlash
	CheckEvent EVENT_GOT_HM05
	jr nz, .Flash
.Flash
	ld hl, MomPhoneText_Flash
	call PrintText
	ret
.FlashHelp
	ld hl, MomPhoneText_FlashHelp1or2
	call PrintText
	ret
	
MomPhoneText_Flash:
	text_far _MomPhoneText_Flash
	text_end

MomPhoneText_FlashHelp1or2:
	text_far _MomPhoneText_FlashHelp1or2
	text_end
	
MomPhoneText_Marowak:
	text_far _MomPhoneText_Marowak
	text_end
	
MomPhoneText_Fuji:
	text_far _MomPhoneText_Fuji
	text_end
	
MomPhoneText_Flute:
	text_far _MomPhoneText_Flute
	text_end

MomPhone_CheckCeladonText:
	; higher priority first
	CheckEvent EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI
	jr nz, .Giovanni
	CheckEvent EVENT_FOUND_ROCKET_HIDEOUT
	jr nz, .RocketHideout
	ret ; none
.Giovanni
	ld hl, MomPhoneText_GiovanniCeladon
	jr .doneCheckCeladon
.RocketHideout
	ld hl, MomPhoneText_RocketHideoutFound
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

MomPhone_CheckSaffronText:
	; higher priority first
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	jr nz, .GiovanniSilph
	CheckEvent EVENT_GOT_MASTER_BALL
	jr nz, .MasterBall
	CheckEvent EVENT_RESCUED_MR_FUJI
	jr z, .checkVisitedOnly
	ld a, [wTownVisitedFlag + 1]
	bit 2, a ; SAFFRON_CITY
	jr nz, .GuardSleeping
.checkVisitedOnly
	ld a, [wTownVisitedFlag + 1]
	bit 2, a
	jr nz, .SilphBlocked
	ret
.GiovanniSilph
	ld hl, MomPhoneText_GiovanniSilph
	jr .doneCheckSaffron
.MasterBall
	ld hl, MomPhoneText_MasterBall
	jr .doneCheckSaffron
.GuardSleeping
	ld hl, MomPhoneText_GuardSleeping
	jr .doneCheckSaffron
.SilphBlocked
	ld hl, MomPhoneText_SilphCoBlocked
	jr .doneCheckSaffron
.doneCheckSaffron
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
