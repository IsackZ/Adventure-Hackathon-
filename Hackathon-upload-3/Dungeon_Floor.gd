extends Node2D

var dungeon = {}
var node_sprite = preload("res://TSCN/Scenes/Room4A.tscn")
var character_scene = preload("res://objects/top_down/main_character_top_down.tscn")

const ROOM_SIZE = Vector2(570, 570)

func _ready():
	dungeon = DungeonGeneration.generate(randf_range(-1000, 1000))
	
	load_map()
	add_child(character_scene.instantiate())
func load_map():
	for pos in dungeon.keys():
		var node_instance = node_sprite.instantiate()
		node_instance.position = pos * ROOM_SIZE
		add_child(node_instance)
