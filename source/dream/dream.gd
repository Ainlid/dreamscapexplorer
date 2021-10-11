extends Spatial

var dream_time = 120
onready var timer = $timer

func _ready():
	timer.wait_time = dream_time
	timer.start()

func _timeout():
	fader._next_dream()
