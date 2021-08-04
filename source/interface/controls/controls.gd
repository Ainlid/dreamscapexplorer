extends Control

onready var button = $button
onready var popup = $popup

func _pressed():
	popup.popup_centered()
