extends Spatial

var dream_time = 120
onready var timer = $timer

onready var world_env = $world_env
onready var sun = $sun
onready var player = preload("res://player/player.tscn")

func _ready():
	_set_env()
	_set_sun()
	_spawn_layout()
	_spawn_player()
	timer.wait_time = dream_time
	timer.start()

func _timeout():
	globals._dream_rng_refresh()
	fader._reload_scene()

func _set_env():
	var env = world_env.environment
	var fog_col = Color().from_hsv(globals.dream_rng.randf(), globals.dream_rng.randf(), globals.dream_rng.randf_range(0.2, 0.8))
	env.background_color = fog_col
	env.fog_color = fog_col
	var amb_col = Color().from_hsv(globals.dream_rng.randf(), globals.dream_rng.randf(), 1.0)
	env.ambient_light_color = amb_col
	env.ambient_light_energy = 0.75

func _set_sun():
	sun.rotation.x = globals.dream_rng.randf_range(-PI / 2.0, PI / 2.0)
	sun.rotation.y = globals.dream_rng.randf_range(0.0, PI * 2.0)
	var sun_col = Color().from_hsv(globals.dream_rng.randf(), globals.dream_rng.randf(), 1.0)
	sun.light_color = sun_col

func _spawn_layout():
	var layout_id = globals.dream_rng.randi()%globals.layouts.size()
	var new_layout = globals.layouts[layout_id].instance()
	add_child(new_layout)
	var layout_mesh = new_layout.get_node(new_layout.name)
	for n_mat in layout_mesh.get_surface_material_count():
		var new_mat = SpatialMaterial.new()
		var tex_id = globals.dream_rng.randi()%globals.textures.size()
		new_mat.albedo_texture = globals.textures[tex_id]
		var albedo_col = Color().from_hsv(globals.dream_rng.randf(), globals.dream_rng.randf(), globals.dream_rng.randf_range(0.2, 1.0))
		new_mat.albedo_color = albedo_col
		new_mat.uv1_scale = Vector3.ONE * globals.dream_rng.randf_range(50.0, 100.0)
		layout_mesh.set_surface_material(n_mat, new_mat)

func _spawn_player():
	var new_player = player.instance()
	add_child(new_player)
