extends CharacterBody2D
var speed = 80


@onready var animation = $AnimationPlayer



func _input(event):
	var input_direction = Vector2( 
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up"))
	velocity = input_direction * speed
	
	if Input.get_action_strength("right"):
		animation.play("walkside") 
		$SpriteAnimation.flip_h = false
	
	elif event.is_action_released("right"):
		animation.play("Idleside")
	
	if Input.get_action_strength("left"):
		$SpriteAnimation.flip_h = true
		animation.play("walkside")
	
	elif event.is_action_released("left"):
		$SpriteAnimation.flip_h = false
		animation.play("Idleside")
		
	if Input.get_action_strength("down"):
		animation.play("walkfront")
	elif event.is_action_released("down") :
		animation.play("Idlefront")
	
	if Input.get_action_strength("up"):
		animation.play("walkback")
	elif  event.is_action_released("up"):
		animation.play("idleback")
		

func _physics_process(delta):
	_input(input_event)
	move_and_slide()
	
		
	
	

#	if Input.is_key_pressed(KEY_W):
#		#animation.flip_h = false
#		animation.play("walkback")
#		velocity = Vector2(0,-1) * MAX_SPEED
#		move_and_slide()
#	else :
#		animation.play("idleback")
#
#	if  Input.is_key_pressed(KEY_S):
#		animation.play("walkfront")
#		velocity = Vector2(0,1) * MAX_SPEED
#		move_and_slide()
#	else:
#		animation.play("Idlefront")
		
