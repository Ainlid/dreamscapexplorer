extends Spatial

export(NodePath) var mesh_inst
var mesh

func _ready():
	if mesh_inst:
		mesh = get_node(mesh_inst).mesh
		_set_materials()

func _set_materials():
	for n in mesh.get_surface_count():
		var mat_id = globals.dream_rng.randi()%globals.materials.size()
		mesh.surface_set_material(n, globals.materials[n])

