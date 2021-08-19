extends Node

const layouts = [preload("res://dream_gen/layouts/test.tscn")]

const floors = [preload("res://dream_gen/tiles/floors/floor_flat.tscn")]
var floors_picked = []

const stairs = [preload("res://dream_gen/tiles/stairs/stairs_center.tscn"),
preload("res://dream_gen/tiles/stairs/stairs_side.tscn"),
preload("res://dream_gen/tiles/stairs/stairs_triangle.tscn"),
preload("res://dream_gen/tiles/stairs/stairs_platforms.tscn")]
var stairs_picked

const walls = [preload("res://dream_gen/tiles/walls/wall_full.tscn"),
preload("res://dream_gen/tiles/walls/wall_half.tscn")]
var walls_picked

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
	_pick_tiles()
	_pick_props()

func _pick_tiles():
	for n_floor in 4:
		var floor_id = dream_rng.randi()%floors.size()
		floors_picked.append(floors[floor_id])
	var stairs_id = dream_rng.randi()%stairs.size()
	stairs_picked = stairs[stairs_id]
	var walls_id = dream_rng.randi()%walls.size()
	walls_picked = walls[walls_id]

func _pick_props():
	prop_set = []
	for n_common in 4:
		var prop_id = dream_rng.randi()%props.size()
		prop_set.append(props[prop_id])
