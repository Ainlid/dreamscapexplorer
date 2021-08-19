extends Spatial

func _ready():
	if globals.dream_rng.randf() > 0.5:
		var prop_id = 0
		for n in globals.prop_set.size():
			#chance decreasing with each iteration
			var chance = 1.0 / (n + 0.1)
			if globals.dream_rng.randf() < chance:
				prop_id = n
		var new_prop = globals.prop_set[prop_id].instance()
		add_child(new_prop)
		new_prop.rotation.y = globals.dream_rng.randi()%4 * PI/2.0
	else:
		queue_free()
