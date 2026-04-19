SFX_Intro_Lunge::
	channel_count 1
	channel 8, SFX_Intro_Lunge_Ch8

SFX_Intro_Hip::
	channel_count 1
	channel 5, SFX_Intro_Hip_Ch5

SFX_Intro_Hop::
	channel_count 1
	channel 5, SFX_Intro_Hop_Ch5

SFX_Intro_Raise::
	channel_count 1
	channel 8, SFX_Intro_Raise_Ch8

SFX_Intro_Crash::
	channel_count 1
	channel 8, SFX_Intro_Crash_Ch8

SFX_Intro_Whoosh::
	channel_count 1
	channel 8, SFX_Intro_Whoosh_Ch8

SFX_Slots_Stop_Wheel::
	channel_count 1
	channel 5, SFX_Slots_Stop_Wheel_Ch5

SFX_Slots_Reward::
	channel_count 1
	channel 5, SFX_Slots_Reward_Ch5

SFX_Slots_New_Spin::
	channel_count 2
	channel 5, SFX_Slots_New_Spin_Ch5
	channel 6, SFX_Slots_New_Spin_Ch6

SFX_Shooting_Star::
	channel_count 1
	channel 5, SFX_Shooting_Star_Ch5

SFX_Call::
	channel_count 1
	channel 5, SFX_Call_Ch5

SFX_Call_Ch5:
	pitch_sweep 6, 7
	square_note 4, 15, 7, 1952
	square_note 4, 15, 7, 1952
	square_note 4, 15, 7, 1952
	square_note 4, 15, 7, 1952
	square_note 4, 15, 7, 1952
	pitch_sweep 0, 8
	square_note 4, 0, 0, 0
	sound_ret
	
SFX_HangUp::
	channel_count 1
	channel 5, SFX_HangUp_Ch5
	
SFX_NoSignal::
	channel_count 1
	channel 5, SFX_NoSignal_Ch5
	
SFX_HangUp_Ch5:
	duty_cycle 2
	square_note 4, 11, 8, 1915
	square_note 2, 2, 1, 1915
	square_note 16, 0, 0, 0

SFX_NoSignal_Ch5:
	duty_cycle 2
	square_note 20, 14, 8, 1803
	square_note 28, 0, 0, 0
	sound_loop 3, SFX_NoSignal_Ch5
	sound_ret
