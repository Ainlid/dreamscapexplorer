extends Spatial

func _body_entered(body):
	if body.is_in_group("player"):
		body.playable = false
		fader._next_dream()
