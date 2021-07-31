extends Node

onready var melody = $melody
onready var bass = $bass
onready var timer =$timer
var tempo = 120.0

var note_scale = []

var melody_note_seq = []
var melody_rhythm_seq = []
var bass_note_seq = []
var bass_rhythm_seq = []

var current_note = 0

func _ready():
	_bgm_start()

func _bgm_start():
	_set_samples()
	_make_scale()
	_sequence()
	tempo = globals.dream_rng.randf_range(100.0, 180.0)
	timer.wait_time = 60.0/tempo
	timer.start()

func _set_samples():
	var sample_id = globals.dream_rng.randi()%globals.samples.size()
	var sample = globals.samples[sample_id]
	melody.stream = sample
	bass.stream = sample

func _make_scale():
	for n in 7:
		note_scale.append(globals.dream_rng.randi()%12)

func _sequence():
	for melody_notes in 16:
		var note_id = globals.dream_rng.randi()%7
		melody_note_seq.append(note_scale[note_id])
	for melody_plays in 16:
		var melody_rhythm_chance = globals.dream_rng.randf()
		melody_rhythm_seq.append(melody_rhythm_chance)
	for bass_notes in 16:
		var note_id = globals.dream_rng.randi()%7
		bass_note_seq.append(note_scale[note_id])
	for bass_plays in 16:
		var bass_rhythm_chance = globals.dream_rng.randf()
		bass_rhythm_seq.append(bass_rhythm_chance)

func _note_to_pitch(note_value):
	return pow(2.0, note_value/12.0)

func _timeout():
	#melody and bass
	melody.pitch_scale = _note_to_pitch(melody_note_seq[current_note])
	if melody_rhythm_seq[current_note] > 0.5:
		melody.play()
	bass.pitch_scale = _note_to_pitch(bass_note_seq[current_note] - 12.0)
	if bass_rhythm_seq[current_note] > 0.5:
		bass.play()
	#loop
	if current_note < 15:
		current_note += 1
	else:
		current_note = 0
