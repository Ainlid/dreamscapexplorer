extends Spatial

func _ready():
	var new_layout_id = globals.dream_rng.randi()%globals.layouts.size()
	var new_layout = globals.layouts[new_layout_id].instance()
	add_child(new_layout)
