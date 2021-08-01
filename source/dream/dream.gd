extends Spatial

onready var audio = $audio

func _ready():
	globals._dream_rng_refresh()
