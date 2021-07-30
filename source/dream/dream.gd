extends Spatial

onready var audio = $audio

func _ready():
	_load_layout()
	_load_bgm()

func _load_layout():
	var layout_id = globals.dream_rng.randi()%globals.layouts.size()
	var new_layout = globals.layouts[layout_id].instance()
	add_child(new_layout)

func _load_bgm():
	var bgm_id = globals.dream_rng.randi()%globals.bgm.size()
	audio.stream = globals.bgm[bgm_id]
	audio.pitch_scale = globals.dream_rng.randf_range(0.8, 1.2)
	audio.play()
