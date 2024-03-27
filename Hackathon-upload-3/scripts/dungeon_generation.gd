extends Node

#var spawn = preload("res://TSCN/Scenes/Spawn.tscn")
var room = preload("res://TSCN/Scenes/Room4A.tscn")

var min_number_rooms = 8
var max_number_rooms = 12
#Chance of room generating
var generation_chance = 20

func generate(room_seed):
	seed(room_seed)
	var dungeon = {}
	var size = floor(randf_range(min_number_rooms, max_number_rooms))
	#initializing spawn room
	dungeon[Vector2(0,0)] = room.instantiate()
	size -= 1
	#generating rooms
	while(size > 0):
		for i in dungeon.keys():
			if(randf_range(0,100) < generation_chance) and size > 0:
				var direction = randf_range(0,4)
				if(direction < 1):
					#generates right
					var new_room_position = i + Vector2(1, 0)
					if(!dungeon.has(new_room_position)):
						dungeon[new_room_position] = room.instantiate()
						size -= 1
					if(dungeon.get(i).connected_rooms.get(Vector2(1, 0)) == null):
						connect_rooms(dungeon.get(i), dungeon.get(new_room_position), Vector2(1, 0))
				elif(direction < 2):
					#generates left
					var new_room_position = i + Vector2(-1, 0)
					if(!dungeon.has(new_room_position)):
						dungeon[new_room_position] = room.instantiate()
						size -= 1
					if(dungeon.get(i).connected_rooms.get(Vector2(-1, 0)) == null):
						connect_rooms(dungeon.get(i), dungeon.get(new_room_position), Vector2(-1, 0))
				elif(direction < 3):
					#generates top
					var new_room_position = i + Vector2(0, 1)
					if(!dungeon.has(new_room_position)):
						dungeon[new_room_position] = room.instantiate()
						size -= 1
					if(dungeon.get(i).connected_rooms.get(Vector2(0, 1)) == null):
						connect_rooms(dungeon.get(i), dungeon.get(new_room_position), Vector2(0, 1))
					#generates bottom
				elif(direction < 4):
					var new_room_position = i + Vector2(0, -1)
					if(!dungeon.has(new_room_position)):
						dungeon[new_room_position] = room.instantiate()
						size -= 1
					if(dungeon.get(i).connected_rooms.get(Vector2(0, -1)) == null):
						connect_rooms(dungeon.get(i), dungeon.get(new_room_position), Vector2(0, -1))
	
	while(!is_interesting(dungeon)):
		for i in dungeon.keys():
			dungeon.get(i).queue_free()
		var seed = room_seed * randf_range(-1,1) + randf_range(-100,100)
		print(seed)
		dungeon = generate(seed)
	#return dungeon generated
	return dungeon

func connect_rooms(room1, room2, direction):
	room1.connected_rooms[direction] = room2
	room2.connected_rooms[-direction] = room1
	room1.number_of_connections += 1
	room2.number_of_connections += 1

func is_interesting(dungeon):
	var room_with_three = 0
	for i in dungeon.keys():
		if(dungeon.get(i).number_of_connections >= 3):
			room_with_three += 1
	return room_with_three >= 2


