extends Node

const samples = [preload("res://bgm_gen/samples/piano1.wav"),
preload("res://bgm_gen/samples/honky_tonk.wav"),
preload("res://bgm_gen/samples/e_piano1.wav"),
preload("res://bgm_gen/samples/harpsichord.wav"),
preload("res://bgm_gen/samples/clav.wav"),
preload("res://bgm_gen/samples/celesta.wav"),
preload("res://bgm_gen/samples/glockenspiel.wav"),
preload("res://bgm_gen/samples/music_box.wav"),
preload("res://bgm_gen/samples/vibraphone.wav"),
preload("res://bgm_gen/samples/marimba.wav"),
preload("res://bgm_gen/samples/xylophone.wav"),
preload("res://bgm_gen/samples/tubular_bell.wav"),
preload("res://bgm_gen/samples/santur.wav"),
preload("res://bgm_gen/samples/organ1.wav"),
preload("res://bgm_gen/samples/church_organ1.wav"),
preload("res://bgm_gen/samples/reed_organ.wav"),
preload("res://bgm_gen/samples/accordion_fr.wav"),
preload("res://bgm_gen/samples/harmonica.wav"),
preload("res://bgm_gen/samples/bandoneon.wav"),
preload("res://bgm_gen/samples/nylon_str_gt.wav"),
preload("res://bgm_gen/samples/steel_str_gt.wav"),
preload("res://bgm_gen/samples/jazz_gt.wav"),
preload("res://bgm_gen/samples/clean_gt.wav"),
preload("res://bgm_gen/samples/muted_gt.wav"),
preload("res://bgm_gen/samples/overdrive_gt.wav"),
preload("res://bgm_gen/samples/distortion_gt.wav"),
preload("res://bgm_gen/samples/gt_harmonics.wav"),
preload("res://bgm_gen/samples/acoustic_bs.wav"),
preload("res://bgm_gen/samples/fingered_bs.wav"),
preload("res://bgm_gen/samples/fretless_bs.wav"),
preload("res://bgm_gen/samples/slap_bs1.wav"),
preload("res://bgm_gen/samples/synth_bs1.wav")]

const layouts = [preload("res://dream_gen/layouts/bridge_stone.tscn")]

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
