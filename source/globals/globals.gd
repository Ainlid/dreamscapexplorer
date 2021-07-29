extends Node

const textures = [preload("res://images/textures/test1.png"),
preload("res://images/textures/test2.png"),
preload("res://images/textures/test3.png"),
preload("res://images/textures/test4.png")]

const layouts = [preload("res://layouts/test.tscn")]

var dream_rng

func _ready():
	randomize()
	dream_rng = RandomNumberGenerator.new()
	_dream_rng_refresh()

func _dream_rng_refresh():
	dream_rng.seed = randi()
