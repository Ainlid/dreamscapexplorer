extends Spatial

onready var grid = $grid
onready var world_env = $world_env
onready var sun = $sun

func _ready():
	_generate()

func _generate():
	_set_env()
	_set_sun()
	_randomize_mats()
	_spawn_layout()

func _spawn_layout():
	var layout_id = globals.dream_rng.randi()%globals.layouts.size()
	var new_layout = globals.layouts[layout_id].instance()
	add_child(new_layout)

func _randomize_mats():
	for n in globals.materials.size():
		var current_mat = globals.materials[n]
		var tex_id = globals.dream_rng.randi()%globals.albedo_textures.size()
		current_mat.albedo_texture = globals.albedo_textures[tex_id]
		var color_id = globals.dream_rng.randi()%globals.colors.size()
		current_mat.albedo_color = globals.colors[color_id]
		current_mat.uv1_scale = Vector3.ONE * globals.dream_rng.randf_range(10.0, 20.0)

func _set_env():
	var env = world_env.environment
	var fog_col_id = globals.dream_rng.randi()%globals.colors.size()
	var fog_color = globals.colors[fog_col_id]
	env.background_color = fog_color
	env.fog_color = fog_color
	var amb_col_id = globals.dream_rng.randi()%globals.colors.size()
	env.ambient_light_color = globals.colors[amb_col_id]

func _set_sun():
	sun.rotation.x = globals.dream_rng.randf_range(-PI / 2.0, PI / 2.0)
	sun.rotation.y = globals.dream_rng.randf_range(0.0, PI * 2.0)
	var color_id = globals.dream_rng.randi()%globals.colors.size()
	sun.light_color = globals.colors[color_id]
