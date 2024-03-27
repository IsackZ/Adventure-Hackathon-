extends CharacterBody2D

@onready var animation = $AnimationPlayer


const SPEED = 200
const ACCEL = 30
func _ready():
	pass
	

func _physics_process(_delta):
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity.x = move_toward(velocity.x, SPEED * direction.x, ACCEL)
	velocity.y = move_toward(velocity.y, SPEED * direction.y, ACCEL)
	
	if Input.is_action_pressed("ui_left"):
		animation.play("walk_left")
	elif Input.is_action_just_released("ui_left"):
		animation.play("idle_left")
	
	elif Input.is_action_pressed("ui_right"):
		animation.play("walk_right")
	elif Input.is_action_just_released("ui_right"):
		animation.play("idle_right")
		
	elif Input.is_action_pressed("ui_up"):
		animation.play("walk_up")
	elif Input.is_action_just_released("ui_up"):
		animation.play("idle_up")
		
	elif Input.is_action_pressed("ui_down"):
		animation.play("walk_down")
	elif Input.is_action_just_released("ui_down"):
		animation.play("idle_down")

	move_and_slide()
