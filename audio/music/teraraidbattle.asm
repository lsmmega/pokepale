Music_teraraidbattle:
	channel_count 4
	channel 1, Music_teraraidbattle_Ch1
	channel 2, Music_teraraidbattle_Ch2
	channel 3, Music_teraraidbattle_Ch3
	channel 4, Music_teraraidbattle_Ch4

Music_teraraidbattle_Ch1:
	volume 7, 7
	note_type 12, 15, 8
.mainLoop:
	tempo 126
	octave 3
	volume_envelope 5, 8
	vibrato 0, 3, 1
	duty_cycle 1
	note C_, 16
	note F_, 8
	octave 4
	note C_, 8
	octave 3
	note A#, 16
	note F_, 12
	note_type 6, 5, 8
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note_type 12, 7, 8
	note G_, 3
	note G_, 3
	note G_, 2
	note G_, 2
	rest 6
.loop1:
	volume_envelope 5, 8
	note F_, 16
	note F_, 8
	note E_, 8
	note A_, 16
	note A_, 8
	note G_, 8
	note F_, 16
	note F_, 8
	note E_, 8
	note D_, 16
	note G_, 16
	sound_loop 2, .loop1
	octave 3
	note C_, 16
	octave 2
	note A_, 16
	octave 3
	note D_, 16
	note C_, 16
	note F_, 16
	note E_, 16
	note D_, 16
	note A_, 15
	rest 1
	octave 4
	note C_, 16
	octave 3
	note A_, 16
	note A_, 16
	note F_, 16
	note F_, 16
	note F_, 16
	note F_, 16
	note F_, 8
	note E_, 8
.loop2:
	note C_, 16
	note C#, 16
	note C_, 16
	note G_, 16
	note D_, 16
	note F_, 16
	note D_, 16
	note G_, 16
	sound_loop 2, .loop2
	octave 3
	note G#, 16
	octave 4
.loop3:
	note C_, 8
	octave 3
	note A#, 8
	octave 4
	note C_, 16
	sound_loop 3, .loop3
	octave 4
	note C_, 8
	octave 3
	note A#, 8
	octave 4
	note F_, 16
	note F_, 16
	octave 3
	note A#, 16
	note A#, 16
	octave 4
	note F_, 16
	note F_, 16
	octave 3
	note A#, 16
	note A#, 16
	note C_, 16
	note C_, 16
	note C#, 16
	note C#, 15
	rest 1
	octave 8
	sound_loop 0, .mainLoop

Music_teraraidbattle_Ch2:
	note_type 12, 15, 8
.mainLoop:
	octave 3
	volume_envelope 5, 8
	vibrato 0, 3, 1
	duty_cycle 1
	note G#, 16
	note G#, 8
	octave 4
	note D#, 8
	note D_, 16
	octave 3
	note A#, 12
	note_type 6, 5, 8
	note A#, 1
	note B_, 1
	octave 4
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note_type 12, 7, 8
	note C_, 3
	note C_, 3
	note C_, 2
	note C_, 2
	rest 6
	vibrato 0, 0, 0
	volume_envelope 14, 6
	sound_call .sub1
	octave 4
	note F_, 3
	note E_, 3
	note C_, 3
	rest 1
	octave 3
	note F_, 2
	note A_, 2
	note A#, 2
	octave 4
	note C_, 3
	rest 1
	octave 3
	note A#, 3
	rest 1
	note A_, 3
	note G_, 3
	note F_, 2
	octave 4
	sound_call .sub1
	note_type 12, 14, 6
	octave 4
	note F_, 3
	note E_, 3
	note C_, 3
	rest 1
	octave 3
	note F_, 2
	note A_, 2
	note A#, 2
	octave 4
	note C_, 3
	rest 1
	note D_, 3
	rest 1
	octave 3
	note A_, 3
	note G_, 3
	note F_, 2
	octave 4
	sound_call .sub1
	note_type 12, 14, 6
	octave 4
	note F_, 3
	note E_, 3
	note C_, 3
	rest 1
	octave 3
	note F_, 2
	note A_, 2
	note A#, 2
	octave 4
	note C_, 3
	rest 1
	octave 3
	note A#, 3
	rest 1
	note A_, 3
	note G_, 3
	note F_, 2
	octave 4
	sound_call .sub1
	note_type 12, 14, 6
	octave 3
	note A_, 3
	rest 1
	note C_, 3
	rest 1
	note A_, 3
	rest 1
	note A#, 3
	rest 1
	note A_, 3
	note A#, 3
	octave 4
	note C_, 3
	octave 3
	rest 1
	note A_, 2
	note G_, 2
	note F_, 2
	volume_envelope 5, 8
	vibrato 0, 3, 1
	note F_, 16
	note E_, 16
	note F_, 16
	note G_, 16
	note A#, 16
	note A_, 16
	note G_, 16
	octave 4
	note C_, 15
	rest 1
	note F_, 16
	note E_, 16
	note D_, 16
	note C_, 16
	octave 3
	note A#, 16
	note A_, 16
	note A#, 16
	octave 4
	note C_, 16
	volume_envelope 12, 8
	vibrato 0, 0, 0
	octave 3
.loop1:
	rest 2
	note F_, 2
	rest 1
	note F_, 2
	rest 1
	note F_, 2
	note G_, 1
	note A_, 3
	rest 4
	note E_, 2
	rest 1
	note E_, 2
	rest 1
	note E_, 2
	note F_, 1
	note G_, 3
	note E_, 2
	note F_, 2
	rest 1
	note F_, 2
	rest 1
	note F_, 2
	note F_, 2
	note G_, 1
	note A_, 3
	note A#, 2
	octave 4
	note C_, 3
	rest 1
	note D_, 3
	octave 3
	rest 1
	note A_, 3
	note G_, 3
	note G_, 2
	note F_, 2
	note F_, 5
	rest 3
	note G_, 1
	note A_, 3
	note A#, 2
	octave 4
	note C_, 3
	rest 1
	octave 3
	note A_, 3
	rest 1
	note F_, 3
	rest 1
	note C_, 3
	rest 1
	octave 2
	note A#, 3
	rest 1
	octave 3
	note D_, 3
	rest 1
	note A_, 3
	rest 1
	note A#, 3
	rest 1
	note A_, 7
	rest 1
	note G_, 7
	rest 1
	sound_loop 2, .loop1
	octave 3
.loop2:
	note F_, 15
	rest 1
	note G#, 7
	rest 1
	note G_, 7
	rest 1
	sound_loop 4, .loop2
	octave 4
	vibrato 0, 3, 1
	volume_envelope 5, 8
	note A_, 16
	note A_, 16
	note F#, 16
	note F#, 16
	note G#, 16
	note G#, 16
	note F#, 16
	note F#, 16
	octave 3
	note F_, 16
	note F_, 16
	note F#, 16
	note F#, 15
	rest 1
	octave 8
	sound_loop 0, .mainLoop

.sub1:
	volume_envelope 14, 6
	duty_cycle 1
	note F_, 3
	note E_, 3
	note C_, 4
	octave 3
	note A_, 2
	note G_, 2
	note F_, 2
	note G_, 3
	note A_, 3
	note F_, 4
	note E_, 4
	note F_, 2
	sound_ret

Music_teraraidbattle_Ch3:
	note_type 12, 1, 0
.mainLoop:
	octave 6
.loop1:
	note G_, 2
	note G#, 2
	note F_, 2
	note G_, 2
	note C_, 2
	note D#, 2
	note F_, 2
	note A#, 2
	sound_loop 4, .loop1
	octave 7
	note C_, 3
	note C_, 3
	note C_, 2
	note C_, 7
	rest 1
	octave 2
.loop2:
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note E_, 2
	note E_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note C_, 2
	note C_, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	octave 3
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	octave 2
	sound_loop 2, .loop2
	octave 4
	volume_envelope 1, 4
	note F_, 11
	rest 1
	note A_, 3
	rest 1
	note G_, 5
	rest 3
	note A_, 3
	rest 1
	note E_, 3
	rest 1
	note F_, 7
	rest 5
	octave 5
	note F_, 3
	rest 1
	note E_, 3
	rest 1
	note D_, 3
	rest 1
	note C_, 3
	rest 1
	octave 4
	note A#, 3
	rest 1
	octave 5
	note C_, 3
	note D_, 2
	rest 1
	octave 4
	note F_, 6
	note G_, 2
	note F_, 2
	note G_, 3
	note A_, 2
	rest 1
	note F_, 5
	rest 1
	note G_, 3
	rest 1
	note A_, 3
	rest 1
	note C_, 3
	rest 1
	note A_, 3
	rest 1
	note A#, 3
	rest 1
	note A_, 3
	note A#, 2
	rest 1
	octave 5
	note C_, 4
	octave 4
	note A_, 2
	note G_, 2
	note E_, 2
	octave 5
	note F_, 7
	rest 5
	note A_, 3
	rest 1
	note G_, 5
	rest 3
	note A_, 3
	rest 1
	note E_, 3
	rest 1
	note F_, 7
	rest 5
	octave 6
	note F_, 3
	rest 1
	note E_, 3
	rest 1
	note D_, 3
	rest 1
	note C_, 3
	rest 1
	octave 5
	note A#, 3
	rest 1
	octave 6
	note C_, 3
	note D_, 2
	rest 1
	octave 5
	note F_, 5
	rest 1
	note G_, 2
	note F_, 2
	note G_, 3
	note A_, 2
	rest 1
	note F_, 3
	rest 3
	note G_, 3
	rest 1
	note A_, 3
	rest 1
	note C_, 3
	rest 1
	note A_, 3
	rest 1
	note A#, 3
	rest 1
	note A_, 7
	rest 1
	note G_, 7
	rest 1
	octave 2
	volume_envelope 1, 0
.loop3:
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	octave 3
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	octave 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A_, 2
	note A_, 2
	octave 3
	note C_, 2
	note C_, 2
	note F_, 2
	note F_, 2
	note C_, 2
	octave 2
	note A_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	octave 3
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	octave 2
	sound_loop 2, .loop3
	octave 3
	sound_call .sub1
	octave 2
	note A#, 2
	octave 3
	sound_call .sub1
	note_type 12, 1, 0
	octave 3
	note E_, 2
	octave 6
.loop4:
	note G_, 2
	note G#, 2
	note F_, 2
	note G_, 2
	note C_, 2
	note D#, 2
	note F_, 2
	note A#, 2
	sound_loop 12, .loop4
	octave 8
	sound_loop 0, .mainLoop

.sub1:
	note C#, 2
	note C#, 2
	note C#, 2
	note C#, 2
	octave 2
	note G#, 2
	note G#, 2
	octave 3
	note C#, 2
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note C#, 2
	note C#, 2
	note C#, 2
	octave 2
	note G#, 2
	note G#, 2
	octave 3
	note C#, 2
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	octave 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	octave 3
	note D#, 3
	octave 2
	note A#, 3
	octave 3
	note D#, 2
	octave 2
	note A#, 3
	octave 3
	note D#, 3
	sound_ret

Music_teraraidbattle_Ch4:
	toggle_noise 0
	drum_speed 12
.mainLoop:
	toggle_noise
	toggle_noise 3
	octave 8
.loop1:
	drum_note 1, 3
	rest 1
	drum_note 12, 3
	rest 1
	drum_note 1, 3
	drum_note 1, 2
	drum_note 1, 1
	drum_note 1, 2
	sound_loop 3, .loop1
	drum_note 1, 3
	rest 1
	drum_note 12, 3
	rest 1
	drum_note 1, 3
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 1, 2
	drum_note 12, 1
	drum_note 1, 2
	drum_note 12, 1
	drum_note 1, 2
	drum_note 1, 2
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 2
	sound_call .sub1
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 1
	drum_note 12, 2
	sound_call .sub1
	octave 8
	drum_speed 12
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 3
	drum_note 1, 1
	drum_note 1, 2
	drum_note 12, 2
	drum_note 12, 2
.loop2:
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	sound_loop 14, .loop2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 12, 2
	octave 8
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 3
	drum_note 12, 2
	drum_note 1, 1
	drum_note 12, 2
.loop3:
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 1
	drum_note 1, 1
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 3
	drum_note 12, 1
	drum_note 1, 2
	drum_note 12, 2
	sound_loop 2, .loop3
.loop4:
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	sound_loop 7, .loop4
	drum_note 1, 3
	drum_note 12, 3
	drum_note 1, 2
	drum_note 1, 3
	drum_note 12, 3
	drum_note 1, 2
.loop5:
	drum_note 1, 3
	rest 1
	drum_note 12, 3
	rest 1
	drum_note 1, 3
	drum_note 1, 2
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 3
	rest 1
	drum_note 12, 3
	rest 1
	drum_note 1, 3
	drum_note 1, 2
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 3
	rest 1
	drum_note 12, 3
	rest 1
	drum_note 1, 3
	drum_note 1, 2
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 3
	rest 1
	drum_note 12, 3
	rest 1
	drum_note 1, 3
	drum_note 1, 3
	drum_note 1, 1
	drum_note 1, 1
	sound_loop 3, .loop5
	sound_loop 0, .mainLoop

.sub1:
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	drum_note 1, 2
	drum_note 12, 2
	drum_note 1, 1
	drum_note 1, 1
	drum_note 12, 2
	sound_ret
