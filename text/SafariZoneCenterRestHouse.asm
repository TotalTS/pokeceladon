_SafariZoneCenterRestHouseGirlText::
	text "SARA: Where did"
	line "my boy friend,"
	cont "ERIK, go?"
	done

_SafariZoneCenterRestHouseScientistText::
	text "I'm catching"
	line "#MON to take"
	cont "home as gifts!"
	done

_SaraGivePokegearText::
	text "SARA: You've"
	line "seen ERIK? That"
	cont "boy is always"
	cont "mixing things up!"

	para "Here, if you see"
	line "him, give him"
	cont "this device."
	prompt
	
_SaraGivePokegearText2::
	text "It's a #GEAR"
	line "prototype from"
	cont "another REGION!"
	
	para "Please, give"
	line "ERIK the"
	cont "#GEAR!"
	done

_SaraFindErikText::	
	text "Please, give"
	line "ERIK the"
	cont "#GEAR!"
	done
	
_ErikReunionText::
	text "ERIK: Thanks,"
	line "kid! This"
	cont "#GEAR has"
	cont "no signal"
	cont "in here..."

	para "But at least we"
	line "found each other!"
	done

_SaraReunionText::
	text "SARA: It's a neat"
	line "device, right?"

	para "They say it will"
	line "be very popular"
	cont "in a far away"
	cont "REGION someday!"
	done

_SafariZoneCenterSaraGotPokeGearText::
	text "<PLAYER> got"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_SafariZoneCenterBagFullText::
	text "You can't carry"
	line "any more items."
	done

_OakPokegearCancelText::
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that! "
	
	para "(It hasn't been"
	line "invented yet...)"
	prompt
