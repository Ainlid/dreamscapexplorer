extends Spatial

func _ready():
	if globals.dream_rng.randf() > 0.5:
		var new_prop
		if globals.dream_rng.randf() > 0.8:
			var prop_id = globals.dream_rng.randi()%globals.props_rare.size()
			new_prop = globals.props_rare[prop_id].instance()
		else:
			var prop_id = globals.dream_rng.randi()%globals.props_common.size()
			new_prop = globals.props_common[prop_id].instance()
		add_child(new_prop)
		new_prop.rotation.y = globals.dream_rng.randi()%4 * PI/2.0
	else:
		queue_free()
