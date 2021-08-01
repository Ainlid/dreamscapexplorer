extends Spatial

onready var audio = $audio
onready var player = preload("res://player/player.tscn")

func _ready():
	globals._dream_rng_refresh()
	#_load_layout()
	_spawn_player()

func _spawn_player():
	var new_player = player.instance()
	add_child(new_player)

func _load_layout():
	var layout_id = globals.dream_rng.randi()%globals.layouts.size()
	var new_layout = globals.layouts[layout_id].instance()
	add_child(new_layout)
