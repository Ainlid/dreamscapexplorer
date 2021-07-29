extends Spatial

export(NodePath) var mesh_inst
var mesh

func _ready():
	if mesh_inst:
		mesh = get_node(mesh_inst).mesh
		_set_materials()

func _set_materials():
	for n in mesh.get_surface_count():
		var new_mat = SpatialMaterial.new()
		var new_tex_id = globals.dream_rng.randi()%globals.textures.size()
		new_mat.albedo_texture = globals.textures[new_tex_id]
		mesh.surface_set_material(n, new_mat)

