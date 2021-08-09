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

onready var wall_indoor = preload("res://dream_gen/tiles/walls/test_wall_indoor.tscn")
onready var wall_outdoor = preload("res://dream_gen/tiles/walls/test_wall_outdoor.tscn")

func _ready():
	_generate()

func _generate():
	_spawn_grid()
	_randomize_mats()
	_set_env()
	_set_sun()
	_spawn_player()

func _spawn_grid():
	var offset_h = -(grid_size - 1.0) / 2.0 * cell_distance
	grid.translation.x = offset_h
	grid.translation.z = offset_h
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
					var new_wall
					if has_walls:
						new_wall = wall_indoor.instance()
					else:
						new_wall = wall_outdoor.instance()
					grid.add_child(new_wall)
					new_wall.translation = coords

func _spawn_player():
	var spawn_floor_id = globals.dream_rng.randi()%floors_array.size()
	var spawn_floor = floors_array[spawn_floor_id]
	var new_player = player.instance()
	grid.add_child(new_player)
	new_player.translation = spawn_floor.translation + Vector3.UP * 2.0
	new_player.bound = grid_size / 2.0 * cell_distance

func _randomize_mats():
	for n in globals.tilemats.size():
		var current_mat = globals.tilemats[n]
		var tex_id = globals.dream_rng.randi()%globals.albedo_textures.size()
		current_mat.albedo_texture = globals.albedo_textures[tex_id]
		var albedo_col = Color().from_hsv(globals.dream_rng.randf(), globals.dream_rng.randf(), globals.dream_rng.randf_range(0.2, 1.0))
		current_mat.albedo_color = albedo_col
		current_mat.uv1_scale = Vector3.ONE * globals.dream_rng.randf_range(10.0, 20.0)

func _set_env():
	var env = world_env.environment
	var fog_col = Color().from_hsv(globals.dream_rng.randf(), globals.dream_rng.randf(), globals.dream_rng.randf_range(0.2, 0.8))
	env.background_color = fog_col
	env.fog_color = fog_col
	env.ambient_light_color = fog_col
	env.ambient_light_energy = globals.dream_rng.randf_range(0.5, 1.0)

func _set_sun():
	sun.rotation.x = globals.dream_rng.randf_range(-PI / 2.0, PI / 2.0)
	sun.rotation.y = globals.dream_rng.randf_range(0.0, PI * 2.0)
