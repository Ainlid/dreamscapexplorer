extends Node

const samples = [preload("res://bgm_gen/samples/cello.wav"),
preload("res://bgm_gen/samples/flute.wav"),
preload("res://bgm_gen/samples/french_horn.wav"),
preload("res://bgm_gen/samples/guitar_acoustic.wav"),
preload("res://bgm_gen/samples/guitar_bass.wav"),
preload("res://bgm_gen/samples/guitar_distortion.wav"),
preload("res://bgm_gen/samples/guitar_electric.wav"),
preload("res://bgm_gen/samples/guitar_jazz.wav"),
preload("res://bgm_gen/samples/guitar_muted.wav"),
preload("res://bgm_gen/samples/harpsichord.wav"),
preload("res://bgm_gen/samples/harp_concert.wav"),
preload("res://bgm_gen/samples/koto.wav"),
preload("res://bgm_gen/samples/music_box.wav"),
preload("res://bgm_gen/samples/piano_electric.wav"),
preload("res://bgm_gen/samples/piano_grand.wav"),
preload("res://bgm_gen/samples/piano_ragtime.wav"),
preload("res://bgm_gen/samples/pizzicato.wav"),
preload("res://bgm_gen/samples/scifi.wav"),
preload("res://bgm_gen/samples/sitar.wav"),
preload("res://bgm_gen/samples/slap_bass.wav"),
preload("res://bgm_gen/samples/synth_pluck.wav"),
preload("res://bgm_gen/samples/synth_smooth.wav"),
preload("res://bgm_gen/samples/trombone.wav")
]

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
