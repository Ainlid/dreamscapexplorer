extends Spatial

func _ready():
	if globals.dream_rng.randf() > 0.5:
		var prop_id = 0
		if globals.dream_rng.randf() > 0.5:
			prop_id = 1
			if globals.dream_rng.randf() > 0.5:
				prop_id = 2
				if globals.dream_rng.randf() > 0.5:
					prop_id = 3
		var new_prop = globals.prop_set[prop_id].instance()
		add_child(new_prop)
		new_prop.rotation.y = globals.dream_rng.randi()%4 * PI/2.0
	else:
		queue_free()
