extends Node

const samples = [preload("res://bgm_gen/samples/piano1.wav"),
preload("res://bgm_gen/samples/honky_tonk.wav"),
preload("res://bgm_gen/samples/e_piano1.wav"),
preload("res://bgm_gen/samples/harpsichord.wav"),
preload("res://bgm_gen/samples/clav.wav"),
preload("res://bgm_gen/samples/celesta.wav"),
preload("res://bgm_gen/samples/glockenspiel.wav"),
preload("res://bgm_gen/samples/music_box.wav")]

const layouts = [preload("res://dream_gen/layouts/bridge_stone.tscn")]

const albedo_textures = [preload("res://dream_gen/textures/albedo/water.png"),
preload("res://dream_gen/textures/albedo/sand.png"),
preload("res://dream_gen/textures/albedo/stone.png"),
preload("res://dream_gen/textures/albedo/brick_stone.png")]

var dream_rng

func _ready():
	randomize()
	dream_rng = RandomNumberGenerator.new()
	_dream_rng_refresh()

func _dream_rng_refresh():
	dream_rng.seed = randi()
