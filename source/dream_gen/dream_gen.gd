extends Spatial

onready var player = preload("res://player/player.tscn")

onready var grid = $grid
onready var world_env = $world_env
onready var sun = $sun

var grid_size = 8
var cell_distance = 40.0
var floors_array = []

func _ready():
	_generate()

func _generate():
	_spawn_grid()
	_randomize_mats()
	_set_env()
	_set_sun()
	_spawn_player()

func _spawn_grid():
	var vertical_chance = globals.dream_rng.randf()
	var y_levels = 1
	if vertical_chance > 0.5:
		y_levels = globals.dream_rng.randi_range(2, grid_size)
	for n_x in grid_size:
		for n_y in y_levels:
			for n_z in grid_size:
				var spawn_chance = globals.dream_rng.randf()
				if spawn_chance > 0.5:
					var floor_id = globals.dream_rng.randi()%globals.floors.size()
					var new_floor = globals.floors[floor_id].instance()
					grid.add_child(new_floor)
					new_floor.translation.x = n_x * cell_distance
					new_floor.translation.y = n_y * cell_distance / 2.0
					new_floor.translation.z = n_z * cell_distance
					new_floor.rotation.y = globals.dream_rng.randi()%4 * PI/2.0
					floors_array.append(new_floor)

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
		var tex_id = globals.dream_rng.randi()%globals.albedo_textures.size()
		var current_mat = globals.tilemats[n]
		current_mat.albedo_texture = globals.albedo_textures[tex_id]
		current_mat.albedo_color.r = globals.dream_rng.randf()
		current_mat.albedo_color.g = globals.dream_rng.randf()
		current_mat.albedo_color.b = globals.dream_rng.randf()
		current_mat.uv1_scale = Vector3.ONE * globals.dream_rng.randf_range(0.1, 1.0)

func _set_env():
	var env = world_env.environment
	var fog_col = Color.black
	fog_col.r = globals.dream_rng.randf()
	fog_col.g = globals.dream_rng.randf()
	fog_col.b = globals.dream_rng.randf()
	env.background_color = fog_col
	env.fog_color = fog_col
	env.ambient_light_color = fog_col
	env.ambient_light_energy = globals.dream_rng.randf_range(0.2, 0.5)

func _set_sun():
	sun.rotation.x = globals.dream_rng.randf_range(0.0, PI * 2.0)
	sun.rotation.y = globals.dream_rng.randf_range(0.0, PI)
	var sun_col = Color.white
	sun_col.h = globals.dream_rng.randf()
	sun_col.s = globals.dream_rng.randf()
	sun_col.v = globals.dream_rng.randf_range(0.5, 1.0)
	sun.light_color = sun_col
