;made by TotalTS

Music_Skateboard:
	channel_count 4
	channel 1, Music_Skateboard_Ch1
	channel 2, Music_Skateboard_Ch2
	channel 3, Music_Skateboard_Ch3
	channel 4, Music_Skateboard_Ch4

Music_Skateboard_Ch1:
	tempo 132
	volume 7, 7
	duty_cycle 1
	note_type 12, 10, 1
	octave 3
	note G_, 4
	note A_, 4
	note B_, 4
	octave 4
	note D_, 4
Music_Skateboard_MasterLoop_Ch1:
	sound_call Music_Skateboard_PartA_Ch1
	sound_call Music_Skateboard_PartA_Ch1
	sound_call Music_Skateboard_PartB_Ch1
	sound_loop 0, Music_Skateboard_MasterLoop_Ch1

Music_Skateboard_PartA_Ch1:
	note_type 12, 10, 1
	octave 3
	note B_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note C_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note D_, 2
	note F#, 2
	note A_, 2
	note D_, 2
	note G_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note B_, 2
	note E_, 2
	note F#, 2
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note F#, 2
	note_type 12, 11, 2
	octave 4
	note F#, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note F#, 8
	octave 3
	note B_, 2
	note A_, 2
	sound_ret

Music_Skateboard_PartB_Ch1:
	note_type 12, 10, 1
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note E_, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note E_, 2
	note G_, 2
	note A_, 2
	note E_, 2
	note C_, 2
	note E_, 2
	note A_, 2
	note B_, 2
	octave 4
	note C_, 2
	note D_, 2
	octave 3
	note D_, 1
	note F#, 1
	note A_, 1
	octave 4
	note C_, 1
	note D_, 1
	note F#, 1
	note A_, 1
	note C_, 1
	note_type 12, 10, 2
	octave 4
	note A_, 4
	note G_, 4
	note F#, 4
	note E_, 4
	octave 3
	note D_, 4
	note D_, 4
	sound_ret

Music_Skateboard_Ch2:
	duty_cycle 2
	vibrato 16, 1, 4
	note_type 12, 11, 2
	octave 3
	note D_, 4
	note G_, 4
	note B_, 4
	octave 4
	note D_, 4
Music_Skateboard_MasterLoop_Ch2:
	sound_call Music_Skateboard_PartA_Ch2
	sound_call Music_Skateboard_PartA_Ch2
	sound_call Music_Skateboard_PartB_Ch2
	sound_loop 0, Music_Skateboard_MasterLoop_Ch2

Music_Skateboard_PartA_Ch2:
	note_type 12, 11, 4
	note G_, 6
	note_type 12, 11, 1
	note F#, 1
	note G_, 1
	note_type 12, 11, 2
	note A_, 4
	note B_, 2
	octave 5
	note C_, 2
	note_type 12, 11, 2
	note D_, 2
	note C_, 2
	octave 4
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note_type 12, 11, 4
	note E_, 4
	note_type 12, 11, 2
	note D_, 3
	note E_, 1
	note F#, 4
	note G_, 3
	note A_, 1
	note B_, 4
	note_type 12, 11, 1
	octave 5
	note D_, 1
	note C#, 1
	note D_, 1
	note E_, 1
	note_type 12, 11, 6
	note D_, 8
	note_type 12, 11, 2
	octave 4
	note B_, 2
	note A_, 2
	sound_ret

Music_Skateboard_PartB_Ch2:
	note_type 12, 11, 4
	octave 4
	note E_, 6
	note G_, 2
	octave 5
	note C_, 8
	octave 4
	note F#, 6
	note A_, 2
	octave 5
	note D_, 8
	octave 4
	note_type 12, 11, 1
	note D_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 5
	note C_, 1
	note C#, 1
	note_type 12, 11, 4
	note D_, 4
	note C_, 4
	octave 4
	note B_, 4
	note A_, 4
	note G_, 4
	note F#, 4
	sound_ret

Music_Skateboard_Ch3:
	note_type 12, 1, 3
	octave 3
	note G_, 1
	rest 1
	octave 4
	note D_, 1
	rest 1
	octave 3
	note D_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	octave 4
	note D_, 1
	rest 1
	octave 3
	note B_, 1
	rest 1
	octave 4
	note D_, 1
	rest 1
Music_Skateboard_MasterLoop_Ch3:
	sound_call Music_Skateboard_PartA_Ch3
	sound_call Music_Skateboard_PartA_Ch3
	sound_call Music_Skateboard_PartB_Ch3
	sound_loop 0, Music_Skateboard_MasterLoop_Ch3

Music_Skateboard_PartA_Ch3:
	octave 3
	note G_, 1
	rest 1
	octave 4
	note D_, 1
	rest 1
	octave 3
	note D_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note D_, 1
	rest 1
	note G_, 1
	rest 1
	note B_, 1
	rest 1
	note C_, 1
	rest 1
	note G_, 1
	rest 1
	note E_, 1
	rest 1
	note G_, 1
	rest 1
	note D_, 1
	rest 1
	note A_, 1
	rest 1
	note F#, 1
	rest 1
	note A_, 1
	rest 1
	note E_, 1
	rest 1
	note B_, 1
	rest 1
	note G_, 1
	rest 1
	note B_, 1
	rest 1
	note A_, 1
	rest 1
	octave 4
	note E_, 1
	rest 1
	octave 3
	note E_, 1
	rest 1
	note A_, 1
	rest 1
	note D_, 1
	rest 1
	note F#, 1
	rest 1
	note A_, 1
	rest 1
	octave 4
	note D_, 1
	rest 1
	octave 3
	note F#, 1
	rest 1
	note A_, 1
	rest 1
	note B_, 1
	rest 1
	note G_, 1
	rest 1
	sound_ret

Music_Skateboard_PartB_Ch3:
	note C_, 1
	rest 1
	note G_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note G_, 1
	rest 1
	note C_, 1
	rest 1
	note G_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note G_, 1
	rest 1
	note A_, 1
	rest 1
	octave 4
	note E_, 1
	rest 1
	octave 3
	note E_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note E_, 1
	rest 1
	note A_, 1
	rest 1
	note B_, 1
	rest 1
	note G_, 1
	rest 1
	octave 4
	note D_, 1
	rest 1
	octave 3
	note D_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note A_, 1
	rest 1
	note D_, 1
	rest 1
	note F#, 1
	rest 1
	note D_, 1
	rest 1
	note A_, 1
	rest 1
	note D_, 1
	rest 1
	note F#, 1
	rest 1
	note A_, 1
	rest 1
	note F#, 1
	rest 1
	note A_, 1
	rest 1
	note D_, 1
	rest 1
	sound_ret

Music_Skateboard_Ch4:
	toggle_noise 1
	drum_speed 12
	rest 2
Music_Skateboard_branch_7de6a:
	sound_call Music_Skateboard_branch_7dea7
	sound_loop 0, Music_Skateboard_branch_7de6a

Music_Skateboard_branch_7dea7:
	rest 2
	drum_note 9, 2
	rest 2
	drum_note 9, 2
	rest 2
	drum_note 9, 2
	rest 2
	drum_note 9, 2
	sound_ret
