extends Control

onready var label_address = $label_address
onready var save_dialog = $save_dialog
var current_seed

func _ready():
	current_seed = str(globals.dream_rng.seed)
	label_address.text = current_seed

func _pressed_copy():
	OS.set_clipboard(current_seed)

func _pressed_save():
	save_dialog.popup_centered()

func _save_confirmed(save_path):
	var file = File.new()
	file.open(save_path, File.WRITE)
	file.store_string(current_seed)
	file.close()
