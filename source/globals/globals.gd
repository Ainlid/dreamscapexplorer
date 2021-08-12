extends Node

const layouts = []

const samples = [preload("res://bgm_gen/samples/piano.wav"),
preload("res://bgm_gen/samples/piano_electro.wav"),
preload("res://bgm_gen/samples/honky_tonk.wav"),
preload("res://bgm_gen/samples/piano_electric.wav"),
preload("res://bgm_gen/samples/piano_electric2.wav"),
preload("res://bgm_gen/samples/celesta.wav"),
preload("res://bgm_gen/samples/glockenspiel.wav"),
preload("res://bgm_gen/samples/music_box.wav"),
preload("res://bgm_gen/samples/vibraphone.wav"),
preload("res://bgm_gen/samples/marimba.wav"),
preload("res://bgm_gen/samples/xylophone.wav"),
preload("res://bgm_gen/samples/dulcimer.wav"),
preload("res://bgm_gen/samples/drawbar_organ.wav"),
preload("res://bgm_gen/samples/percussive_organ.wav"),
preload("res://bgm_gen/samples/rock_organ.wav"),
preload("res://bgm_gen/samples/nylon_guitar.wav"),
preload("res://bgm_gen/samples/steel_guitar.wav"),
preload("res://bgm_gen/samples/clean_guitar.wav"),
preload("res://bgm_gen/samples/muted_guitar.wav"),
preload("res://bgm_gen/samples/guitar_harmonics.wav"),
preload("res://bgm_gen/samples/acoustic_bass.wav"),
preload("res://bgm_gen/samples/finger_bass.wav"),
preload("res://bgm_gen/samples/picked_bass.wav"),
preload("res://bgm_gen/samples/slap_bass.wav"),
preload("res://bgm_gen/samples/synth_bass.wav"),
preload("res://bgm_gen/samples/pizzicato_strings.wav"),
preload("res://bgm_gen/samples/harp.wav"),
preload("res://bgm_gen/samples/choir_oohs.wav"),
preload("res://bgm_gen/samples/oboe.wav"),
preload("res://bgm_gen/samples/clarinet.wav"),
preload("res://bgm_gen/samples/flute.wav"),
preload("res://bgm_gen/samples/recorder.wav"),
preload("res://bgm_gen/samples/pan_flute.wav"),
preload("res://bgm_gen/samples/new_age.wav"),
preload("res://bgm_gen/samples/sweep_pad.wav"),
preload("res://bgm_gen/samples/koto.wav"),
preload("res://bgm_gen/samples/kalimba.wav")]

const textures = [preload("res://dream/textures/albedo/water.png"),
preload("res://dream/textures/albedo/stone.png"),
preload("res://dream/textures/albedo/ice.png"),
preload("res://dream/textures/albedo/brick.png"),
preload("res://dream/textures/albedo/planks.png"),
preload("res://dream/textures/albedo/marble.png"),
preload("res://dream/textures/albedo/metal.png"),
preload("res://dream/textures/albedo/bark.png"),
preload("res://dream/textures/albedo/grass.png"),
preload("res://dream/textures/albedo/toy_bricks.png"),
preload("res://dream/textures/albedo/textbook.png"),
preload("res://dream/textures/albedo/fabric.png"),
preload("res://dream/textures/albedo/quartz.png"),
preload("res://dream/textures/albedo/glass.png"),
preload("res://dream/textures/albedo/sponge.png"),
preload("res://dream/textures/albedo/paint.png"),
preload("res://dream/textures/albedo/rug.png"),
preload("res://dream/textures/albedo/snow.png"),
preload("res://dream/textures/albedo/leaf.png"),
preload("res://dream/textures/albedo/leaves.png"),
preload("res://dream/textures/albedo/foam.png"),
preload("res://dream/textures/albedo/meat.png"),
preload("res://dream/textures/albedo/chess.png"),
preload("res://dream/textures/albedo/wall.png"),
preload("res://dream/textures/albedo/ceramic_tiles.png"),
preload("res://dream/textures/albedo/glass_blocks.png"),
preload("res://dream/textures/albedo/pipes.png"),
preload("res://dream/textures/albedo/soap_film.png"),
preload("res://dream/textures/albedo/cogs.png")]

var dream_rng

func _ready():
	randomize()
	dream_rng = RandomNumberGenerator.new()
	_dream_rng_refresh()

func _dream_rng_refresh():
	dream_rng.seed = randi()
