Route7Gate_Script:
	call EnableAutoTextBoxDrawing
	ld a, [wRoute7GateCurScript]
	ld hl, Route7Gate_ScriptPointers
	call CallFunctionInTable
	ret

Route7Gate_ScriptPointers:
	def_script_pointers
	dw_const Route7DefaultScript,      SCRIPT_ROUTE7GATE_DEFAULT
	dw_const Route7PlayerMovingScript, SCRIPT_ROUTE7GATE_PLAYER_MOVING

Route7GateMovePlayerLeftScript:
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld a, PAD_LEFT
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	xor a
	ld [wSpritePlayerStateData2MovementByte1], a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ret

Route7GateMovePlayerForwardScript:
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld a, PAD_RIGHT
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	xor a
	ld [wSpritePlayerStateData2MovementByte1], a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ret

Route7DefaultScript:
	ld a, [wStatusFlags1]
	bit BIT_GAVE_SAFFRON_GUARDS_DRINK, a
	ret nz
	CheckEvent EVENT_BRIBED_SAFFRON_GUARD
	ret nz
	ld hl, .PlayerInCoordsArray
	call ArePlayerCoordsInArray
	ret nc
	ld a, [wIsRocketSuit]
	and a
	jr z, .noRocketSuit
	ld a, TEXT_ROUTE7GATE_GUARD
	ldh [hTextID], a
	call DisplayTextID
	ret

.noRocketSuit
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	xor a
	ldh [hJoyHeld], a
	farcall RemoveGuardDrink
	ldh a, [hItemToRemoveID]
	and a
	jr nz, .have_drink
	ld a, TEXT_ROUTE7GATE_GUARD_GEE_IM_THIRSTY
	ldh [hTextID], a
	call DisplayTextID
	call Route7GateMovePlayerLeftScript
	ld a, SCRIPT_ROUTE7GATE_PLAYER_MOVING
	ld [wRoute7GateCurScript], a
	ret
.have_drink
	ld a, TEXT_ROUTE7GATE_GUARD_GIVE_DRINK
	ldh [hTextID], a
	call DisplayTextID
	ld hl, wStatusFlags1
	set BIT_GAVE_SAFFRON_GUARDS_DRINK, [hl]
	ld a, PROGRESS_SAFFRON
	ld [wLastProgressEvent], a
	ret

.PlayerInCoordsArray:
	dbmapcoord  3,  3
	dbmapcoord  3,  4
	db -1 ; end

Route7PlayerMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wRoute7GateCurScript], a
	ld [wCurMapScript], a
	ret

Route7Gate_TextPointers:
	def_text_pointers
	dw_const Route7GateGuardText,              TEXT_ROUTE7GATE_GUARD
	dw_const SaffronGateGuardGeeImThirstyText, TEXT_ROUTE7GATE_GUARD_GEE_IM_THIRSTY
	dw_const SaffronGateGuardGiveDrinkText,    TEXT_ROUTE7GATE_GUARD_GIVE_DRINK
	
Route7GateGuardText:
	text_asm
	ld a, [wStatusFlags1]
	bit BIT_GAVE_SAFFRON_GUARDS_DRINK, a
	jp nz, .gave_drink
	CheckEvent EVENT_BRIBED_SAFFRON_GUARD
	jp nz, .bribedAlready
	ld a, [wIsRocketSuit]
	and a
	jr z, .normalBehavior
	ld hl, SaffronGateGuardDefaultText
	call PrintText
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, EvadeGuardQuestionText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .choseNoToEvade
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, InfractionHandOverText
	call PrintText
	xor a
	ldh [hMoney], a
	ldh [hMoney + 2], a
	ld a, $10
	ldh [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .enoughMoneyForFine
	ld hl, NotEnoughMoneyText
	call PrintText
	call Route7GateMovePlayerLeftScript
	ld a, SCRIPT_ROUTE7GATE_PLAYER_MOVING
	ld [wRoute7GateCurScript], a
	jp TextScriptEnd

.enoughMoneyForFine
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 2], a
	ld a, $10
	ld [wPriceTemp + 1], a
    ld hl, wPriceTemp + 2
    ld de, wPlayerMoney + 2
    ld c, $3
    predef SubBCDPredef
	SetEvent EVENT_BRIBED_SAFFRON_GUARD
	call Route7GateMovePlayerForwardScript
	ld a, SCRIPT_ROUTE7GATE_PLAYER_MOVING
	ld [wRoute7GateCurScript], a
	jp TextScriptEnd

.choseNoToEvade
	call Route7GateMovePlayerLeftScript
	ld a, SCRIPT_ROUTE7GATE_PLAYER_MOVING
	ld [wRoute7GateCurScript], a
	jp TextScriptEnd

.normalBehavior
	ld a, [wStatusFlags1]
	bit BIT_GAVE_SAFFRON_GUARDS_DRINK, a
	jr nz, .thanks_for_drink
	farcall RemoveGuardDrink
	ldh a, [hItemToRemoveID]
	and a
	jr nz, .have_drink
	ld hl, SaffronGateGuardGeeImThirstyText
	call PrintText
	call Route7GateMovePlayerLeftScript
	ld a, SCRIPT_ROUTE7GATE_PLAYER_MOVING
	ld [wRoute7GateCurScript], a
	jp TextScriptEnd

.have_drink
	ld hl, SaffronGateGuardGiveDrinkText
	call PrintText
	ld hl, wStatusFlags1
	set BIT_GAVE_SAFFRON_GUARDS_DRINK, [hl]
	jp TextScriptEnd

.thanks_for_drink
	ld hl, SaffronGateGuardThanksForTheDrinkText
	call PrintText
	jp TextScriptEnd
	
.gave_drink
	ld a, [wIsRocketSuit]
	and a
	jr z, .thanks_for_drink
	ld hl, RocketsShouldNotBeAroundText
	call PrintText
	jp TextScriptEnd

.bribedAlready
	ld a, [wIsRocketSuit]
	and a
	jr z, .surprisedRockets
	ld hl, RocketsShouldNotBeAroundText
	call PrintText
	jp TextScriptEnd

.surprisedRockets
	ld hl, CanYouBelieveItRocketsPassedText
	call PrintText
	jp TextScriptEnd
