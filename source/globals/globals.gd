extends Node

const samples = [preload("res://bgm_gen/samples/piano.wav"),
preload("res://bgm_gen/samples/piano_electro.wav"),
preload("res://bgm_gen/samples/honky_tonk.wav"),
preload("res://bgm_gen/samples/piano_electric.wav"),
preload("res://bgm_gen/samples/piano_electric2.wav"),
preload("res://bgm_gen/samples/harpsichord.wav"),
preload("res://bgm_gen/samples/clav.wav"),
preload("res://bgm_gen/samples/celesta.wav"),
preload("res://bgm_gen/samples/glockenspiel.wav"),
preload("res://bgm_gen/samples/music_box.wav"),
preload("res://bgm_gen/samples/vibraphone.wav"),
preload("res://bgm_gen/samples/marimba.wav"),
preload("res://bgm_gen/samples/xylophone.wav"),
preload("res://bgm_gen/samples/tubular_bells.wav"),
preload("res://bgm_gen/samples/dulcimer.wav")]

const layouts = [preload("res://dream_gen/layouts/bridge_stone.tscn")]

const floors = [preload("res://dream_gen/tiles/floors/test_flat.tscn"),
preload("res://dream_gen/tiles/floors/test_stairs.tscn")]

var tilemats = [preload("res://dream_gen/tiles/floors/floormat1.tres"),
preload("res://dream_gen/tiles/floors/floormat2.tres"),
preload("res://dream_gen/materials/tilemat3.tres"),
preload("res://dream_gen/materials/tilemat4.tres")]

const albedo_textures = [preload("res://dream_gen/textures/albedo/water.png"),
preload("res://dream_gen/textures/albedo/sand.png"),
preload("res://dream_gen/textures/albedo/stone.png"),
preload("res://dream_gen/textures/albedo/brick_stone.png"),
preload("res://dream_gen/textures/albedo/wood_planks.png"),
preload("res://dream_gen/textures/albedo/ice.png"),
preload("res://dream_gen/textures/albedo/grass.png")]

var dream_rng

func _ready():
	randomize()
	dream_rng = RandomNumberGenerator.new()
	_dream_rng_refresh()

func _dream_rng_refresh():
	dream_rng.seed = randi()
