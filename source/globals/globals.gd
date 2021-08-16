extends Node

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

const layouts = [preload("res://dream_gen/layouts/test.tscn")]

const floors = [preload("res://dream_gen/tiles/floors/floor_flat.tscn")]
var floors_picked = []
const stairs = [preload("res://dream_gen/tiles/stairs/stairs_center.tscn")]
var stairs_picked
const walls = [preload("res://dream_gen/tiles/walls/wall_full.tscn"),
preload("res://dream_gen/tiles/walls/wall_half.tscn")]
var walls_picked

var props = [preload("res://gizmo_cube/gizmo_cube.tscn")]
var prop_set = []

const colors = [Color("#1a1c2c"),
Color("#5d275d"),
Color("#b13e53"),
Color("#ef7d57"),
Color("#ffcd75"),
Color("#a7f070"),
Color("#38b764"),
Color("#257179"),
Color("#29366f"),
Color("#3b5dc9"),
Color("#41a6f6"),
Color("#73eff7"),
Color("#f4f4f4"),
Color("#94b0c2"),
Color("#566c86"),
Color("#333c57")]

var materials = [preload("res://dream_gen/materials/tilemat1.tres"),
preload("res://dream_gen/materials/tilemat2.tres"),
preload("res://dream_gen/materials/tilemat3.tres")]

const albedo_textures = [preload("res://dream_gen/textures/planks.png"),
preload("res://dream_gen/textures/liquid.png"),
preload("res://dream_gen/textures/plates.png")]

var dream_rng

func _ready():
	randomize()
	dream_rng = RandomNumberGenerator.new()
	_dream_rng_refresh()

func _dream_rng_refresh():
	dream_rng.seed = randi()
	_pick_tiles()
	_pick_props()

func _pick_tiles():
	for n_floor in 4:
		var floor_id = dream_rng.randi()%floors.size()
		floors_picked.append(floors[floor_id])
	var stairs_id = dream_rng.randi()%stairs.size()
	stairs_picked = stairs[stairs_id]
	var walls_id = dream_rng.randi()%walls.size()
	walls_picked = walls[walls_id]

func _pick_props():
	prop_set = []
	for n_common in 4:
		var prop_id = dream_rng.randi()%props.size()
		prop_set.append(props[prop_id])
