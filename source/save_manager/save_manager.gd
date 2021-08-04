extends Node

const save_path = "user://dreamscape_explorer_save.dat"

var save_data = {
	"volume" : -2.0
}

func _ready():
	_load_data()

func _save_data():
	var file = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_var(save_data)
		file.close()

func _load_data():
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path, File.READ)
		if error == OK:
			save_data = file.get_var()
			file.close()
