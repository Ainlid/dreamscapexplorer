extends Spatial

onready var layout_mats = [preload("res://dream_gen/layouts/layout_mat1.tres")]

func _ready():
	_generate()

func _generate():
	_randomize_materials()
	_spawn_layout()

func _randomize_materials():
	for n_mat in layout_mats.size():
		var floor_tex_id = globals.dream_rng.randi()%globals.textures.size()
		var curr_mat = layout_mats[n_mat]
		curr_mat.albedo_texture = globals.textures[floor_tex_id]
		curr_mat.metallic = globals.dream_rng.randf()
		curr_mat.roughness = globals.dream_rng.randf()

func _spawn_layout():
	var layout_id = globals.dream_rng.randi()%globals.layouts.size()
	var new_layout = globals.layouts[layout_id].instance()
	add_child(new_layout)
