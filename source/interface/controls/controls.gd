extends Control

onready var button = $button
onready var label = $label

func _ready():
	_controls_hide()

func _button_toggled(button_state):
	if button_state:
		_controls_show()
	else:
		_controls_hide()

func _controls_show():
	label.show()
	button.text = "hide controls"

func _controls_hide():
	label.hide()
	button.text = "show controls"
