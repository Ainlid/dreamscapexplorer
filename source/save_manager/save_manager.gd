extends Node

const settings_save_path = "user://dse_settings.dat"

var settings_data = {
	"volume" : -2.0
}

func _ready():
	_load_data()

func _save_data():
	var file = File.new()
	var settings_error = file.open(settings_save_path, File.WRITE)
	if settings_error == OK:
		file.store_var(settings_data)
		file.close()

func _load_data():
	var file = File.new()
	if file.file_exists(settings_save_path):
		var settings_error = file.open(settings_save_path, File.READ)
		if settings_error == OK:
			settings_data = file.get_var()
			file.close()
