extends Node

var tiles = [preload("res://dream_gen/tiles/empty.tscn"),
preload("res://dream_gen/tiles/cross.tscn")]

#Sweetie 16
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

var materials = [preload("res://materials/floor1.tres"),
preload("res://materials/floor2.tres"),
preload("res://materials/prop1.tres"),
preload("res://materials/prop2.tres")]

const normal_maps = [preload("res://textures/normal/brick.png"),
preload("res://textures/normal/caustics.png"),
preload("res://textures/normal/grid.png"),
preload("res://textures/normal/hexagon.png"),
preload("res://textures/normal/line.png"),
preload("res://textures/normal/random_dots.png"),
preload("res://textures/normal/random_lines.png"),
preload("res://textures/normal/scales.png"),
preload("res://textures/normal/voronoi.png"),
preload("res://textures/normal/waves.png")]

var dream_rng

func _ready():
	dream_rng = RandomNumberGenerator.new()
	dream_rng.randomize()
