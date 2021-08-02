extends Spatial

var mesh

func _ready():
	mesh = get_node(name)

func _set_materials():
	for n_mat in mesh.get_surface_material_count():
		var new_mat = SpatialMaterial.new()
		new_mat.albedo_color.h = globals.dream_rng.randf()
		new_mat.albedo_color.s = globals.dream_rng.randf_range(0.2, 0.8)
		new_mat.albedo_color.h = globals.dream_rng.randf()
		new_mat.uv1_scale = Vector3.ONE * globals.dream_rng.randf_range(10.0, 100.0)
		mesh.set_surface_material(n_mat, new_mat)
