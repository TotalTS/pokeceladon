SaffronCity_Script:
	jp EnableAutoTextBoxDrawing

SaffronCity_TextPointers:
	def_text_pointers
	dw_const SaffronCityRocket1Text,                  TEXT_SAFFRONCITY_ROCKET1
	dw_const SaffronCityRocket2Text,                  TEXT_SAFFRONCITY_ROCKET2
	dw_const SaffronCityRocket3Text,                  TEXT_SAFFRONCITY_ROCKET3
	dw_const SaffronCityRocket4Text,                  TEXT_SAFFRONCITY_ROCKET4
	dw_const SaffronCityRocket5Text,                  TEXT_SAFFRONCITY_ROCKET5
	dw_const SaffronCityRocket6Text,                  TEXT_SAFFRONCITY_ROCKET6
	dw_const SaffronCityRocket7Text,                  TEXT_SAFFRONCITY_ROCKET7
	dw_const SaffronCityScientistText,                TEXT_SAFFRONCITY_SCIENTIST
	dw_const SaffronCitySilphWorkerMText,             TEXT_SAFFRONCITY_SILPH_WORKER_M
	dw_const SaffronCitySilphWorkerFText,             TEXT_SAFFRONCITY_SILPH_WORKER_F
	dw_const SaffronCityGentlemanText,                TEXT_SAFFRONCITY_GENTLEMAN
	dw_const SaffronCityPidgeotText,                  TEXT_SAFFRONCITY_PIDGEOT
	dw_const SaffronCityRockerText,                   TEXT_SAFFRONCITY_ROCKER
	dw_const SaffronCityRocket8Text,                  TEXT_SAFFRONCITY_ROCKET8
	dw_const SaffronCityRocket9Text,                  TEXT_SAFFRONCITY_ROCKET9
	dw_const SaffronCitySignText,                     TEXT_SAFFRONCITY_SIGN
	dw_const SaffronCityFightingDojoSignText,         TEXT_SAFFRONCITY_FIGHTING_DOJO_SIGN
	dw_const SaffronCityGymSignText,                  TEXT_SAFFRONCITY_GYM_SIGN
	dw_const MartSignText,                            TEXT_SAFFRONCITY_MART_SIGN
	dw_const SaffronCityTrainerTips1Text,             TEXT_SAFFRONCITY_TRAINER_TIPS1
	dw_const SaffronCityTrainerTips2Text,             TEXT_SAFFRONCITY_TRAINER_TIPS2
	dw_const SaffronCitySilphCoSignText,              TEXT_SAFFRONCITY_SILPH_CO_SIGN
	dw_const PokeCenterSignText,                      TEXT_SAFFRONCITY_POKECENTER_SIGN
	dw_const SaffronCityMrPsychicsHouseSignText,      TEXT_SAFFRONCITY_MR_PSYCHICS_HOUSE_SIGN
	dw_const SaffronCitySilphCoLatestProductSignText, TEXT_SAFFRONCITY_SILPH_CO_LATEST_PRODUCT_SIGN

SaffronCityRocket1Text:
	text_asm
	ld a, [wIsRocketSuit]
	and a
	jr z, .normalBehavior
	ld hl, .SaffronCityRocket1RocketSuitText
	call PrintText
	jr .done1
.normalBehavior
	ld hl, .SaffronCityRocket1Text
	call PrintText
.done1
	jp TextScriptEnd
	
.SaffronCityRocket1Text:
	text_far _SaffronCityRocket1Text
	text_end
	
.SaffronCityRocket1RocketSuitText:
	text_far _SaffronCityRocket1RocketSuitText
	text_end

SaffronCityRocket2Text:
	text_far _SaffronCityRocket2Text
	text_end

SaffronCityRocket3Text:
	text_asm
	ld a, [wIsRocketSuit]
	and a
	jr z, .normalBehavior
	ld hl, .SaffronCityRocket3RocketSuitText
	call PrintText
	jr .done3
.normalBehavior
	ld hl, .SaffronCityRocket3Text
	call PrintText
.done3
	jp TextScriptEnd
	
.SaffronCityRocket3Text:
	text_far _SaffronCityRocket3Text
	text_end
	
.SaffronCityRocket3RocketSuitText:
	text_far _SaffronCityRocket3RocketSuitText
	text_end

SaffronCityRocket4Text:
	text_far _SaffronCityRocket4Text
	text_end

SaffronCityRocket5Text:
	text_far _SaffronCityRocket5Text
	text_end

SaffronCityRocket6Text:
	text_asm
	ld a, [wIsRocketSuit]
	and a
	jr z, .normalBehavior
	ld hl, .SaffronCityRocket6RocketSuitText
	call PrintText
	jr .done6
.normalBehavior
	ld hl, .SaffronCityRocket6Text
	call PrintText
.done6
	jp TextScriptEnd
	
.SaffronCityRocket6Text:
	text_far _SaffronCityRocket6Text
	text_end
	
.SaffronCityRocket6RocketSuitText:
	text_far _SaffronCityRocket6RocketSuitText
	text_end

SaffronCityRocket7Text:
	text_far _SaffronCityRocket7Text
	text_end

SaffronCityScientistText:
	text_asm
	ld a, [wIsRocketSuit]
	and a
	jr z, .normalBehavior
	ld hl, .SaffronCityScientistRocketSuitText
	call PrintText
	jr .doneScientist
.normalBehavior
	ld hl, .SaffronCityScientistText
	call PrintText
.doneScientist
	jp TextScriptEnd
	
.SaffronCityScientistText:
	text_far _SaffronCityScientistText
	text_end
	
.SaffronCityScientistRocketSuitText:
	text_far _SaffronCityScientistRocketSuitText
	text_end

SaffronCitySilphWorkerMText:
	text_asm
	ld a, [wIsRocketSuit]
	and a
	jr z, .normalBehavior
	ld hl, .SaffronCitySilphWorkerMRocketSuitText
	call PrintText
	jr .doneSilphWorkerM
.normalBehavior
	ld hl, .SaffronCitySilphWorkerMText
	call PrintText
.doneSilphWorkerM
	jp TextScriptEnd
	
.SaffronCitySilphWorkerMText:
	text_far _SaffronCitySilphWorkerMText
	text_end
	
.SaffronCitySilphWorkerMRocketSuitText:
	text_far _SaffronCitySilphWorkerMRocketSuitText
	text_end

SaffronCitySilphWorkerFText:
	text_asm
	ld a, [wIsRocketSuit]
	and a
	jr z, .normalBehavior
	ld hl, .SaffronCitySilphWorkerFRocketSuitText
	call PrintText
	jr .doneSilphWorkerF
.normalBehavior
	ld hl, .SaffronCitySilphWorkerFText
	call PrintText
.doneSilphWorkerF
	jp TextScriptEnd
	
.SaffronCitySilphWorkerFText:
	text_far _SaffronCitySilphWorkerFText
	text_end
	
.SaffronCitySilphWorkerFRocketSuitText:
	text_far _SaffronCitySilphWorkerFRocketSuitText
	text_end

SaffronCityGentlemanText:
	text_asm
	ld a, [wIsRocketSuit]
	and a
	jr z, .normalBehavior
	ld hl, .SaffronCityGentlemanRocketSuitText
	call PrintText
	jr .doneGentleman
.normalBehavior
	ld hl, .SaffronCityGentlemanText
	call PrintText
.doneGentleman
	jp TextScriptEnd
	
.SaffronCityGentlemanText:
	text_far _SaffronCityGentlemanText
	text_end
	
.SaffronCityGentlemanRocketSuitText:
	text_far _SaffronCityGentlemanRocketSuitText
	text_end


SaffronCityPidgeotText:
	text_far _SaffronCityPidgeotText
	sound_cry_pidgeot
	text_end

SaffronCityRockerText:
	text_asm
	ld a, [wIsRocketSuit]
	and a
	jr z, .normalBehavior
	ld hl, .SaffronCityRockerRocketSuitText
	call PrintText
	jr .doneRocker
.normalBehavior
	ld hl, .SaffronCityRockerText
	call PrintText
.doneRocker
	jp TextScriptEnd
	
.SaffronCityRockerText:
	text_far _SaffronCityRockerText
	text_end
	
.SaffronCityRockerRocketSuitText:
	text_far _SaffronCityRockerRocketSuitText
	text_end

SaffronCityRocket8Text:
	text_asm
	ld a, [wIsRocketSuit]
	and a
	jr z, .normalBehavior
	ld hl, .SaffronCityRocket8RocketSuitText
	call PrintText
	jr .done8
.normalBehavior
	ld hl, .SaffronCityRocket8Text
	call PrintText
.done8
	jp TextScriptEnd
	
.SaffronCityRocket8Text:
	text_far _SaffronCityRocket8Text
	text_end
	
.SaffronCityRocket8RocketSuitText:
	text_far _SaffronCityRocket8RocketSuitText
	text_end

SaffronCityRocket9Text:
	text_far _SaffronCityRocket9Text
	text_end

SaffronCitySignText:
	text_far _SaffronCitySignText
	text_end

SaffronCityFightingDojoSignText:
	text_far _SaffronCityFightingDojoSignText
	text_end

SaffronCityGymSignText:
	text_far _SaffronCityGymSignText
	text_end

SaffronCityTrainerTips1Text:
	text_far _SaffronCityTrainerTips1Text
	text_end

SaffronCityTrainerTips2Text:
	text_far _SaffronCityTrainerTips2Text
	text_end

SaffronCitySilphCoSignText:
	text_far _SaffronCitySilphCoSignText
	text_end

SaffronCityMrPsychicsHouseSignText:
	text_far _SaffronCityMrPsychicsHouseSignText
	text_end

SaffronCitySilphCoLatestProductSignText:
	text_far _SaffronCitySilphCoLatestProductSignText
	text_end
