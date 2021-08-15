extends Spatial

func _ready():
	var new_stairs = globals.stairs_picked.instance()
	add_child(new_stairs)
	new_stairs.rotation.y = globals.dream_rng.randi()%4 * PI/2.0
