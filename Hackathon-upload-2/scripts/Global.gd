extends Node2D

# Top Down Global Variables
var npc_introduction = false
var flower_found = false;
var quest = false

# Platformer Global Variables
var flower_count = 0
var nrg = 100
var health = 100
var mana = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	quest = false
	flower_found = false
	npc_introduction = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
