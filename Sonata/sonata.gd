extends CharacterBody2D
const MAX_SPEED = 80
const ACCELERATION = 500
const FRICTION = 500

@onready var animation = $AnimationPlayer

# Inputs for characters
var left = Input.get_action_strength("left") 
var right = Input.get_action_strength("right")
var down = Input.get_action_strength("down")
var up = Input.get_action_strength("up")

func _physics_process(delta):
	velocity = Vector2.ZERO
	var inpput_direction = Vector2.ZERO
	inpput_direction.x = right - left
	inpput_direction.y = down - up
	inpput_direction =inpput_direction.normalized()
	
	if right:
		animation.flip_h = false
		animation.play("walkside")
		velocity =  velocity.move_toward(inpput_direction * MAX_SPEED, ACCELERATION * delta)
	else:
		animation.play("Idleside")
		velocity =  velocity.move_toward(Vector2.ZERO,FRICTION * delta)
	
	
	
	
