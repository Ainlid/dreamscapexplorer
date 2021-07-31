extends Node

const samples = [preload("res://bgm_gen/juno106/synth1.wav"),
preload("res://bgm_gen/juno106/synth2.wav"),
preload("res://bgm_gen/juno106/synth3.wav"),
preload("res://bgm_gen/juno106/synth4.wav"),
preload("res://bgm_gen/juno106/synth5.wav"),
preload("res://bgm_gen/juno106/synth6.wav")]

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
