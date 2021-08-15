extends Spatial

func _ready():
	var new_wall = globals.walls_picked.instance()
	add_child(new_wall)
	new_wall.rotation.y = globals.dream_rng.randi()%4 * PI/2.0
