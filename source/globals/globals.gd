extends Node

const bgm = [preload("res://bgm/bgm1.wav"),
preload("res://bgm/bgm2.wav"),
preload("res://bgm/bgm3.wav")]

const materials = [preload("res://materials/test1.tres"),
preload("res://materials/test2.tres"),
preload("res://materials/test3.tres"),
preload("res://materials/test4.tres")]

const layouts = [preload("res://layouts/test.tscn")]

var dream_rng

func _ready():
	randomize()
	dream_rng = RandomNumberGenerator.new()
	_dream_rng_refresh()

func _dream_rng_refresh():
	dream_rng.seed = randi()
