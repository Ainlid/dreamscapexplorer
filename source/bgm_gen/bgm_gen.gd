extends Node

onready var melody = $melody
onready var bass = $bass
onready var kick = $kick
onready var snare = $snare
onready var hihat = $hihat

onready var timer =$timer
var tempo = 120.0

var note_scale = []
var transposition = 0.0

var melody_note_seq = []
var melody_play_seq = []
var bass_note_seq = []
var bass_play_seq = []
var kick_seq = []
var snare_seq = []
var hihat_seq = []

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
	var melody_sample_id = globals.dream_rng.randi()%globals.samples.size()
	var melody_sample = globals.samples[melody_sample_id]
	melody.stream = melody_sample
	var bass_sample_id = globals.dream_rng.randi()%globals.samples.size()
	var bass_sample = globals.samples[bass_sample_id]
	bass.stream = bass_sample

func _make_scale():
	var scale_chance = globals.dream_rng.randf()
	if scale_chance > 0.5:
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
		var melody_play_chance = globals.dream_rng.randf()
		melody_play_seq.append(melody_play_chance > 0.5)
	for bass_notes in 16:
		var note_id = globals.dream_rng.randi()%7
		bass_note_seq.append(note_scale[note_id])
	for bass_plays in 16:
		var bass_play_chance = globals.dream_rng.randf()
		bass_play_seq.append(bass_play_chance > 0.5)
	#drums
	for n_snare in 16:
		if n_snare%2 == 1:
			var snare_chance = globals.dream_rng.randf()
			snare_seq.append(snare_chance > 0.5)
		else:
			snare_seq.append(false)
	for n_hihat in 16:
		var hihat_chance = globals.dream_rng.randf()
		hihat_seq.append(hihat_chance > 0.5)

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
	#drums
	if current_note%4 == 1:
		kick.play()
	if snare_seq[current_note]:
		snare.play()
	if hihat_seq[current_note]:
		hihat.play()
	#loop
	if current_note < 15:
		current_note += 1
	else:
		current_note = 0
