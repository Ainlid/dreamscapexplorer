extends Node

const synths = [preload("res://bgm_gen/synths/synth1.wav"),
preload("res://bgm_gen/synths/synth1.wav"),
preload("res://bgm_gen/synths/synth2.wav"),
preload("res://bgm_gen/synths/synth3.wav"),
preload("res://bgm_gen/synths/synth4.wav"),
preload("res://bgm_gen/synths/synth5.wav"),
preload("res://bgm_gen/synths/synth6.wav"),
preload("res://bgm_gen/synths/synth7.wav"),
preload("res://bgm_gen/synths/synth8.wav"),
preload("res://bgm_gen/synths/synth9.wav"),
preload("res://bgm_gen/synths/synth10.wav"),
preload("res://bgm_gen/synths/synth11.wav"),
preload("res://bgm_gen/synths/synth12.wav"),
preload("res://bgm_gen/synths/synth13.wav"),
preload("res://bgm_gen/synths/synth14.wav"),
preload("res://bgm_gen/synths/synth15.wav"),
preload("res://bgm_gen/synths/synth16.wav"),
preload("res://bgm_gen/synths/synth17.wav"),
preload("res://bgm_gen/synths/synth18.wav"),
preload("res://bgm_gen/synths/synth19.wav"),
preload("res://bgm_gen/synths/synth20.wav")]

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
