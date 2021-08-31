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

const textures = [preload("res://textures/source/bark.png"),
preload("res://textures/source/brick.png"),
preload("res://textures/source/ceramic_tiles.png"),
preload("res://textures/source/chess.png"),
preload("res://textures/source/cogs.png"),
preload("res://textures/source/fabric.png"),
preload("res://textures/source/foam.png"),
preload("res://textures/source/glass.png"),
preload("res://textures/source/glass_blocks.png"),
preload("res://textures/source/grass.png"),
preload("res://textures/source/ice.png"),
preload("res://textures/source/leaf.png"),
preload("res://textures/source/leaves.png"),
preload("res://textures/source/marble.png"),
preload("res://textures/source/meat.png"),
preload("res://textures/source/metal.png"),
preload("res://textures/source/paint.png"),
preload("res://textures/source/pipes.png"),
preload("res://textures/source/planks.png"),
preload("res://textures/source/quartz.png"),
preload("res://textures/source/rug.png"),
preload("res://textures/source/snow.png"),
preload("res://textures/source/soap_film.png"),
preload("res://textures/source/sponge.png"),
preload("res://textures/source/stone.png"),
preload("res://textures/source/textbook.png"),
preload("res://textures/source/toy_bricks.png"),
preload("res://textures/source/wall.png"),
preload("res://textures/source/water.png")]

var dream_rng

func _ready():
	dream_rng = RandomNumberGenerator.new()
	dream_rng.randomize()
