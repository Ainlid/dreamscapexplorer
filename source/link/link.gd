extends Spatial

func _body_entered(body):
	if body.is_in_group("player"):
		body.playable = false
		globals._dream_rng_refresh()
		fader._reload_scene()
