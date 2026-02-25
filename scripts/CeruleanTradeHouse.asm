CeruleanTradeHouse_Script:
	jp EnableAutoTextBoxDrawing

CeruleanTradeHouse_TextPointers:
	def_text_pointers
	dw_const CeruleanTradeHouseMelanieText, TEXT_CERULEANTRADEHOUSE_MELANIE
	dw_const CeruleanTradeHouseBulbasaurText, TEXT_CERULEANTRADEHOUSE_BULBASAUR
	dw_const CeruleanTradeHouseOddishText, TEXT_CERULEANTRADEHOUSE_ODDISH
	dw_const CeruleanTradeHouseSandshrewText, TEXT_CERULEANTRADEHOUSE_SANDSHREW

CeruleanTradeHouseMelanieText:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	CheckEvent EVENT_GOT_BULBASAUR_IN_CERULEAN
	jr nz, .asm_1cfbf
	ld hl, CeruleanHouse1Text_1cfc8
	call PrintText
	ld a, [wObtainedBadges]
	bit BIT_CASCADEBADGE, a
	jr z, .asm_1cfb3
	ld hl, CeruleanHouse1Text_1cfce
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_1cfb6
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, BULBASAUR
	ld [wNamedObjectIndex], a
	ld [wCurPartySpecies], a
	call GetMonName
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	lb bc, BULBASAUR, 10
	call GivePokemon
	jr nc, .asm_1cfb3
	ld a, [wAddedToParty]
	and a
	call z, WaitForTextScrollButtonPress
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, CeruleanHouse1Text_1cfd3
	call PrintText
	ld a, TOGGLE_CERULEAN_BULBASAUR
	ld [wToggleableObjectIndex], a
	predef HideObject
	SetEvent EVENT_GOT_BULBASAUR_IN_CERULEAN
.asm_1cfb3
	jp TextScriptEnd

.asm_1cfb6
	ld hl, CeruleanHouse1Text_1cfdf
	call PrintText
	jp TextScriptEnd

.asm_1cfbf
	ld hl, CeruleanHouse1Text_1cfd9
	call PrintText
	jp TextScriptEnd

CeruleanHouse1Text_1cfc8:
	text_far _MelanieText1
	text_waitbutton
	text_end

CeruleanHouse1Text_1cfce:
	text_far _MelanieText2
	text_end

CeruleanHouse1Text_1cfd3:
	text_far _MelanieText3
	text_waitbutton
	text_end

CeruleanHouse1Text_1cfd9:
	text_far _MelanieText4
	text_waitbutton
	text_end

CeruleanHouse1Text_1cfdf:
	text_far _MelanieText5
	text_waitbutton
	text_end

CeruleanTradeHouseBulbasaurText:
	text_far _MelanieBulbasaurText
	text_asm
	ld a, BULBASAUR
	call PlayCry
	jp TextScriptEnd

CeruleanTradeHouseOddishText:
	text_far _MelanieOddishText
	text_asm
	ld a, ODDISH
	call PlayCry
	jp TextScriptEnd

CeruleanTradeHouseSandshrewText:
	text_far _MelanieSandshrewText
	text_asm
	ld a, SANDSHREW
	call PlayCry
	jp TextScriptEnd
