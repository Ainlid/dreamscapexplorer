extends Button

onready var popup = $popup
onready var vol_slider = $popup/volume_slider

var vol_value = -2.0

func _ready():
	vol_value = save_manager.save_data["volume"]
	_set_volume()

func _pressed():
	popup.popup_centered()

func _volume_changed(value):
	vol_value = value

func _set_volume():
	AudioServer.set_bus_volume_db(0, vol_value)
	vol_slider.value = vol_value

func _confirmed():
	_set_volume()
	save_manager.settings_data["volume"] = vol_value
	save_manager._save_data()
