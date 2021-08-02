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

const kicks = [preload("res://bgm_gen/drums_kick/kick1.wav"),
preload("res://bgm_gen/drums_kick/kick2.wav"),
preload("res://bgm_gen/drums_kick/kick3.wav"),
preload("res://bgm_gen/drums_kick/kick4.wav"),
preload("res://bgm_gen/drums_kick/kick5.wav"),
preload("res://bgm_gen/drums_kick/kick6.wav"),
preload("res://bgm_gen/drums_kick/kick7.wav"),
preload("res://bgm_gen/drums_kick/kick8.wav"),
preload("res://bgm_gen/drums_kick/kick9.wav"),
preload("res://bgm_gen/drums_kick/kick10.wav")]

const snares = [preload("res://bgm_gen/drums_snare/snare1.wav"),
preload("res://bgm_gen/drums_snare/snare2.wav"),
preload("res://bgm_gen/drums_snare/snare3.wav"),
preload("res://bgm_gen/drums_snare/snare4.wav"),
preload("res://bgm_gen/drums_snare/snare5.wav"),
preload("res://bgm_gen/drums_snare/snare6.wav"),
preload("res://bgm_gen/drums_snare/snare7.wav"),
preload("res://bgm_gen/drums_snare/snare8.wav"),
preload("res://bgm_gen/drums_snare/snare9.wav"),
preload("res://bgm_gen/drums_snare/snare10.wav")]

const hihats = [preload("res://bgm_gen/drums_hihat/hihat1.wav"),
preload("res://bgm_gen/drums_hihat/hihat2.wav"),
preload("res://bgm_gen/drums_hihat/hihat3.wav"),
preload("res://bgm_gen/drums_hihat/hihat4.wav"),
preload("res://bgm_gen/drums_hihat/hihat5.wav"),
preload("res://bgm_gen/drums_hihat/hihat6.wav")]

const textures = [preload("res://dream_gen/textures/test1.png"),
preload("res://dream_gen/textures/test2.png"),
preload("res://dream_gen/textures/test3.png"),
preload("res://dream_gen/textures/test4.png")]

const layouts = [preload("res://dream_gen/layouts/layout1.tscn")]

var dream_rng

func _ready():
	randomize()
	dream_rng = RandomNumberGenerator.new()
	_dream_rng_refresh()

func _dream_rng_refresh():
	dream_rng.seed = randi()
