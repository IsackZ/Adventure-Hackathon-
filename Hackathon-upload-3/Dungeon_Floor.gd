extends Node2D

var dungeon = {}
var node_sprite = preload("res://TSCN/Scenes/Room4A.tscn")
var slime_scene = preload("res://TSCN/Scenes/slime.tscn")
var character_scene = preload("res://objects/top_down/main_character_top_down.tscn")
var slime_spawn_chances = [20,10,4,2,1,0]

const ROOM_SIZE = Vector2(576, 576)

func _ready():
	dungeon = DungeonGeneration.generate(randf_range(-1000, 1000))
	
	load_map()
	add_child(character_scene.instantiate())
func load_map():
	for pos in dungeon.keys():
		var node_instance = node_sprite.instantiate()
		var i = 0
		var slime_chance = randf_range(0,100)
		while(slime_chance < slime_spawn_chances[i]):
			var slime_instance = slime_scene.instantiate()
			if i == 0:
				slime_instance.position = pos * ROOM_SIZE
			elif i == 1:
				slime_instance.position = pos * ROOM_SIZE + ROOM_SIZE/4
			elif i == 2:
				slime_instance.position = pos * ROOM_SIZE - ROOM_SIZE/4
			elif i == 3:
				slime_instance.position = pos * ROOM_SIZE + ROOM_SIZE.x/4 - ROOM_SIZE.y/4
			elif i == 4:
				slime_instance.position = pos * ROOM_SIZE - ROOM_SIZE.x/4 + ROOM_SIZE.y/4
			add_child(slime_instance)
			i += 1
		node_instance.position = pos * ROOM_SIZE
		add_child(node_instance)
