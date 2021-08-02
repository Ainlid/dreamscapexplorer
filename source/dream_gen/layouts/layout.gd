extends Spatial

var mesh

func _ready():
	mesh = get_node(name)
	if mesh:
		_set_materials()

func _set_materials():
	for n_mat in mesh.get_surface_material_count():
		var new_mat = SpatialMaterial.new()
		new_mat.albedo_color.r = globals.dream_rng.randf()
		new_mat.albedo_color.g = globals.dream_rng.randf()
		new_mat.albedo_color.b = globals.dream_rng.randf()
		new_mat.uv1_scale = Vector3.ONE * globals.dream_rng.randf_range(10.0, 50.0)
		var normal_id = globals.dream_rng.randi()%globals.normalmaps.size()
		new_mat.normal_enabled = true
		new_mat.normal_texture = globals.normalmaps[normal_id]
		var metallic_chance = globals.dream_rng.randf()
		if metallic_chance > 0.5:
			new_mat.metallic = globals.dream_rng.randf_range(0.5, 1.0)
		var rough_chance = globals.dream_rng.randf()
		if rough_chance > 0.5:
			new_mat.roughness = globals.dream_rng.randf_range(0.2, 0.5)
		mesh.set_surface_material(n_mat, new_mat)
