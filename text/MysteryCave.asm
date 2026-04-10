_MysteryCaveSuperNerdText::
	text "Oh! You're the"
	line "CHAMPION!"
	
	para "Nice to meet you!"
	
	para "I was exploring"
	line "this place..."
	
	para "And I found a"
	line "FOSSIL!"
	prompt

_MysteryCaveSuperNerdAlreadyGotText::
	text "This place is"
	line "huge!"
	
	para "There are many"
	line "TRAINERS..."
	
	para "And strong"
	line "#MON too!"
	done

_MysteryCaveSuperNerdYouHaveNoRoomText::
	text "Look, you've got"
	line "no room for this.@"
	done

_MysteryCaveSuperNerdReceivedFossilText::
	text "<PLAYER> got the"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end
