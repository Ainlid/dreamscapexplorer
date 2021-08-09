extends Spatial

onready var player = preload("res://player/player.tscn")

onready var grid = $grid
onready var world_env = $world_env
onready var sun = $sun

var grid_size = 8
var cell_distance = 40.0
var floors_array = []

onready var floor_flat = preload("res://dream_gen/tiles/floors/test_flat.tscn")
onready var floor_stairs = preload("res://dream_gen/tiles/floors/test_stairs.tscn")

onready var wall = preload("res://dream_gen/tiles/walls/test_wall.tscn")

func _ready():
	_generate()

func _generate():
	_spawn_grid()
	_randomize_mats()
	_set_env()
	_set_sun()
	_spawn_player()

func _spawn_grid():
	var y_levels = 1
	if globals.dream_rng.randf() > 0.5:
		y_levels = globals.dream_rng.randi_range(2, grid_size)
	var has_walls = globals.dream_rng.randf() > 0.5
	for n_x in grid_size:
		for n_y in y_levels:
			for n_z in grid_size:
				var coords = Vector3()
				coords.x = n_x * cell_distance
				coords.y = n_y * cell_distance / 2.0
				coords.z = n_z * cell_distance
				var spawn_chance = globals.dream_rng.randf() > 0.5
				if spawn_chance:
					var new_floor
					if globals.dream_rng.randf() > 0.5 and n_y > 0:
						new_floor = floor_stairs.instance()
					else:
						new_floor = floor_flat.instance()
					grid.add_child(new_floor)
					new_floor.translation = coords
					new_floor.rotation.y = globals.dream_rng.randi()%4 * PI/2.0
					floors_array.append(new_floor)
				else:
					if has_walls:
						var new_wall = wall.instance()
						add_child(new_wall)
						new_wall.translation = coords

func _spawn_player():
	var spawn_floor_id = globals.dream_rng.randi()%floors_array.size()
	var spawn_floor = floors_array[spawn_floor_id]
	var new_player = player.instance()
	add_child(new_player)
	new_player.translation.x = spawn_floor.translation.x
	new_player.translation.y = spawn_floor.translation.y + 2.0
	new_player.translation.z = spawn_floor.translation.z

func _randomize_mats():
	for n in globals.tilemats.size():
		var current_mat = globals.tilemats[n]
		var tex_id = globals.dream_rng.randi()%globals.albedo_textures.size()
		current_mat.albedo_texture = globals.albedo_textures[tex_id]
		var albedo_col = Color.white
		albedo_col.h = globals.dream_rng.randf()
		albedo_col.s = globals.dream_rng.randf()
		albedo_col.v = globals.dream_rng.randf_range(0.2, 1.0)
		current_mat.albedo_color = albedo_col
		current_mat.uv1_scale = Vector3.ONE * globals.dream_rng.randf_range(10.0, 20.0)

func _set_env():
	var env = world_env.environment
	var fog_col = Color.black
	fog_col.h = globals.dream_rng.randf()
	fog_col.s = globals.dream_rng.randf()
	fog_col.v = globals.dream_rng.randf_range(0.2, 0.8)
	env.background_color = fog_col
	env.fog_color = fog_col
	env.ambient_light_color = fog_col
	env.ambient_light_energy = globals.dream_rng.randf_range(0.5, 1.0)

func _set_sun():
	sun.rotation.x = globals.dream_rng.randf_range(-PI / 2.0, PI / 2.0)
	sun.rotation.y = globals.dream_rng.randf_range(0.0, PI * 2.0)
