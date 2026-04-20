_CeladonMart1FPhoneText::
	text "It's a phone!"
	
	para "Wanna call home?"
	done

_CeladonMart1FPhoneEllipseText::
	text "……"
	done
	
_PhoneClickText::
	text "Click!"
	done

; Start/End Text

_MomPhoneText_Default::
	text "Hi <PLAYER>!"
	line "How are you?"
	prompt
	
_MomPhoneText_EndText::
	text "Take care!"
	prompt

; Pokemon Status (first in party) wPartyMon1Status, wPartyMon1Species

_MomPhoneText_StatusOK::
	text "Your @"
	text_ram wNameBuffer
	text_start
	line "looks healthy!"

	para "You are taking"
	line "such good care"
	cont "of it, dear!"
	prompt

_MomPhoneText_StatusPoisoned::
	text "Your @"
	text_ram wNameBuffer
	text_start
	line "looks pale..."

	para "Is it POISONED?"

	para "Please use an"
	line "ANTIDOTE right"
	cont "away, <PLAYER>!"
	prompt

_MomPhoneText_StatusParalyzed::
	text "Your @"
	text_ram wNameBuffer
	text_start
	line "can barely move!"

	para "It must be"
	line "PARALYZED..."

	para "Use a PARLYZ"
	line "HEAL, honey!"
	prompt

_MomPhoneText_StatusBurned::
	text "Your @"
	text_ram wNameBuffer
	text_start
	line "looks like it"
	cont "is in pain!"

	para "Is it BURNED?"

	para "Please use a"
	line "BURN HEAL right"
	cont "away!"
	prompt

_MomPhoneText_StatusFrozen::
	text "Your @"
	text_ram wNameBuffer
	text_start
	line "is not moving"
	cont "at all!"

	para "It looks FROZEN"
	line "solid..."

	para "Warm it up"
	line "with an ICE"
	cont "HEAL, dear!"
	prompt

_MomPhoneText_StatusAsleep::
	text "Your @"
	text_ram wNameBuffer
	text_start
	line "looks sleepy..."

	para "Let it rest"
	line "if it needs to!"

	para "Even #MON"
	line "need a good"
	cont "night of sleep!"
	prompt

_MomPhoneText_StatusFainted::
	text "Oh no, your @"
	text_ram wNameBuffer
	text_start
	line "has fainted!"

	para "Please get to"
	line "a #MON CENTER"
	cont "right away!"

	para "They need rest,"
	line "<PLAYER>!"
	prompt

_MomPhoneText_Evolution::
	text "Your @"
	text_ram wNameBuffer
	text_start
	line "just evolved?"

	para "I thought I"
	line "felt something"
	cont "special just now!"

	para "They grow up"
	line "so fast..."

	para "Just like you"
	line "did, <PLAYER>!"
	prompt
	
; Pokémon Check
; EVENT_GOT_BULBASAUR_IN_CERULEAN, EVENT_GOT_CHARMANDER_FROM_DAMIAN, EVENT_GOT_SQUIRTLE_FROM_OFFICER_JENNY
; EVENT_GOT_HITMONLEE, EVENT_GOT_HITMONCHAN
; TOGGLE_CELADON_MANSION_EEVEE_GIFT ; wToggleableObjectIndex (if hidden)
; EVENT_BEAT_ARTICUNO, EVENT_BEAT_ZAPDOS, EVENT_BEAT_MOLTRES
; EVENT_BEAT_MEWTWO, EVENT_FOUND_MEW

_MomPhoneText_Bulbasaur::
	text "You got a"
	line "BULBASAUR?"

	para "What a gentle"
	line "little #MON!"

	para "Take good care"
	line "of it, and it"
	cont "will do the same"
	cont "for you!"
	prompt

_MomPhoneText_Charmander::
	text "Someone gave"
	line "you a CHARMANDER?"

	para "How kind!"

	para "That flame must"
	line "keep you both"
	cont "warm at night!"
	prompt

_MomPhoneText_Squirtle::
	text "OFFICER JENNY"
	line "gave you a"
	cont "SQUIRTLE?"

	para "What an honor!"

	para "That little one"
	line "will be a loyal"
	cont "partner, I know!"
	prompt
	
_MomPhoneText_Eevee::
	text "Oh, you found"
	line "an EEVEE?"

	para "They're so rare"
	line "and cute!"

	para "Take good care"
	line "of it, dear."

	para "It may grow into"
	line "something special!"
	prompt
	
_MomPhoneText_Hitmonlee::
    text "A #MON"
    line "that kicks?"

	para "That must be a"
	line "strong partner!"

	para "Take good care"
	line "of it, honey."
    prompt

_MomPhoneText_Hitmonchan::
	text "A #MON"
	line "with boxing"
	cont "gloves?"

	para "How cute!"

	para "It looks like"
	line "it can really"
	cont "protect you!"
	prompt
	
_MomPhoneText_Articuno::
	text "You found a"
	line "giant ICE BIRD?"

	para "ARTICUNO sounds"
	line "so majestic..."

	para "And so cold!"
	line "Stay warm, dear!"
	prompt

_MomPhoneText_Zapdos::
	text "An ELECTRIC"
	line "BIRD?"

	para "ZAPDOS sounds"
	line "terrifying!"

	para "Be careful"
	line "around that"
	cont "lightning!"
	prompt

_MomPhoneText_Moltres::
	text "A FIRE BIRD?"
	line "MOLTRES?"

	para "That sounds"
	line "breathtaking!"

	para "Don't get too"
	line "close to the"
	cont "flames!"
	prompt
	
_MomPhoneText_Mewtwo::
	text "You went deep"
	line "into CERULEAN"
	cont "CAVE?"

	para "And you found"
	line "MEWTWO there?"

	para "I... I don't"
	line "even know what"
	cont "to say, dear."

	para "Please just"
	line "come home safe,"
	cont "<PLAYER>."
	prompt

_MomPhoneText_Mew::
	text "You found"
	line "MEW?!"

	para "But... they say"
	line "MEW doesn't"
	cont "even exist!"

	para "How is that"
	line "possible?"

	para "You truly are"
	line "one of a kind,"
	cont "<PLAYER>!"
	prompt

; HMs Check
; EVENT_GOT_HM02, EVENT_GOT_HM03, EVENT_GOT_HM04

_MomPhoneText_Fly::
	text "You can FLY now?"
	line "That's amazing!"

	para "Don't forget to"
	line "visit me"
	cont "sometimes, okay?"
	prompt
	
_MomPhoneText_Surf::
	text "You can swim on"
	line "your #MON now?"

	para "SURFING sounds"
	line "so exciting!"

	para "Just don't go"
	line "too far from"
	cont "the shore."
	prompt
	
_MomPhoneText_Strength::
	text "Moving heavy"
	line "boulders?"
	
	para "I'm amazed at"
	line "how strong you"
	cont "have become!"
	prompt
	
; Progress Events

; Lavender Town

; EVENT_GOT_HM05, EVENT_ROCK_TUNNEL_FLASH_HELP, EVENT_ROCK_TUNNEL_FLASH_HELP2
; EVENT_BEAT_GHOST_MAROWAK, EVENT_RESCUED_MR_FUJI, EVENT_GOT_POKE_FLUTE

_MomPhoneText_Flash::
	text "ROCK TUNNEL?"
	line "A dark cave?"

	para "That sounds scary."

	para "<PLAYER>..."
	line "I heard rumors"
	cont "about GHOSTs in"
	cont "LAVENDER TOWN."

	para "Please be extra"
	line "careful, honey!"
	prompt

_MomPhoneText_FlashHelp1or2::
	text "ROCK TUNNEL?"
	line "A dark cave?"

	para "That sounds scary."
	line "I'm glad someone"
	cont "helped you!"

	para "<PLAYER>..."
	line "I heard rumors"
	cont "about GHOSTs in"
	cont "LAVENDER TOWN."

	para "Please be extra"
	line "careful, honey!"
	prompt
	
_MomPhoneText_Marowak::
	text "You saw a GHOST?"
	line "That's scary!"

	para "Are you okay?"
	prompt
	
_MomPhoneText_Fuji::
	text "You saved"
	line "MR. FUJI?"

	para "I'm so proud of"
	line "you, <PLAYER>!"

	para "You're so brave!"
	prompt
	
_MomPhoneText_Flute::
    text "A # FLUTE?"
    line "What a lovely"
    cont "melody it must"
    cont "have!"

    para "Stay safe on the"
    line "road, dear!"
	prompt
	
; EVENT_FOUND_ROCKET_HIDEOUT, EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI
	
_MomPhoneText_RocketHideoutFound::
	text "A secret base"
    line "under the"
    cont "GAME CORNER?"
	
	para "In CELADON"
	line "CITY?"

	para "That sounds"
	line "dangerous..."

	para "Please be careful,"
	line "<PLAYER>!"
	prompt
	
_MomPhoneText_GiovanniCeladon::
	text "You stopped"
	line "TEAM ROCKET?"

	para "I'm so proud of"
	line "you, <PLAYER>!"
	
	para "You're getting"
	line "so strong, honey!"

	para "But please don't"
	line "push too hard."
	prompt
	
; EVENT_RESCUED_MR_FUJI and visited Saffron (should be registered in fly warps)

_MomPhoneText_SilphCoBlocked::
	text "SILPH CO. is"
	line "blocked off?"

	para "That sounds"
	line "serious..."

	para "Please be careful,"
	line "<PLAYER>."
	prompt

_MomPhoneText_GuardSleeping::
	text "You got inside"
	line "SILPH CO.?"

	para "Be careful..."
	line "Something feels"
	cont "wrong there."
	prompt
	
; EVENT_BEAT_SILPH_CO_GIOVANNI, EVENT_GOT_MASTER_BALL

_MomPhoneText_GiovanniSilph::
	text "You saved"
	line "everyone at"
	cont "SILPH CO.?"

	para "Wow!"

	para "SAFFRON CITY"
	line "is in your"
	cont "debt!"
	prompt

_MomPhoneText_MasterBall::
	text "A MASTER BALL?"

	para "That is a huge"
	line "gift from the"
	cont "PRESIDENT!"

	para "You must be very"
	line "special, dear!"
	prompt
	
; EVENT_BEAT_ROUTE12_SNORLAX, EVENT_BEAT_ROUTE16_SNORLAX and visited FUCHSIA
	
_MomPhoneText_Snorlax12::
	text "You arrived in"
	line "FUCHSIA through"
	cont "the SEA ROUTE?"

	para "The ocean air is"
	line "so good for"
	cont "your health!"
	prompt

_MomPhoneText_Snorlax16::
	text "You finally made"
	line "it to FUCHSIA?"

	para "You arrived via"
	line "CYCLING ROAD?"

	para "That is quite a"
	line "long ride!"
	prompt

_MomPhoneText_BothSnorlax::
	text "You finally made"
	line "it to FUCHSIA?"

	para "Are your shoes"
	line "still holding up?"

	para "That's a lot of"
	line "walking, dear!"
	prompt
	
; EVENT_GAVE_GOLD_TEETH

_MomPhoneText_GoldTeeth::
	text "You found some"
	line "GOLD TEETH?"

	para "How unusual!"

	para "I'm glad the"
	line "WARDEN has his"
	cont "smile back now."
	prompt
	
; EVENT_GAVE_FOSSIL_TO_LAB

_MomPhoneText_FossilToLab::
	text "You arrived to"
	line "CINNABAR ISLAND?"

	para "You gave a FOSSIL"
	line "to the CINNABAR"
	cont "LAB?"

	para "I wonder what"
	line "is inside it..."

	para "Science is so"
	line "amazing, dear!"
	prompt
	
; Check Item SECRET KEY

_MomPhoneText_SecretKey::
	text "You found a"
	line "SECRET KEY?"

	para "What does it"
	line "open, I wonder?"

	para "Be careful"
	line "on that ISLAND,"
	cont "honey!"
	prompt
	
; Gym Check

; EVENT_BEAT_ERIKA, EVENT_BEAT_KARATE_MASTER, EVENT_BEAT_SABRINA, EVENT_BEAT_KOGA, EVENT_BEAT_BLAINE, EVENT_VIRIDIAN_GYM_OPEN, EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI

_MomPhoneText_Erika::
	text "You beat ERIKA?"

	para "I heard she is"
	line "very kind."

	para "Grass #MON are"
	line "so calming..."

	para "You're doing great,"
	line "<PLAYER>!"
	prompt

_MomPhoneText_KarateMaster::
	text "You beat the"
	line "KARATE MASTER?"

	para "You are becoming"
	line "quite the tough"
	cont "fighter, honey!"

	para "I'm impressed!"
    prompt

_MomPhoneText_Sabrina::
	text "You won"
	line "the MARSHBADGE?"

	para "I heard SABRINA"
	line "has psychic"
	cont "powers..."

	para "Did she see"
	line "your victory"
	cont "coming?"
	prompt

_MomPhoneText_Koga::
	text "You beat KOGA"
	line "at the GYM?"

	para "Ninja tactics"
	line "are no match"
	cont "for you!"

	para "The SOULBADGE"
	line "looks great!"
	prompt

_MomPhoneText_Blaine::
	text "You beat BLAINE?"

	para "A VOLCANOBADGE!"

	para "That old man"
	line "is no pushover!"

	para "I'm so proud"
	line "of you, dear!"
	prompt

_MomPhoneText_ViridianGymOpen::
	text "The VIRIDIAN"
	line "GYM is open?"

	para "I wonder who"
	line "the LEADER is..."

	para "Be ready for"
	line "anything, honey!"
	prompt

_MomPhoneText_GiovanniViridian::
	text "You beat the"
	line "VIRIDIAN GYM?"

	para "GIOVANNI was"
	line "the LEADER?"

	para "You've come so"
	line "far, <PLAYER>!"
	prompt
	
; Rival Check

; EVENT_BEAT_POKEMON_TOWER_RIVAL, EVENT_BEAT_SILPH_CO_RIVAL, EVENT_BEAT_ROUTE22_RIVAL_2ND_BATTLE
	
_MomPhoneText_RivalTower::
	text "Oh, you saw"
	line "<RIVAL> lately?"

	para "Is he still rude?"

	para "He's always been"
	line "so busy..."
	prompt

_MomPhoneText_RivalSilph::
	text "You saw"
	line "<RIVAL> again?"

	para "Always rushing"
	line "ahead, isn't he?"

	para "Just take things"
	line "at your pace."

	para "I hope he's"
	line "treating you"
	cont "well."
	prompt

_MomPhoneText_RivalRoute22::
	text "You saw <RIVAL>"
	line "on ROUTE 22"
	cont "again?"

	para "He must be"
	line "headed somewhere"
	cont "important..."

	para "Don't let him"
	line "get ahead of"
	cont "you, <PLAYER>!"
	prompt

; Badge Checks

; EVENT_PASSED_CASCADEBADGE_CHECK, EVENT_PASSED_THUNDERBADGE_CHECK, EVENT_PASSED_RAINBOWBADGE_CHECK, EVENT_PASSED_SOULBADGE_CHECK, EVENT_PASSED_MARSHBADGE_CHECK, EVENT_PASSED_VOLCANOBADGE_CHECK, EVENT_PASSED_EARTHBADGE_CHECK

_MomPhoneText_CascadeBadgeCheck::
	text "You passed the"
	line "CASCADE BADGE"
	cont "check?"

	para "VICTORY ROAD"
	line "is getting"
	cont "closer, dear!"
	prompt

_MomPhoneText_ThunderBadgeCheck::
	text "Another badge"
	line "check passed!"

	para "You collected"
	line "so many badges"
	cont "already!"

	para "I can hardly"
	line "believe it!"
	prompt

_MomPhoneText_RainbowBadgeCheck::
	text "Halfway through"
	line "the badge checks!"

	para "You've worked"
	line "so hard for"
	cont "this, <PLAYER>!"
	prompt

_MomPhoneText_SoulBadgeCheck::
	text "You are getting"
	line "so close now!"

	para "Every badge"
	line "tells a story"
	cont "of your journey!"

	para "I am so proud,"
	line "honey!"
	prompt

_MomPhoneText_MarshBadgeCheck::
	text "Almost there!"
	line "Just a few"
	cont "more checks!"

	para "You have come"
	line "such a long"
	cont "way, <PLAYER>!"
	prompt

_MomPhoneText_VolcanoBadgeCheck::
	text "One more badge"
	line "check to go!"

	para "My heart is"
	line "racing just"
	cont "hearing this!"

	para "You can do it,"
	line "honey!"
	prompt

_MomPhoneText_EarthBadgeCheck::
	text "You passed all"
	line "the badge checks?"

	para "VICTORY ROAD"
	line "awaits you!"

	para "Give it your"
	line "very best,"
	cont "<PLAYER>!"
	prompt
	
; Champion

; EVENT_PLAYER_IS_CHAMPION

_MomPhoneText_Champion::
	text "You... you are"
	line "the CHAMPION?"

	para "I had to sit"
	line "down when I"
	cont "heard the news!"

	para "You left PALLET"
	line "TOWN as my "
	cont "little kid..."

	para "And came back"
	line "as CHAMPION!"

	para "I love you so"
	line "much, <PLAYER>!"
	prompt
