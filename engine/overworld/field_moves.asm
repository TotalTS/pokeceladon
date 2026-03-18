TryFieldMove:: ; predef
	call GetPredefRegisters
	call TrySurf
	ret z
	call TryCut
	ret

TrySurf:
	ld a, [wWalkBikeSurfState]
	cp 2 ; is the player already surfing?
	jp z, .no
	callfar IsNextTileShoreOrWater
	jp c, .no
	ld hl, TilePairCollisionsWater
	call CheckForTilePairCollisions2
	jp c, .no
	ld d, SURF
	call HasPartyMove
	push hl
	push bc
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	ld [wSurfingPokemonID], a
	pop bc
	pop hl
	jr nz, .no
	ld a, [wObtainedBadges]
	bit BIT_SOULBADGE, a
	jr z, .no

	; cyclingRoad
	ld a, [wStatusFlags6]
	bit BIT_ALWAYS_ON_BIKE, a
	jr nz, .cyclingRoad

	ld a, [wCurMap]
	cp SEAFOAM_ISLANDS_B4F
	jr nz, .canSurfCheck

	; Seafoam B4F
	CheckBothEventsSet EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM4_BOULDER2_DOWN_HOLE
	jr z, .canSurfCheck
	
	ld hl, SeafoamIslandsB4FStairsPressedACoords
	call ArePlayerCoordsInArray
	jr nc, .canSurfCheck
	
	call InitializeFieldMoveTextBox
	ld hl, CurrentTooFastPressedAText
	call PrintText
	jr .yes2

.cyclingRoad
	call InitializeFieldMoveTextBox
	ld hl, CyclingIsFunPressedAText
	call PrintText
	jr .yes2

.canSurfCheck
	call InitializeFieldMoveTextBox
	ld hl, PromptToSurfText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .yes2
	
	call GetPartyMonName2
	ld a, SURFBOARD
	ld [wCurItem], a
	ld [wPseudoItemID], a
	call UseItem
	call CloseFieldMoveTextBox
	xor a
	ret

.yes2
	call CloseFieldMoveTextBox
.yes
	xor a
	ret
.no2
	call CloseFieldMoveTextBox
.no
	ld a, 1
	and a
	ret

TryCut:
	call IsCutTile
	jr nc, TrySurf.no
	call InitializeFieldMoveTextBox
	ld hl, ExplainCutText
	call PrintText
	call ManualTextScroll
	ld d, CUT
	call HasPartyMove
	jr nz, TrySurf.no2
	ld a, [wObtainedBadges]
	bit BIT_CASCADEBADGE, a
	jr z, TrySurf.no2
	ld hl, PromptToCutText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, TrySurf.no2
	call GetPartyMonName2
	callfar Cut2
	call CloseFieldMoveTextBox
	jr TrySurf.yes2

IsCutTile:
; partial copy from UsedCut
	ld a, [wCurMapTileset]
	and a ; OVERWORLD
	jr z, .overworld
	cp GYM
	jr nz, .no
	ld a, [wTileInFrontOfPlayer]
	cp $50 ; gym cut tree
	jr nz, .no
	jr .yes
.overworld
	ld a, [wTileInFrontOfPlayer]
	cp $3d ; cut tree
	jr nz, .no
.yes
	scf
	ret
.no
	and a
	ret

HasPartyMove::
; Return z (optional: in wWhichTrade) if a PartyMon has move d.
; Updates wWhichPokemon.
	push bc
	push de
	push hl

	ld a, [wPartyCount]
	and a
	jr z, .no
	ld b, a
	ld c, 0
	ld hl, wPartyMons + (wPartyMon1Moves - wPartyMon1)
.loop
	ld e, NUM_MOVES
.check_move
	ld a, [hli]
	cp d
	jr z, .yes
	dec e
	jr nz, .check_move

	ld a, wPartyMon2 - wPartyMon1 - NUM_MOVES
	add l
	ld l, a
	adc h
	sub l
	ld h, a

	inc c
	ld a, c
	cp b
	jr c, .loop
	jr .no

.yes
	ld a, c
	ld [wWhichPokemon], a
	xor a ; probably redundant
	ld [wWhichTrade], a
	jr .done
.no
	ld a, 1
	and a
	ld [wWhichTrade], a
.done
	pop hl
	pop de
	pop bc
	ret

InitializeFieldMoveTextBox:
	call EnableAutoTextBoxDrawing
	ld a, 1 ; not 0
	ld [hTextID], a
	callfar DisplayTextIDInit
	ret

_BoulderText2::
	text_asm
	ld a, [wStatusFlags1]
	bit 0, a ; using Strength?
	jr nz, .alreadyActive
	ld hl, BoulderText
	call PrintText
	ld a, [wObtainedBadges]
	bit BIT_RAINBOWBADGE, a
	jr z, .done 
	ld d, STRENGTH
	call HasPartyMove
	ld a, [wWhichTrade]
	and a 
	jr nz, .done
	ld hl, PromptToStrengthText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	ld a, [wWhichPokemon]
	push af 
;	call ManualTextScroll
	pop af 
	ld [wWhichPokemon], a 
	call GetPartyMonName2
	ld a, [wWhichPokemon]
	ld hl, wPartySpecies
	ld c, a
	ld a, l
	add a, c
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	ld a, [hl]
	ld [wCurPartySpecies], a	
	predef PrintStrengthText
.done
	ld a, $01
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	jp TextScriptEnd
	
.alreadyActive
	ld hl, BouldersMayNowBeMovedText
	call PrintText
	jp TextScriptEnd

CloseFieldMoveTextBox:
	ld a,[hLoadedROMBank]
	push af
	jp CloseTextDisplay

PromptToSurfText:
	text_far _PromptToSurfText
	text_end

ExplainCutText:
	text_far _ExplainCutText
	text_end

PromptToCutText:
	text_far _PromptToCutText
	text_end

BoulderText:
	text_far _BoulderText
	text_end
	
PromptToStrengthText:
	text_far _PromptToStrengthText
	text_end

BouldersMayNowBeMovedText:
	text_far _BouldersMayNowBeMovedText
	text_end

SeafoamIslandsB4FStairsPressedACoords:
	dbmapcoord  7, 11
	db -1 ; end

CurrentTooFastPressedAText:
	text_far _CurrentTooFastText
	text_end

CyclingIsFunPressedAText:
	text_far _CyclingIsFunText
	text_end
