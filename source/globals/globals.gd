extends Node

var tiles = [preload("res://dream_gen/tiles/flat.tscn"),
preload("res://dream_gen/tiles/bridge1.tscn"),
preload("res://dream_gen/tiles/street1.tscn")]

var materials = [preload("res://materials/bridge1.tres"),
preload("res://materials/bridge2.tres"),
preload("res://materials/car1.tres"),
preload("res://materials/car2.tres"),
preload("res://materials/car3.tres"),
preload("res://materials/floor.tres"),
preload("res://materials/house1.tres"),
preload("res://materials/house2.tres"),
preload("res://materials/house3.tres"),
preload("res://materials/street_lamp1.tres"),
preload("res://materials/street_lamp2.tres"),
preload("res://materials/tile.tres"),
preload("res://materials/tree1.tres"),
preload("res://materials/tree2.tres")]

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
