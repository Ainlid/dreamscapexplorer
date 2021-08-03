extends Spatial

var mesh

func _ready():
	mesh = get_node(name)
	if mesh:
		_set_materials()

func _set_materials():
	for n_mat in mesh.get_surface_material_count():
		var new_mat = SpatialMaterial.new()
		var albedo_id = globals.dream_rng.randi()%globals.albedo_textures.size()
		new_mat.albedo_texture = globals.albedo_textures[albedo_id]
		new_mat.uv1_scale = Vector3.ONE * globals.dream_rng.randf_range(10.0, 50.0)
		mesh.set_surface_material(n_mat, new_mat)
