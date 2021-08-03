extends Spatial

onready var world_env = $world_env
onready var sun = $sun

func _ready():
	_generate()

func _generate():
	_spawn_layout()
	_set_env()
	_set_sun()

func _spawn_layout():
	var layout_id = globals.dream_rng.randi()%globals.layouts.size()
	var new_layout = globals.layouts[layout_id].instance()
	add_child(new_layout)

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
	sun.rotation.x = globals.dream_rng.randf_range(-PI/8.0, -PI/2.0)
	sun.rotation.y = globals.dream_rng.randf_range(0.0, PI)
	var sun_col = Color.white
	sun_col.h = globals.dream_rng.randf()
	sun_col.s = globals.dream_rng.randf()
	sun_col.v = globals.dream_rng.randf_range(0.5, 1.0)
	sun.light_color = sun_col
