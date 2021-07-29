extends Node

func _unhandled_input(event):
	if event.is_action_pressed("screenshot"):
		var image = get_viewport().get_texture().get_data()
		image.flip_y()
		var date = OS.get_datetime()
		var url = OS.get_executable_path().get_base_dir() + "/ittenn_"
		url += str(date.day) + "_"
		url += str(date.month) + "_"
		url += str(date.year) + "_at_"
		url += str(date.hour) + "_"
		url += str(date.minute) + "_"
		url += str(date.second) + ".png"
		image.save_png(url)
