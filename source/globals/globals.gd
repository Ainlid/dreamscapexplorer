extends Node

var tiles = [preload("res://dream_gen/tiles/flat.tscn"),
preload("res://dream_gen/tiles/bridge1.tscn"),
preload("res://dream_gen/tiles/street1.tscn"),
preload("res://dream_gen/tiles/forest.tscn")]

var materials = [preload("res://materials/brick.tres"),
preload("res://materials/brick2.tres"),
preload("res://materials/concrete.tres"),
preload("res://materials/floor.tres"),
preload("res://materials/glass.tres"),
preload("res://materials/leaves.tres"),
preload("res://materials/metal.tres"),
preload("res://materials/rubber.tres"),
preload("res://materials/stone.tres"),
preload("res://materials/tile.tres"),
preload("res://materials/wood.tres"),
preload("res://materials/wood2.tres")]

var dream_rng

func _ready():
	dream_rng = RandomNumberGenerator.new()
	dream_rng.randomize()
