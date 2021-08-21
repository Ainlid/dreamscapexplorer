extends Spatial

onready var world_env = $world_env
onready var sun = $sun
onready var grid = $grid

var tiles = []

var grid_size = 8
var tile_distance = 40.0

onready var player = preload("res://player/player.tscn")

func _ready():
	_generate()

func _generate():
	_set_env()
	_set_sun()
	_randomize_mats()
	_pick_tiles()
	_spawn_grid()
	_spawn_player()

func _pick_tiles():
	for n_tiles in 4:
		var tile_id = globals.dream_rng.randi()%globals.tiles.size()
		tiles.append(globals.tiles[tile_id])

func _randomize_mats():
	for n in globals.materials.size():
		var current_mat = globals.materials[n]
		var tex_id = globals.dream_rng.randi()%globals.textures.size()
		current_mat.albedo_texture = globals.textures[tex_id]
		var color_id = globals.dream_rng.randi()%globals.colors.size()
		current_mat.albedo_color = globals.colors[color_id]
		current_mat.uv1_scale = Vector3.ONE * globals.dream_rng.randf_range(20.0, 60.0)

func _set_env():
	var env = world_env.environment
	var fog_col_id = globals.dream_rng.randi()%globals.colors.size()
	var fog_color = globals.colors[fog_col_id]
	env.background_color = fog_color
	env.fog_color = fog_color
	env.ambient_light_color = fog_color

func _set_sun():
	sun.rotation.x = globals.dream_rng.randf_range(-PI / 2.0, PI / 2.0)
	sun.rotation.y = globals.dream_rng.randf_range(0.0, PI * 2.0)
	var color_id = globals.dream_rng.randi()%globals.colors.size()
	sun.light_color = globals.colors[color_id]

func _spawn_grid():
	grid_size = globals.dream_rng.randi_range(1, 4) * 2
	var offset = -(grid_size - 1.0) / 2.0 * tile_distance
	grid.translation.x = offset
	grid.translation.z = offset
	for n_x in grid_size:
		for n_z in grid_size:
			var coords = Vector3.ZERO
			coords.x = n_x * tile_distance
			coords.z = n_z * tile_distance
			var tile_id = globals.dream_rng.randi()%tiles.size()
			var new_tile = tiles[tile_id].instance()
			grid.add_child(new_tile)
			new_tile.translation = coords
			new_tile.rotation.y = globals.dream_rng.randi()%4 * PI/2.0

func _spawn_player():
	var coords = Vector3.ZERO
	coords.x = globals.dream_rng.randi()%grid_size * tile_distance
	coords.z = globals.dream_rng.randi()%grid_size * tile_distance
	coords.y = 1.0
	var new_player = player.instance()
	grid.add_child(new_player)
	new_player.translation = coords
	new_player.rotation.y = globals.dream_rng.randi()%4 * PI/2.0
	new_player.bounds_size = grid_size / 2.0 * tile_distance
