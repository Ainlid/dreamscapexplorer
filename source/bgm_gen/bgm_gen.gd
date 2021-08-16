extends Node

onready var melody = $melody
onready var bass = $bass

onready var timer =$timer
var tempo = 120.0

var note_scale = []
var transposition = 0.0

var melody_note_seq = []
var melody_play_seq = []
var bass_note_seq = []
var bass_play_seq = []

var current_note = 0

func _ready():
	_bgm_start()

func _bgm_start():
	_make_scale()
	_sequence()
	tempo = globals.dream_rng.randf_range(100.0, 180.0)
	timer.wait_time = 60.0/tempo
	timer.start()

func _make_scale():
	if globals.dream_rng.randf() > 0.5:
		#major scale
		note_scale = [0, 2, 4, 5, 7, 9, 11]
	else:
		#minor scale
		note_scale = [0, 2, 3, 5, 7, 8, 10]
	transposition = globals.dream_rng.randi_range(0, 11)

func _sequence():
	for melody_notes in 16:
		var note_id = globals.dream_rng.randi()%7
		melody_note_seq.append(note_scale[note_id])
	for melody_plays in 16:
		melody_play_seq.append(globals.dream_rng.randf() > 0.5)
	for bass_notes in 16:
		var note_id = globals.dream_rng.randi()%7
		bass_note_seq.append(note_scale[note_id])
	for bass_plays in 16:
		if bass_plays%4 == 1:
			bass_play_seq.append(true)
		else:
			bass_play_seq.append(globals.dream_rng.randf() > 0.5 and bass_plays%2 == 1)

func _note_to_pitch(note_value):
	return pow(2.0, note_value/12.0)

func _timeout():
	#melody and bass
	melody.pitch_scale = _note_to_pitch(melody_note_seq[current_note] + transposition)
	if melody_play_seq[current_note]:
		melody.play()
	bass.pitch_scale = _note_to_pitch(bass_note_seq[current_note] + transposition - 12.0)
	if bass_play_seq[current_note]:
		bass.play()
	#loop
	if current_note < 15:
		current_note += 1
	else:
		current_note = 0
