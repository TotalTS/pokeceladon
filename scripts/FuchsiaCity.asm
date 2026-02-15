FuchsiaCity_Script:
	call EnableAutoTextBoxDrawing
	ld hl, FuchsiaCity_ScriptPointers
	ld a, [wFuchsiaCityCurScript]
	jp CallFunctionInTable

FuchsiaCity_ScriptPointers:
	def_script_pointers
	dw_const FuchsiaCityNoopScript,               SCRIPT_FUCHSIACITY_NOOP
	dw_const FuchsiaCityErikWarpSafariZoneScript, SCRIPT_FUCHSIACITY_WARP_TO_SAFARI_ZONE
	
FuchsiaCityNoopScript:
	ret
	
FuchsiaCityErikWarpSafariZoneScript:
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, TOGGLE_FUCHSIACITY_ERIK
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, SAFARI_ZONE_CENTER_REST_HOUSE
	ldh [hWarpDestinationMap], a
	ld a, $1
	ld [wDestinationWarpID], a
	ld a, FUCHSIA_CITY
	ld [wLastMap], a
	ld hl, wStatusFlags3
	set BIT_WARP_FROM_CUR_SCRIPT, [hl]
	xor a
	ld [wFuchsiaCityCurScript], a
	ret

FuchsiaCity_TextPointers:
	def_text_pointers
	dw_const FuchsiaCityYoungster1Text,      TEXT_FUCHSIACITY_YOUNGSTER1
	dw_const FuchsiaCityGamblerText,         TEXT_FUCHSIACITY_GAMBLER
	dw_const FuchsiaCityErikText,            TEXT_FUCHSIACITY_ERIK
	dw_const FuchsiaCityYoungster2Text,      TEXT_FUCHSIACITY_YOUNGSTER2
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_CHANSEY
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_VOLTORB
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_KANGASKHAN
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_SLOWPOKE
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_LAPRAS
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_FOSSIL
	dw_const FuchsiaCitySignText,            TEXT_FUCHSIACITY_SIGN1
	dw_const FuchsiaCitySignText,            TEXT_FUCHSIACITY_SIGN2
	dw_const FuchsiaCitySafariGameSignText,  TEXT_FUCHSIACITY_SAFARI_GAME_SIGN
	dw_const MartSignText,                   TEXT_FUCHSIACITY_MART_SIGN
	dw_const PokeCenterSignText,             TEXT_FUCHSIACITY_POKECENTER_SIGN
	dw_const FuchsiaCityWardensHomeSignText, TEXT_FUCHSIACITY_WARDENS_HOME_SIGN
	dw_const FuchsiaCitySafariZoneSignText,  TEXT_FUCHSIACITY_SAFARI_ZONE_SIGN
	dw_const FuchsiaCityGymSignText,         TEXT_FUCHSIACITY_GYM_SIGN
	dw_const FuchsiaCityChanseySignText,     TEXT_FUCHSIACITY_CHANSEY_SIGN
	dw_const FuchsiaCityVoltorbSignText,     TEXT_FUCHSIACITY_VOLTORB_SIGN
	dw_const FuchsiaCityKangaskhanSignText,  TEXT_FUCHSIACITY_KANGASKHAN_SIGN
	dw_const FuchsiaCitySlowpokeSignText,    TEXT_FUCHSIACITY_SLOWPOKE_SIGN
	dw_const FuchsiaCityLaprasSignText,      TEXT_FUCHSIACITY_LAPRAS_SIGN
	dw_const FuchsiaCityFossilSignText,      TEXT_FUCHSIACITY_FOSSIL_SIGN

FuchsiaCityYoungster1Text:
	text_far _FuchsiaCityYoungster1Text
	text_end

FuchsiaCityGamblerText:
	text_far _FuchsiaCityGamblerText
	text_end

FuchsiaCityErikText:
	text_asm
	CheckEvent EVENT_GAVE_POKEGEAR_TO_ERIK
	jr nz, .initial_text
; 1. Search item and position
	ld hl, wBagItems
	ld c, 0                ; C will be our index counter (slot)
.loop_find_gear
	ld a, [hli]            ; Load the item ID and point to the quantity byte
	cp $ff                 ; Did we reach the end of the bag?
	jr z, .initial_text    ; If it's not there, jump to the normal text
	cp POKEGEAR            ; Is it the Pokegear?
	jr z, .found_gear      ; Found it!
	inc hl                 ; Skip the quantity byte to go to the next item ID
	inc c                  ; Increase the slot index
	jr .loop_find_gear

.found_gear:
	; 2. Setup the removal
	ld a, c
	ld [wWhichPokemon], a  ; Store the found index (0, 1, 2...)
	ld a, 1
	ld [wItemQuantity], a  ; Quantity to remove
	
	ld hl, .ErikReceivedPokegearText
	call PrintText
	
	; 3. Remove the item
	ld hl, wNumBagItems    ; RemoveItemFromInventory NEEDS hl pointing here
	call RemoveItemFromInventory
	
	ld a, 30
	ld [wNumSafariBalls], a
	ld a, HIGH(500)
	ld [wSafariSteps], a
	ld a, LOW(492)
	ld [wSafariSteps + 1], a
	
	SetEvent EVENT_GAVE_POKEGEAR_TO_ERIK
	SetEvent EVENT_IN_SAFARI_ZONE
    ResetEvent EVENT_SAFARI_GAME_OVER
	
	xor a
	ld [wJoyIgnore], a
	
	ld a, TOGGLE_SAFARI_REST_HOUSE_ERIK
	ld [wToggleableObjectIndex], a
	predef ShowObject
	
	ld a, 1 
	ld [wFuchsiaCityCurScript], a
	jr .done

.initial_text:
	ld hl, .FuchsiaCityErikText
	call PrintText
	SetEvent EVENT_SPOKE_TO_ERIK_IN_FUCHSIA
	jr .done

.done:
	jp TextScriptEnd

.FuchsiaCityErikText:
	text_far _FuchsiaCityErikText
	text_end

.ErikReceivedPokegearText:
	text_far _ErikReceivedPokegearText
	text_end

FuchsiaCityYoungster2Text:
	text_far _FuchsiaCityYoungster2Text
	text_end

FuchsiaCityPokemonText:
	text_far _FuchsiaCityPokemonText
	text_end

FuchsiaCitySignText:
	text_far _FuchsiaCitySignText
	text_end

FuchsiaCitySafariGameSignText:
	text_far _FuchsiaCitySafariGameSignText
	text_end

FuchsiaCityWardensHomeSignText:
	text_far _FuchsiaCityWardensHomeSignText
	text_end

FuchsiaCitySafariZoneSignText:
	text_far _FuchsiaCitySafariZoneSignText
	text_end

FuchsiaCityGymSignText:
	text_far _FuchsiaCityGymSignText
	text_end

FuchsiaCityChanseySignText:
	text_asm
	ld hl, .Text
	call PrintText
	ld a, CHANSEY
	call DisplayPokedex
	jp TextScriptEnd

.Text:
	text_far _FuchsiaCityChanseySignText
	text_end

FuchsiaCityVoltorbSignText:
	text_asm
	ld hl, .Text
	call PrintText
	ld a, VOLTORB
	call DisplayPokedex
	jp TextScriptEnd

.Text:
	text_far _FuchsiaCityVoltorbSignText
	text_end

FuchsiaCityKangaskhanSignText:
	text_asm
	ld hl, .Text
	call PrintText
	ld a, KANGASKHAN
	call DisplayPokedex
	jp TextScriptEnd

.Text:
	text_far _FuchsiaCityKangaskhanSignText
	text_end

FuchsiaCitySlowpokeSignText:
	text_asm
	ld hl, .Text
	call PrintText
	ld a, SLOWPOKE
	call DisplayPokedex
	jp TextScriptEnd

.Text:
	text_far _FuchsiaCitySlowpokeSignText
	text_end

FuchsiaCityLaprasSignText:
	text_asm
	ld hl, .Text
	call PrintText
	ld a, LAPRAS
	call DisplayPokedex
	jp TextScriptEnd

.Text:
	text_far _FuchsiaCityLaprasSignText
	text_end

FuchsiaCityFossilSignText:
	text_asm
	CheckEvent EVENT_GOT_DOME_FOSSIL
	jr nz, .got_dome_fossil
	CheckEventReuseA EVENT_GOT_HELIX_FOSSIL
	jr nz, .got_helix_fossil
	ld hl, .UndeterminedText
	call PrintText
	jr .done
.got_dome_fossil
	ld hl, .OmanyteText
	call PrintText
	ld a, OMANYTE
	jr .display
.got_helix_fossil
	ld hl, .KabutoText
	call PrintText
	ld a, KABUTO
.display
	call DisplayPokedex
.done
	jp TextScriptEnd

.OmanyteText:
	text_far _FuchsiaCityFossilSignOmanyteText
	text_end

.KabutoText:
	text_far _FuchsiaCityFossilSignKabutoText
	text_end

.UndeterminedText:
	text_far _FuchsiaCityFossilSignUndeterminedText
	text_end
