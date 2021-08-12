extends Spatial

onready var player = preload("res://player/player.tscn")

onready var grid = $grid
onready var world_env = $world_env
onready var sun = $sun

var grid_size = 8
var cell_distance = 40.0

onready var floor_tile = preload("res://dream_gen/tiles/floors/floor.tscn")

onready var frame_flat = preload("res://dream_gen/tiles/frames/frame_flat.tscn")
onready var frame_stairs = preload("res://dream_gen/tiles/frames/frame_stairs.tscn")

onready var wall_indoor = preload("res://dream_gen/tiles/walls/wall_indoor.tscn")
onready var wall_outdoor = preload("res://dream_gen/tiles/walls/wall_outdoor.tscn")

func _ready():
	_generate()

func _generate():
	_randomize_mats()
	_set_env()
	_set_sun()
	_spawn_grid()

func _spawn_grid():
	var offset_h = -(grid_size - 1.0) / 2.0 * cell_distance
	grid.translation.x = offset_h
	grid.translation.z = offset_h
	var y_levels = 1
	if globals.dream_rng.randf() > 0.5:
		y_levels = globals.dream_rng.randi_range(2, grid_size)
	var frame_type_bias = globals.dream_rng.randf_range(0.1, 0.9)
	var wall_bias = globals.dream_rng.randf_range(0.1, 0.9)
	var wall_type_bias = globals.dream_rng.randf_range(0.1, 0.9)
	var player_spawn_frame = globals.dream_rng.randi()%(grid_size * y_levels * grid_size)
	var frame_number = 0
	for n_x in grid_size:
		for n_y in y_levels:
			for n_z in grid_size:
				var coords = Vector3()
				coords.x = n_x * cell_distance
				coords.y = n_y * cell_distance / 2.0
				coords.z = n_z * cell_distance
				#add a frame
				var new_frame
				if globals.dream_rng.randf() > frame_type_bias and n_y > 0:
					new_frame = frame_stairs.instance()
				else:
					new_frame = frame_flat.instance()
				grid.add_child(new_frame)
				new_frame.translation = coords
				new_frame.rotation.y = globals.dream_rng.randi()%4 * PI/2.0
				if frame_number == player_spawn_frame:
					var new_player = player.instance()
					grid.add_child(new_player)
					var player_offset = Vector3(0.0, 2.0, 19.0)
					new_player.translation = new_frame.translation + player_offset
					new_player.rotation.y = globals.dream_rng.randi()%4 * PI/2.0
					new_player.bound = grid_size / 2.0 * cell_distance + 1.0
					new_player.fall_limit = -2.0
				frame_number += 1
				#add a floor or a wall
				if globals.dream_rng.randf() > wall_bias:
					var new_floor = floor_tile.instance()
					new_frame.add_child(new_floor)
				else:
					var new_wall
					if globals.dream_rng.randf() > wall_type_bias:
						new_wall = wall_indoor.instance()
					else:
						new_wall = wall_outdoor.instance()
					grid.add_child(new_wall)
					new_wall.translation = coords

func _randomize_mats():
	for n in globals.materials.size():
		var current_mat = globals.materials[n]
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
	var amb_col = Color().from_hsv(globals.dream_rng.randf(), globals.dream_rng.randf(), 1.0)
	env.ambient_light_color = amb_col
	env.ambient_light_energy = globals.dream_rng.randf_range(0.2, 0.8)

func _set_sun():
	sun.rotation.x = globals.dream_rng.randf_range(-PI / 2.0, PI / 2.0)
	sun.rotation.y = globals.dream_rng.randf_range(0.0, PI * 2.0)
	var sun_col = Color().from_hsv(globals.dream_rng.randf(), globals.dream_rng.randf(), 1.0)
	sun.light_color = sun_col
