extends Node

var tiles = [preload("res://dream_gen/tiles/flat.tscn"),
preload("res://dream_gen/tiles/bridge1.tscn"),
preload("res://dream_gen/tiles/street1.tscn")]

var materials = [preload("res://materials/floor1.tres"),
preload("res://materials/floor2.tres"),
preload("res://materials/prop1.tres"),
preload("res://materials/prop2.tres"),
preload("res://materials/prop3.tres")]

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
