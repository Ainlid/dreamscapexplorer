extends Spatial

onready var audio = $audio

func _ready():
	_load_layout()
	_play_bgm()

func _load_layout():
	var layout_id = globals.dream_rng.randi()%globals.layouts.size()
	var new_layout = globals.layouts[layout_id].instance()
	add_child(new_layout)

func _play_bgm():
	var chord_chance = globals.dream_rng.randf()
	if chord_chance < 0.5:
		audio.stream = globals.major_chord
	else:
		audio.stream = globals.minor_chord
	var rand_note = globals.dream_rng.randi()%13
	audio.pitch_scale = pow(2.0, rand_note/12.0)
	audio.play()
