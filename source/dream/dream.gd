extends Spatial

var dream_time = 120
onready var timer = $timer

func _ready():
	timer.wait_time = dream_time
	timer.start()

func _timeout():
	globals._dream_rng_refresh()
	fader._reload_scene()
