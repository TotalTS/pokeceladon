Route8Gate_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route8Gate_ScriptPointers
	ld a, [wRoute8GateCurScript]
	jp CallFunctionInTable

Route8Gate_ScriptPointers:
	def_script_pointers
	dw_const Route8GateDefaultScript,      SCRIPT_ROUTE8GATE_DEFAULT
	dw_const Route8GatePlayerMovingScript, SCRIPT_ROUTE8GATE_PLAYER_MOVING

Route8GateMovePlayerRightScript:
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

Route8GateMovePlayerForwardScript:
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

Route8GateDefaultScript:
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
	ld a, TEXT_ROUTE8GATE_GUARD
	ldh [hTextID], a
	call DisplayTextID
	ret

.noRocketSuit
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	xor a
	ldh [hJoyHeld], a
	farcall RemoveGuardDrink
	ldh a, [hItemToRemoveID]
	and a
	jr nz, .have_drink
	ld a, TEXT_ROUTE8GATE_GUARD_GEE_IM_THIRSTY
	ldh [hTextID], a
	call DisplayTextID
	call Route8GateMovePlayerRightScript
	ld a, SCRIPT_ROUTE8GATE_PLAYER_MOVING
	ld [wRoute8GateCurScript], a
	ret
.have_drink
	ld hl, wStatusFlags1
	set BIT_GAVE_SAFFRON_GUARDS_DRINK, [hl]
	ld a, PROGRESS_SAFFRON
	ld [wLastProgressEvent], a
	ld a, TEXT_ROUTE8GATE_GUARD_GIVE_DRINK
	ldh [hTextID], a
	jp DisplayTextID

.PlayerInCoordsArray:
	dbmapcoord  2,  3
	dbmapcoord  2,  4
	db -1 ; end

Route8GatePlayerMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wRoute8GateCurScript], a
	ret

Route8Gate_TextPointers:
	def_text_pointers
	dw_const Route8GateGuardText,             TEXT_ROUTE8GATE_GUARD
	dw_const SaffronGateGuardGeeImThirstyText, TEXT_ROUTE8GATE_GUARD_GEE_IM_THIRSTY
	dw_const SaffronGateGuardGiveDrinkText,    TEXT_ROUTE8GATE_GUARD_GIVE_DRINK

Route8GateGuardText:
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
	call Route8GateMovePlayerRightScript
	ld a, SCRIPT_ROUTE8GATE_PLAYER_MOVING
	ld [wRoute8GateCurScript], a
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
	call Route8GateMovePlayerForwardScript
	ld a, SCRIPT_ROUTE8GATE_PLAYER_MOVING
	ld [wRoute8GateCurScript], a
	jp TextScriptEnd

.choseNoToEvade
	call Route8GateMovePlayerRightScript
	ld a, SCRIPT_ROUTE8GATE_PLAYER_MOVING
	ld [wRoute8GateCurScript], a
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
	call Route8GateMovePlayerRightScript
	ld a, SCRIPT_ROUTE8GATE_PLAYER_MOVING
	ld [wRoute8GateCurScript], a
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
