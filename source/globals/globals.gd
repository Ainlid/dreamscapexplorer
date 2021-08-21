extends Node

var tiles = [preload("res://dream_gen/tiles/empty.tscn"),
preload("res://dream_gen/tiles/trees.tscn")]

var props = [preload("res://gizmo_cube/gizmo_cube.tscn")]
var prop_set = []

const colors = [Color("#1a1c2c"),
Color("#5d275d"),
Color("#b13e53"),
Color("#ef7d57"),
Color("#ffcd75"),
Color("#a7f070"),
Color("#38b764"),
Color("#257179"),
Color("#29366f"),
Color("#3b5dc9"),
Color("#41a6f6"),
Color("#73eff7"),
Color("#f4f4f4"),
Color("#94b0c2"),
Color("#566c86"),
Color("#333c57")]

var materials = [preload("res://dream_gen/materials/tilemat1.tres"),
preload("res://dream_gen/materials/tilemat2.tres"),
preload("res://dream_gen/materials/tilemat3.tres")]

const textures = [preload("res://dream_gen/textures/pythogorean.png"),
preload("res://dream_gen/textures/text.png"),
preload("res://dream_gen/textures/voronoi.png"),
preload("res://dream_gen/textures/caustics.png"),
preload("res://dream_gen/textures/grid.png"),
preload("res://dream_gen/textures/checker.png"),
preload("res://dream_gen/textures/brick.png"),
preload("res://dream_gen/textures/hexagon.png")]

var dream_rng

func _ready():
	randomize()
	dream_rng = RandomNumberGenerator.new()
	_dream_rng_refresh()

func _dream_rng_refresh():
	dream_rng.seed = randi()
	_pick_props()

func _pick_props():
	prop_set = []
	for n_common in 4:
		var prop_id = dream_rng.randi()%props.size()
		prop_set.append(props[prop_id])
