extends Spatial

func _ready():
	var floor_id = globals.dream_rng.randi()%globals.floors_picked.size()
	var new_floor = globals.floors_picked[floor_id].instance()
	add_child(new_floor)
	new_floor.rotation.y = globals.dream_rng.randi()%4 * PI/2.0
