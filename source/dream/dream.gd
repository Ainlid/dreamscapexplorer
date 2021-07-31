extends Spatial

onready var audio = $audio

func _ready():
	_load_layout()

func _load_layout():
	var layout_id = globals.dream_rng.randi()%globals.layouts.size()
	var new_layout = globals.layouts[layout_id].instance()
	add_child(new_layout)
