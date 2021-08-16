extends Node

onready var players = [$audio1, $audio2, $audio3, $audio4]

onready var timer =$timer
var tempo = 120.0

var seq1 = []
var seq2 = []
var seq3 = []
var seq4 = []

var current_note = 0

func _ready():
	_bgm_start()
	_set_pitches()

func _bgm_start():
	_set_samples()
	_sequence()
	tempo = globals.dream_rng.randf_range(100.0, 180.0)
	timer.wait_time = 60.0/tempo
	timer.start()

func _set_samples():
	for n in 4:
		var sample_id = globals.dream_rng.randi()%globals.samples.size()
		var sample = globals.samples[sample_id]
		sample = preload("res://bgm_gen/samples/triangle.wav")
		players[n].stream = sample

func _set_pitches():
	var note_scale
	if globals.dream_rng.randf() > 0.5:
		#major scale
		note_scale = [0, 2, 4, 5, 7, 9, 11]
	else:
		#minor scale
		note_scale = [0, 2, 3, 5, 7, 8, 10]
	var transposition = globals.dream_rng.randi_range(0, 11)
	for n in 4:
		var note_id = globals.dream_rng.randi()%note_scale.size()
		players[n].pitch_scale = _note_to_pitch(note_scale[note_id] + transposition)

func _sequence():
	for n_seq1 in 16:
		seq1.append(n_seq1%4 == 1)
	for n_seq2 in 16:
		seq2.append(globals.dream_rng.randf() > 0.5 and n_seq2%2 == 1)
	for n_seq3 in 16:
		var chance = globals.dream_rng.randf()
		seq3.append(chance > 0.5)
	for n_seq4 in 16:
		var chance = globals.dream_rng.randf()
		seq4.append(chance > 0.5)

func _note_to_pitch(note_value):
	return pow(2.0, note_value/12.0)

func _timeout():
	var seqs = [seq1, seq2, seq3, seq4]
	for n in 4:
		if seqs[n][current_note]:
			players[n].play()
	#loop
	if current_note < 15:
		current_note += 1
	else:
		current_note = 0
