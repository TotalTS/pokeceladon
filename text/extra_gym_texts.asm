_PewterGymCooltrainerMAfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_BOULDERBADGE, a
	jr nz, .afterBeat
	ld hl, .PewterGymCooltrainerMAfterBattleText
.isChampion
	ld hl, _PewterGymCooltrainerMAfterChampionText
	jr .print
.afterBeat
	ld hl, _PewterGymCooltrainerMAfterBrockText
.print
	call PrintText
	jp TextScriptEnd

.PewterGymCooltrainerMAfterBattleText:
	text "You're pretty hot,"
	line "but not as hot"
	cont "as BROCK!"
	done

_PewterGymCooltrainerMAfterBrockText:
	text "So you actually"
	line "beat BROCK?"

	para "I guess those"
	line "light years went"
	cont "by fast!"
	done

_PewterGymCooltrainerMAfterChampionText:
	text "The CHAMPION is"
	line "visiting us?"

	para "I should have"
	line "trained harder"
	cont "back then!"
	done

_CeruleanGymAfterBattleText1::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_CASCADEBADGE, a
	jr nz, .afterBeat
	ld hl, .CeruleanGymAfterBattleText1
.isChampion
	ld hl, _CeruleanGymAfterChampionText1
	jr .print
.afterBeat
	ld hl, _CeruleanGymAfterMistyText1
.print
	call PrintText
	jp TextScriptEnd

.CeruleanGymAfterBattleText1:
	text "You have to face"
	line "other trainers to"
	cont "find out how good"
	cont "you really are."
	done
	
_CeruleanGymAfterMistyText1:
	text "MISTY lost?"
	line "Unbelievable!"

	para "You really are"
	line "as good as you"
	cont "looked."
	done

_CeruleanGymAfterChampionText1:
	text "I heard about"
	line "your victory at"
	cont "the LEAGUE!"

	para "It's an honor to"
	line "have you here."
	done
	
_CeruleanGymAfterBattleText2::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_CASCADEBADGE, a
	jr nz, .afterBeat
	ld hl, .CeruleanGymAfterBattleText2
.isChampion
	ld hl, _CeruleanGymAfterChampionText2
	jr .print
.afterBeat
	ld hl, _CeruleanGymAfterMistyText2
.print
	call PrintText
	jp TextScriptEnd

.CeruleanGymAfterBattleText2:
	text "MISTY is going to"
	line "keep improving!"

	para "She won't lose to"
	line "someone like you!"
	done

_CeruleanGymAfterMistyText2:
	text "Even with her"
	line "improvements,"
	cont "you won!"

	para "MISTY will need"
	line "a new strategy."
	done

_CeruleanGymAfterChampionText2:
	text "So, does the"
	line "CHAMPION like"
	cont "to swim in"
	cont "our GYM?"
	done
	
_VermilionGymGentlemanAfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_THUNDERBADGE, a
	jr nz, .afterBeat
	ld hl, .VermilionGymGentlemanAfterBattleText
.isChampion
	ld hl, _VermilionGymGentlemanAfterSurgeText
	jr .print
.afterBeat
	ld hl, _VermilionGymGentlemanAfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.VermilionGymGentlemanAfterBattleText:
	text "The door won't"
	line "open?"

	para "LT.SURGE always"
	line "was cautious!"
	done

_VermilionGymGentlemanAfterSurgeText:
	text "He was defeated?"
	line "You have my"
	cont "respect, kid!"
	done

_VermilionGymGentlemanAfterChampionText:
	text "Even the strict"
	line "LT.SURGE must"
	cont "salute you now!"

	para "A CHAMPION in our"
	line "ranks. Splendid!"
	done
	
_VermilionGymSuperNerdAfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_THUNDERBADGE, a
	jr nz, .afterBeat
	ld hl, .VermilionGymSuperNerdAfterBattleText
.isChampion
	ld hl, _VermilionGymSuperNerdAfterSurgeText
	jr .print
.afterBeat
	ld hl, _VermilionGymSuperNerdAfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.VermilionGymSuperNerdAfterBattleText:
	text "OK, I'll talk!"

	para "LT.SURGE said he"
	line "hid door switches"
	cont "inside something!"
	done

_VermilionGymSuperNerdAfterSurgeText:
	text "Whoa! You"
	line "shattered the"
	cont "SURGE barrier!"

	para "That was a high-"
	line "voltage battle!"
	done

_VermilionGymSuperNerdAfterChampionText:
	text "The CHAMPION"
	line "is back!"

	para "You're truly"
	line "electrifying!"
	done
	
_VermilionGymSailorAfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_THUNDERBADGE, a
	jr nz, .afterBeat
	ld hl, .VermilionGymSailorAfterBattleText
.isChampion
	ld hl, _VermilionGymSailorAfterSurgeText
	jr .print
.afterBeat
	ld hl, _VermilionGymSailorAfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.VermilionGymSailorAfterBattleText:
	text "LT.SURGE set up"
	line "double locks!"
	cont "Here's a hint!"

	para "When you open the"
	line "1st lock, the 2nd"
	cont "lock is right"
	cont "next to it!"
	done

_VermilionGymSailorAfterSurgeText:
	text "You broke through"
	line "the locks and the"
	cont "LT.'s defense!"
	done

_VermilionGymSailorAfterChampionText:
	text "The CHAMPION"
	line "dropped anchor in"
	cont "our GYM!"

	para "Smooth sailing"
	line "from here, CHAMP!"
	done


_CeladonGymAfterBattleText2::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_RAINBOWBADGE, a
	jr nz, .afterBeat
	ld hl, .CeladonGymAfterBattleText2
.isChampion
	ld hl, _CeladonGymAfterChampionText2
	jr .print
.afterBeat
	ld hl, _CeladonGymAfterErikaText2
.print
	call PrintText
	jp TextScriptEnd

.CeladonGymAfterBattleText2:
	text "Bleaah!"
	line "I hope ERIKA"
	cont "wipes you out!"
	done
	
_CeladonGymAfterErikaText2:
	text "Bleaah! So ERIKA"
	line "didn't wipe you"
	cont "out after all."
	done

_CeladonGymAfterChampionText2:
	text "Fine, you're the"
	line "CHAMPION now."

	para "But my #MON"
	line "are still way"
	cont "cuter than yours!"
	done
	
_CeladonGymAfterBattleText3::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_RAINBOWBADGE, a
	jr nz, .afterBeat
	ld hl, .CeladonGymAfterBattleText3
.isChampion
	ld hl, _CeladonGymAfterChampionText3
	jr .print
.afterBeat
	ld hl, _CeladonGymAfterErikaText3
.print
	call PrintText
	jp TextScriptEnd

.CeladonGymAfterBattleText3:
	text "Grass-type #MON"
	line "are tough against"
	cont "the water-type!"

	para "They also have an"
	line "edge on rock and"
	cont "ground #MON!"
	done
	
_CeladonGymAfterErikaText3:
	text "You beat ERIKA?"
	line "That's actually"
	cont "impressive."
	done

_CeladonGymAfterChampionText3:
	text "Being CHAMPION"
	line "sounds like a"
	cont "lot of work."

	para "I think I'll just"
	line "stay here and"
	cont "relax."
	done

_CeladonGymAfterBattleText4::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_RAINBOWBADGE, a
	jr nz, .afterBeat
	ld hl, .CeladonGymAfterBattleText4
.isChampion
	ld hl, _CeladonGymAfterChampionText4
	jr .print
.afterBeat
	ld hl, _CeladonGymAfterErikaText4
.print
	call PrintText
	jp TextScriptEnd

.CeladonGymAfterBattleText4:
	text "Oh, you were"
	line "looking at ERIKA,"
	cont "you weren't"
	cont "looking at me..."
	done
	
_CeladonGymAfterErikaText4:
	text "So, it was the"
	line "GYM's strategy"
	cont "you were"
	cont "studying?"

	para "You certainly"
	line "learned how to"
	cont "defeat us!"
	done

_CeladonGymAfterChampionText4:
	text "The CHAMPION"
	line "returns to the"
	cont "scene of the"
	cont "clash."

	para "Are you here to"
	line "give us some"
	cont "advice?"
	done

_CeladonGymAfterBattleText5::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_RAINBOWBADGE, a
	jr nz, .afterBeat
	ld hl, .CeladonGymAfterBattleText5
.isChampion
	ld hl, _CeladonGymAfterChampionText5
	jr .print
.afterBeat
	ld hl, _CeladonGymAfterErikaText5
.print
	call PrintText
	jp TextScriptEnd

.CeladonGymAfterBattleText5:
	text "We only use grass-"
	line "type #MON at"
	cont "our GYM!"

	para "We also use them"
	line "for making flower"
	cont "arrangements!"
	done
	
_CeladonGymAfterErikaText5:
	text "ERIKA is busy"
	line "with her flowers."

	para "Your battle was"
	line "as beautiful as"
	cont "an orchid!"
	done
	
_CeladonGymAfterChampionText5:
	text "Our flowers"
	line "bloom even more"
	cont "vibrantly today."

	para "Nature itself"
	line "seems to honor"
	cont "the new CHAMPION!"
	done
	
_CeladonGymAfterBattleText6::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_RAINBOWBADGE, a
	jr nz, .afterBeat
	ld hl, .CeladonGymAfterBattleText6
.isChampion
	ld hl, _CeladonGymAfterChampionText6
	jr .print
.afterBeat
	ld hl, _CeladonGymAfterErikaText6
.print
	call PrintText
	jp TextScriptEnd

.CeladonGymAfterBattleText6:
	text "Our LEADER, ERIKA,"
	line "might be quiet,"
	cont "but she's also"
	cont "very skilled!"
	done
	
_CeladonGymAfterErikaText6:
	text "You won"
	line "fairly."
	done

_CeladonGymAfterChampionText6:
	text "A CHAMPION must"
	line "know how to use"
	cont "every type."

	para "Even the scary"
	line "bug types..."
	done
	
_CeladonGymAfterBattleText7::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_RAINBOWBADGE, a
	jr nz, .afterBeat
	ld hl, .CeladonGymAfterBattleText7
.isChampion
	ld hl, _CeladonGymAfterChampionText7
	jr .print
.afterBeat
	ld hl, _CeladonGymAfterErikaText7
.print
	call PrintText
	jp TextScriptEnd

.CeladonGymAfterBattleText7:
	text "I have a blind"
	line "date coming up."
	cont "I have to learn"
	cont "to be polite."
	done
	
_CeladonGymAfterErikaText7:
	text "I was so polite"
	line "during our fight,"
	cont "don't you think?"
	done
	
_CeladonGymAfterChampionText7:
	text "Oh, CHAMPION!"
	line "I haven't seen"
	cont "you in a while!"

	para "My blind date was"
	line "a disaster!"
	done
	
_CeladonGymAfterBattleText8::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_RAINBOWBADGE, a
	jr nz, .afterBeat
	ld hl, .CeladonGymAfterBattleText8
.isChampion
	ld hl, _CeladonGymAfterChampionText8
	jr .print
.afterBeat
	ld hl, _CeladonGymAfterErikaText8
.print
	call PrintText
	jp TextScriptEnd

.CeladonGymAfterBattleText8:
	text "I didn't bring my"
	line "best #MON!"

	para "Wait 'til next"
	line "time!"
	done
	
_CeladonGymAfterErikaText8:
	text "Girl power is"
	line "still great,"
	cont "but your power"
	cont "is amazing!"
	done

_CeladonGymAfterChampionText8:
	text "CHAMPION!"
	line "Next time, I'll"
	cont "bring my best"
	cont "team for sure!"
	done

_FuchsiaGymRocker1AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_SOULBADGE, a
	jr nz, .afterBeat
	
	ld hl, .FuchsiaGymRocker1AfterBattleText
	jr .print

.afterBeat
	ld hl, _FuchsiaGymRocker1AfterKogaText
	jr .print

.isChampion
	ld hl, _FuchsiaGymRocker1AfterChampionText

.print
	call PrintText
	jp TextScriptEnd

.FuchsiaGymRocker1AfterBattleText:
	text "So, you mix brawn"
	line "with brains?"
	cont "Good strategy!"
	done
	
_FuchsiaGymRocker1AfterKogaText:
	text "Strategy and"
	line "strength..."

	para "You've mastered"
	line "both to defeat"
	cont "MASTER KOGA!"
	done

_FuchsiaGymRocker1AfterChampionText:
	text "As CHAMPION,"
	line "your strategy"
	cont "is now the gold"
	cont "standard!"
	done
	
_FuchsiaGymRocker2AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_SOULBADGE, a
	jr nz, .afterBeat
	
	ld hl, .FuchsiaGymRocker2AfterBattleText
	jr .print

.afterBeat
	ld hl, _FuchsiaGymRocker2AfterKogaText
	jr .print

.isChampion
	ld hl, _FuchsiaGymRocker2AfterChampionText

.print
	call PrintText
	jp TextScriptEnd

.FuchsiaGymRocker2AfterBattleText:
	text "I will keep on"
	line "training under"
	cont "KOGA, my ninja"
	cont "master!"
	done

_FuchsiaGymRocker2AfterKogaText:
	text "I will continue"
	line "my ninja way,"
	cont "even if our"
	cont "leader lost!"
	done

_FuchsiaGymRocker2AfterChampionText:
	text "A ninja must"
	line "respect the"
	cont "strongest."

	para "I bow before the"
	line "new CHAMPION!"
	done

_FuchsiaGymRocker3AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_SOULBADGE, a
	jr nz, .afterBeat
	
	ld hl, .FuchsiaGymRocker3AfterBattleText
	jr .print

.afterBeat
	ld hl, _FuchsiaGymRocker3AfterKogaText
	jr .print

.isChampion
	ld hl, _FuchsiaGymRocker3AfterChampionText
	
.print
	call PrintText
	jp TextScriptEnd

.FuchsiaGymRocker3AfterBattleText:
	text "I like poison and"
	line "sleep techniques,"
	cont "as they linger"
	cont "after battle!"
	done

_FuchsiaGymRocker3AfterKogaText:
	text "Poison and sleep"
	line "weren't enough"
	cont "to stop you!"
	done

_FuchsiaGymRocker3AfterChampionText:
	text "Do you use"
	line "status effects"
	cont "as CHAMPION?"

	para "They are truly"
	line "devious!"
	done
	
_FuchsiaGymRocker4AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_SOULBADGE, a
	jr nz, .afterBeat
	
	ld hl, .FuchsiaGymRocker4AfterBattleText
	jr .print

.afterBeat
	ld hl, _FuchsiaGymRocker4AfterKogaText
	jr .print

.isChampion
	ld hl, _FuchsiaGymRocker4AfterChampionText
	
.print
	call PrintText
	jp TextScriptEnd
	
.FuchsiaGymRocker4AfterBattleText:
	text "You impressed me!"
	line "Here's a hint!"

	para "Look very closely"
	line "for gaps in the"
	cont "invisible walls!"
	done

_FuchsiaGymRocker4AfterKogaText:
	text "You saw through"
	line "the walls and"
	cont "the toxins!"
	done

_FuchsiaGymRocker4AfterChampionText:
	text "No invisible"
	line "wall could block"
	cont "your path to"
	cont "the top!"
	done

_FuchsiaGymRocker5AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_SOULBADGE, a
	jr nz, .afterBeat
	
	ld hl, .FuchsiaGymRocker5AfterBattleText
	jr .print

.afterBeat
	ld hl, _FuchsiaGymRocker5AfterKogaText
	jr .print

.isChampion
	ld hl, _FuchsiaGymRocker5AfterChampionText
	
.print
	call PrintText
	jp TextScriptEnd
	
.FuchsiaGymRocker5AfterBattleText:
	text "I still have much"
	line "to learn!"
	done

_FuchsiaGymRocker5AfterKogaText::
	text "Master KOGA"
	line "will refine our"
	cont "history after"
	cont "this defeat."
	done

_FuchsiaGymRocker5AfterChampionText::
	text "The CHAMPION"
	line "has a strong"
	cont "presence!"
	done
	
_FuchsiaGymRocker6AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_SOULBADGE, a
	jr nz, .afterBeat
	
	ld hl, .FuchsiaGymRocker6AfterBattleText
	jr .print

.afterBeat
	ld hl, _FuchsiaGymRocker6AfterKogaText
	jr .print

.isChampion
	ld hl, _FuchsiaGymRocker6AfterChampionText
	
.print
	call PrintText
	jp TextScriptEnd
	
.FuchsiaGymRocker6AfterBattleText:
	text "Where there is"
	line "light, there is"
	cont "shadow!"

	para "Light and shadow!"
	line "Which do you"
	cont "choose?"
	done

_FuchsiaGymRocker6AfterKogaText::
	text "Master KOGA"
	line "has retreated"
	cont "into the shadows"
	cont "to train more."
	done

_FuchsiaGymRocker6AfterChampionText::
	text "You chose the"
	line "light of the"
	cont "CHAMPION!"

	para "But the shadow"
	line "will always be"
	cont "behind you..."
	done

_SaffronGymChanneler1AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_MARSHBADGE, a
	jr nz, .afterBeat
	
	ld hl, .SaffronGymChanneler1AfterBattleText
	jr .print
.afterBeat
	ld hl, _SaffronGymChanneler1AfterSabrinaText
	jr .print
.isChampion
	ld hl, _SaffronGymChanneler1AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.SaffronGymChanneler1AfterBattleText:
	text "In a battle of"
	line "equals, the one"
	cont "with the stronger"
	cont "will wins!"

	para "If you wish"
	line "to beat SABRINA,"
	cont "focus on winning!"
	done

_SaffronGymChanneler1AfterSabrinaText:
	text "SABRINA lost,"
	line "but she still"
	cont "has my respect."

	para "Winning isn't"
	line "just about will,"
	cont "it's about you!"
	done

_SaffronGymChanneler1AfterChampionText:
	text "The CHAMPION"
	line "focuses only on"
	cont "victory."

	para "Your path was"
	line "written in the"
	cont "stars!"
	done
	
_SaffronGymYoungster1AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_MARSHBADGE, a
	jr nz, .afterBeat
	
	ld hl, .SaffronGymYoungster1AfterBattleText
	jr .print
.afterBeat
	ld hl, _SaffronGymChanneler1AfterSabrinaText
	jr .print
.isChampion
	ld hl, _SaffronGymChanneler1AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.SaffronGymYoungster1AfterBattleText:
	text "Psychic #MON"
	line "fear only ghosts"
	cont "and bugs!"
	done
	
_SaffronGymYoungster1AfterSabrinaText:
	text "I foresaw your"
	line "victory against"
	cont "SABRINA."

	para "It was quite a"
	line "spectacle!"
	done

_SaffronGymYoungster1AfterChampionText:
	text "Do ghosts and"
	line "bugs still scare"
	cont "the CHAMPION?"

	para "I don't think"
	line "anything can!"
	done
	
_SaffronGymChanneler2AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_MARSHBADGE, a
	jr nz, .afterBeat
	
	ld hl, .SaffronGymChanneler2AfterBattleText
	jr .print
.afterBeat
	ld hl, _SaffronGymChanneler2AfterSabrinaText
	jr .print
.isChampion
	ld hl, _SaffronGymChanneler2AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.SaffronGymChanneler2AfterBattleText:
	text "I must teach"
	line "better techniques"
	cont "to my #MON!"
	done
	
_SaffronGymChanneler2AfterSabrinaText:
	text "Your #MON"
	line "are tougher than"
	cont "any I've seen."

	para "They reflect"
	line "your strength!"
	done

_SaffronGymChanneler2AfterChampionText:
	text "I taught my"
	line "#MON new ways"
	cont "to fight."

	para "But they still"
	line "pale before a"
	cont "CHAMPION!"
	done
	
_SaffronGymYoungster2AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_MARSHBADGE, a
	jr nz, .afterBeat
	
	ld hl, .SaffronGymYoungster2AfterBattleText
	jr .print
.afterBeat
	ld hl, _SaffronGymYoungster2AfterSabrinaText
	jr .print
.isChampion
	ld hl, _SaffronGymYoungster2AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.SaffronGymYoungster2AfterBattleText:
	text "SABRINA just wiped"
	line "out the KARATE"
	cont "MASTER next door!"
	done
	
_SaffronGymYoungster2AfterSabrinaText:
	text "I believe it"
	line "now! Power and"
	cont "skill combined!"
	done

_SaffronGymYoungster2AfterChampionText:
	text "Your strength is"
	line "on a whole other"
	cont "level now."

	para "The entire city"
	line "is talking about"
	cont "the new CHAMPION!"
	done
	
_SaffronGymChanneler3AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_MARSHBADGE, a
	jr nz, .afterBeat
	
	ld hl, .SaffronGymChanneler3AfterBattleText
	jr .print
.afterBeat
	ld hl, _SaffronGymChanneler3AfterSabrinaText
	jr .print
.isChampion
	ld hl, _SaffronGymChanneler3AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.SaffronGymChanneler3AfterBattleText:
	text "I knew that this"
	line "was going to take"
	cont "place."
	done
	
_SaffronGymChanneler3AfterSabrinaText:
	text "The battle I"
	line "knew would happen"
	cont "ended in our"
	cont "defeat."
	done

_SaffronGymChanneler3AfterChampionText:
	text "Your aura"
	line "is pulsating"
	cont "with light!"

	para "A truly worthy"
	line "CHAMPION!"
	done

_SaffronGymYoungster3AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_MARSHBADGE, a
	jr nz, .afterBeat
	
	ld hl, .SaffronGymYoungster3AfterBattleText
	jr .print
.afterBeat
	ld hl, _SaffronGymYoungster3AfterSabrinaText
	jr .print
.isChampion
	ld hl, _SaffronGymYoungster3AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.SaffronGymYoungster3AfterBattleText:
	text "There used to be"
	line "2 #MON GYMs in"
	cont "SAFFRON."

	para "The FIGHTING DOJO"
	line "next door lost"
	cont "its GYM status"
	cont "when we went and"
	cont "creamed them!"
	done
	
_SaffronGymYoungster3AfterSabrinaText:
	text "You reached our"
	line "LEADER and won!"

	para "Now you're beyond"
	line "this GYM and"
	cont "the DOJO!"
	done
	
_SaffronGymYoungster3AfterChampionText:
	text "The CHAMPION!"
	line "Your power is"
	cont "the new legend"
	cont "of SAFFRON."

	para "Even the KARATE"
	line "MASTER would"
	cont "bow to you!"
	done
	
_SaffronGymYoungster4AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_MARSHBADGE, a
	jr nz, .afterBeat
	
	ld hl, .SaffronGymYoungster4AfterBattleText
	jr .print
.afterBeat
	ld hl, _SaffronGymYoungster4AfterSabrinaText
	jr .print
.isChampion
	ld hl, _SaffronGymYoungster4AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.SaffronGymYoungster4AfterBattleText:
	text "That's right! I"
	line "used telepathy to"
	cont "read your mind!"
	done

_SaffronGymYoungster4AfterSabrinaText:
	text "My telepathy"
	line "tells me you"
	cont "are stronger with"
	cont "that BADGE!"
	done

_SaffronGymYoungster4AfterChampionText:
	text "I can read the"
	line "mind of the"
	cont "CHAMPION!"

	para "It's full of"
	line "great strategies!"
	done

_CinnabarGymSuperNerd1AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_VOLCANOBADGE, a
	jr nz, .afterBeat
	ld hl, .CinnabarGymSuperNerd1AfterBattleText
	jr .print
.afterBeat
	ld hl, _CinnabarGymSuperNerd1AfterBlaineText
	jr .print
.isChampion
	ld hl, _CinnabarGymSuperNerd1AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.CinnabarGymSuperNerd1AfterBattleText:
	text "Fire, or to be"
	line "more precise,"
	cont "combustion..."

	para "Blah, blah, blah,"
	line "blah..."
	done
	
_CinnabarGymSuperNerd1AfterBlaineText:
	text "BLAINE's passion"
	line "is like a perfect"
	cont "combustion!"

	para "You managed to"
	line "extinguish it!"
	done

_CinnabarGymSuperNerd1AfterChampionText:
	text "The CHAMPION's"
	line "power is over"
	cont "1000 degrees!"
	done
	
_CinnabarGymSuperNerd2AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_VOLCANOBADGE, a
	jr nz, .afterBeat
	ld hl, .CinnabarGymSuperNerd2AfterBattleText
	jr .print
.afterBeat
	ld hl, _CinnabarGymSuperNerd2AfterBlaineText
	jr .print
.isChampion
	ld hl, _CinnabarGymSuperNerd2AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.CinnabarGymSuperNerd2AfterBattleText:
	text "I can't help"
	line "stealing other"
	cont "people's #MON!"
	done
	
_CinnabarGymSuperNerd2AfterBlaineText:
	text "You stole the"
	line "victory right"
	cont "from BLAINE!"
	done

_CinnabarGymSuperNerd2AfterChampionText:
	text "Being CHAMPION"
	line "is the ultimate"
	cont "treasure, right?"

	para "I'll retire from"
	line "thievery and just"
	cont "watch your fame!"
	done
	
_CinnabarGymSuperNerd3AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_VOLCANOBADGE, a
	jr nz, .afterBeat
	ld hl, .CinnabarGymSuperNerd3AfterBattleText
	jr .print
.afterBeat
	ld hl, _CinnabarGymSuperNerd3AfterBlaineText
	jr .print
.isChampion
	ld hl, _CinnabarGymSuperNerd3AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.CinnabarGymSuperNerd3AfterBattleText:
	text "My theories are"
	line "too complicated"
	cont "for you!"
	done
	
_CinnabarGymSuperNerd3AfterBlaineText:
	text "My theories"
	line "didn't account"
	cont "for your skill!"
	done

_CinnabarGymSuperNerd3AfterChampionText:
	text "I'm writing a"
	line "new thesis on"
	cont "CHAMPIONS now."

	para "May I study"
	line "your battles?"
	done
	
_CinnabarGymSuperNerd4AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_VOLCANOBADGE, a
	jr nz, .afterBeat
	ld hl, .CinnabarGymSuperNerd4AfterBattleText
	jr .print
.afterBeat
	ld hl, _CinnabarGymSuperNerd4AfterBlaineText
	jr .print
.isChampion
	ld hl, _CinnabarGymSuperNerd4AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.CinnabarGymSuperNerd4AfterBattleText:
	text "I wish there was"
	line "a thief #MON!"
	cont "I'd use that!"
	done
	
_CinnabarGymSuperNerd4AfterBlaineText:
	text "Even without a"
	line "thief #MON,"
	cont "you took the"
	cont "BADGE!"
	done

_CinnabarGymSuperNerd4AfterChampionText:
	text "A CHAMPION needs"
	line "to guard their"
	cont "items well!"

	para "Everyone wants"
	line "what you have!"
	done
	
_CinnabarGymSuperNerd5AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_VOLCANOBADGE, a
	jr nz, .afterBeat
	ld hl, .CinnabarGymSuperNerd5AfterBattleText
	jr .print
.afterBeat
	ld hl, _CinnabarGymSuperNerd5AfterBlaineText
	jr .print
.isChampion
	ld hl, _CinnabarGymSuperNerd5AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.CinnabarGymSuperNerd5AfterBattleText:
	text "BLAINE was lost"
	line "in the mountains"
	cont "when a fiery bird"
	cont "#MON appeared."

	para "Its light enabled"
	line "BLAINE to find"
	cont "his way down!"
	done
	
_CinnabarGymSuperNerd5AfterBlaineText:
	text "That fiery bird"
	line "showed BLAINE"
	cont "the way."

	para "But you showed"
	line "him a real"
	cont "challenge!"
	done

_CinnabarGymSuperNerd5AfterChampionText:
	text "The CHAMPION is"
	line "like a legendary"
	cont "bird #MON!"

	para "You bring light"
	line "to all trainers!"
	done
	
_CinnabarGymSuperNerd6AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_VOLCANOBADGE, a
	jr nz, .afterBeat
	ld hl, .CinnabarGymSuperNerd6AfterBattleText
	jr .print
.afterBeat
	ld hl, _CinnabarGymSuperNerd6AfterBlaineText
	jr .print
.isChampion
	ld hl, _CinnabarGymSuperNerd6AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.CinnabarGymSuperNerd6AfterBattleText:
	text "Us fire #MON"
	line "fans like PONYTA"
	cont "and NINETALES!"
	done
	
_CinnabarGymSuperNerd6AfterBlaineText:
	text "PONYTA and"
	line "NINETALES couldn't"
	cont "stop you!"
	done

_CinnabarGymSuperNerd6AfterChampionText:
	text "Even the hottest"
	line "fire looks dim"
	cont "compared to the"
	cont "new CHAMPION!"
	done
	
_CinnabarGymSuperNerd7AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_VOLCANOBADGE, a
	jr nz, .afterBeat
	ld hl, .CinnabarGymSuperNerd7AfterBattleText
	jr .print
.afterBeat
	ld hl, _CinnabarGymSuperNerd7AfterBlaineText
	jr .print
.isChampion
	ld hl, _CinnabarGymSuperNerd7AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.CinnabarGymSuperNerd7AfterBattleText:
	text "Water beats fire!"
	line "But, fire melts"
	cont "ice #MON!"
	done
	
_CinnabarGymSuperNerd7AfterBlaineText:
	text "H2O is strong,"
	line "but your spirit"
	cont "is stronger!"
	done

_CinnabarGymSuperNerd7AfterChampionText:
	text "Fire melts ice,"
	line "but the CHAMPION"
	cont "melts all"
	cont "opposition!"
	done

_ViridianGymCooltrainerM1AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_EARTHBADGE, a
	jr nz, .afterBeat
	ld hl, .ViridianGymCooltrainerM1AfterBattleText
	jr .print
.afterBeat
	ld hl, _ViridianGymCooltrainerM1AfterEarthBadgeText
	jr .print
.isChampion
	ld hl, _ViridianGymCooltrainerM1AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.ViridianGymCooltrainerM1AfterBattleText:
	text "You need power to"
	line "keep up with our"
	cont "GYM LEADER!"
	done

_ViridianGymCooltrainerM1AfterEarthBadgeText:
	text "You didn't run"
	line "out of steam!"

	para "You matched our"
	line "LEADER's power!"
	done

_ViridianGymCooltrainerM1AfterChampionText:
	text "The CHAMPION's"
	line "energy is bottom-"
	cont "less! I'm out of"
	cont "gas just looking!"
	done
	
_ViridianGymHiker1AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_EARTHBADGE, a
	jr nz, .afterBeat
	ld hl, .ViridianGymHiker1AfterBattleText
	jr .print
.afterBeat
	ld hl, _ViridianGymHiker1AfterEarthBadgeText
	jr .print
.isChampion
	ld hl, _ViridianGymHiker1AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.ViridianGymHiker1AfterBattleText:
	text "I'm still not"
	line "worthy!"
	done

_ViridianGymHiker1AfterEarthBadgeText:
	text "Wargh! I'm still"
	line "not worthy of"
	cont "the EARTH BADGE!"
	done

_ViridianGymHiker1AfterChampionText:
	text "Even in a rage,"
	line "I can't touch"
	cont "the CHAMPION!"
	done
	
_ViridianGymRocker1AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_EARTHBADGE, a
	jr nz, .afterBeat
	ld hl, .ViridianGymRocker1AfterBattleText
	jr .print
.afterBeat
	ld hl, _ViridianGymRocker1AfterEarthBadgeText
	jr .print
.isChampion
	ld hl, _ViridianGymRocker1AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.ViridianGymRocker1AfterBattleText:
	text "Do you know the"
	line "identity of our"
	cont "GYM LEADER?"
	done

_ViridianGymRocker1AfterEarthBadgeText:
	text "So you found out"
	line "who the LEADER"
	cont "was. Incredible!"
	done

_ViridianGymRocker1AfterChampionText:
	text "YUJIROU is our"
	line "new LEADER now."

	para "The air of the"
	line "GYM has changed"
	cont "since you won!"
	done
	
_ViridianGymHiker2AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_EARTHBADGE, a
	jr nz, .afterBeat
	ld hl, .ViridianGymHiker2AfterBattleText
	jr .print
.afterBeat
	ld hl, _ViridianGymHiker2AfterEarthBadgeText
	jr .print
.isChampion
	ld hl, _ViridianGymHiker2AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.ViridianGymHiker2AfterBattleText:
	text "If my #MON"
	line "were as good at"
	cont "Karate as I..."
	done

_ViridianGymHiker2AfterEarthBadgeText:
	text "Your #MON"
	line "don't need Karate"
	cont "to be masters!"
	done

_ViridianGymHiker2AfterChampionText:
	text "I'm training"
	line "under YUJIROU."
	
	para "He says martial"
	line "arts and #MON"
	cont "share one path!"
	done
	
_ViridianGymCooltrainerM2AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_EARTHBADGE, a
	jr nz, .afterBeat
	ld hl, .ViridianGymCooltrainerM2AfterBattleText
	jr .print
.afterBeat
	ld hl, _ViridianGymCooltrainerM2AfterEarthBadgeText
	jr .print
.isChampion
	ld hl, _ViridianGymCooltrainerM2AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.ViridianGymCooltrainerM2AfterBattleText:
	text "The LEADER will"
	line "scold me!"
	done

_ViridianGymCooltrainerM2AfterEarthBadgeText:
	text "Losing with"
	line "style... I hope"
	cont "the LEADER isn't"
	cont "too mad."
	done

_ViridianGymCooltrainerM2AfterChampionText:
	text "YUJIROU is much"
	line "calmer than our"
	cont "previous LEADER."
	
	para "He values style"
	line "and talent!"
	done
	
_ViridianGymHiker3AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_EARTHBADGE, a
	jr nz, .afterBeat
	ld hl, .ViridianGymHiker3AfterBattleText
	jr .print
.afterBeat
	ld hl, _ViridianGymHiker3AfterEarthBadgeText
	jr .print
.isChampion
	ld hl, _ViridianGymHiker3AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.ViridianGymHiker3AfterBattleText:
	text "#MON LEAGUE?"
	line "You? Don't get"
	cont "cocky!"
	done

_ViridianGymHiker3AfterEarthBadgeText:
	text "#MON LEAGUE?"
	line "I guess you're"
	cont "ready after all!"
	done

_ViridianGymHiker3AfterChampionText:
	text "Bow down to the"
	line "CHAMPION!"
	
	para "My fate was to"
	line "witness your"
	cont "greatness!"
	done
	
_ViridianGymRocker2AfterBattleText::
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_EARTHBADGE, a
	jr nz, .afterBeat
	ld hl, .ViridianGymRocker2AfterBattleText
	jr .print
.afterBeat
	ld hl, _ViridianGymRocker2AfterEarthBadgeText
	jr .print
.isChampion
	ld hl, _ViridianGymRocker2AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.ViridianGymRocker2AfterBattleText:
	text "Wait! I was just"
	line "careless!"
	done

_ViridianGymRocker2AfterEarthBadgeText:
	text "That wasn't"
	line "carelessness..."
	cont "You're just good!"
	done

_ViridianGymRocker2AfterChampionText:
	text "My whip is"
	line "useless against"
	cont "the CHAMPION's"
	cont "spirit!"
	done
	
_ViridianGymCooltrainerM3AfterBattleText::
	text "You can go onto"
	line "#MON LEAGUE"
	cont "only by defeating"
	cont "our GYM LEADER!"
	done

_ViridianGymCooltrainerM3AfterEarthBadgeText:
	text "You defeated"
	line "the LEADER!"
	
	para "The LEAGUE awaits"
	line "you, TRAINER!"
	done

_ViridianGymCooltrainerM3AfterChampionText:
	text_asm
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .isChampion
	ld a, [wBeatGymFlags]
	bit BIT_EARTHBADGE, a
	jr nz, .afterBeat
	ld hl, .ViridianGymCooltrainerM3AfterBattleText
	jr .print
.afterBeat
	ld hl, _ViridianGymCooltrainerM3AfterEarthBadgeText
	jr .print
.isChampion
	ld hl, _ViridianGymCooltrainerM3AfterChampionText
.print
	call PrintText
	jp TextScriptEnd

.ViridianGymCooltrainerM3AfterBattleText:
	text "YUJIROU has"
	line "reopened the"
	cont "GYM for good."
	
	para "The era of the"
	line "CHAMPION has"
	cont "begun!"
	done
