extends Spatial

func _ready():
	_generate()

func _generate():
	_spawn_layout()

func _spawn_layout():
	var layout_id = globals.dream_rng.randi()%globals.layouts.size()
	var new_layout = globals.layouts[layout_id].instance()
	add_child(new_layout)
