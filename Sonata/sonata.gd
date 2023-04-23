extends CharacterBody2D

var speed = 98
var current_direct = "none"
@onready var animation = $AnimationPlayer

<<<<<<< Updated upstream
#func _input(event):
	




func _physics_process(delta):
	
	var input_direction = Vector2( 
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up"))
	
	velocity = input_direction * speed
	velocity.normalized()
	print(input_direction)
	
	if input_direction.x > 0 and input_direction.y > 0 :
		animation.play("walkfront")
	
	if input_direction.x < 0 and input_direction.y > 0:
		animation.play("walkfront")
		
	if  input_direction.x == 0 and input_direction.y == 0  or input_direction.x == 0 and input_direction.y == 0:
		animation.play("Idlefront")
	
	if input_direction.x < 0 and input_direction.y < 0:
		animation.play("walkback")
			
	if input_direction.x > 0 and input_direction.y < 0:
		animation.play("walkback")
	
	if  input_direction.x == 0 and input_direction.y == 0 or input_direction.x == 0 and input_direction.y == 0 :
		animation.play("idleback")
	
	if input_direction.x > 0:
		animation.play("walkside")
	
	if  input_direction.x < 0:
		animation.play("walkleft")
	
	if input_direction.x > 0 and input_direction.x >= 0:
		animation.play("Idleside")
			
	if input_direction.x < 0 and input_direction.x <= 0 :
			animation.play("idleleft")
	
	if input_direction.y > 0:
		animation.play("walkfront")
	
	if  input_direction.y < 0:
		animation.play("walkback")
	
	if input_direction.y > 0 and input_direction.y >= 0:
		animation.play("Idlefront")
			
	if input_direction.y < 0 and input_direction.y <= 0:
		animation.play("idleback")
	#if Input.get_action_strength("right"):
	#	animation.play("walkside") 
#
#	elif Input.is_action_just_released("right"):
#		animation.play("Idleside")
#
#	if Input.get_action_strength("left"):
#		animation.play("walkleft")
#
#	elif Input.is_action_just_released("left"):
#		animation.play("idleleft")
#
#	if Input.get_action_strength("down"):
#		animation.play("walkfront")
#
#	elif Input.is_action_just_released("down"):
#		animation.play("Idlefront")
#
#	if Input.get_action_strength("up"):
#		animation.play("walkback")
	
#	elif Input.is_action_just_released("up"):
#		animation.play("idleback")
#
#	if  Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
#		$Area2D/CollisionShape2D.disabled = false
#		animation.play("frontAttack")
#	else :
#		$Area2D/CollisionShape2D.disabled = true
	
	
	
	move_and_slide()
=======
# https://www.youtube.com/watch?v=pBoXqW4RykE&ab_channel=DevWorm <---- This video save me much time
func _ready():
	animation.play("Idlefront")

func _physics_process(delta):
	PlayerMovement(delta)

func PlayerMovement(delta):
	if Input.is_action_pressed("right"):
		current_direct = "right"
		PlayAnimator(1)
		velocity.x = speed
		velocity.y = 0
		animation.play("walkside") 
	
	elif Input.is_action_pressed("left"):
		current_direct = "left"
		PlayAnimator(1)
		velocity.x = -speed
		velocity.y = 0
		animation.play("walkleft")
	
	elif Input.is_action_pressed("down"):
		current_direct = "down"
		PlayAnimator(1)
		velocity.y = speed
		velocity.x = 0
		animation.play("walkfront")

	elif Input.is_action_pressed("up"):
		current_direct = "up"
		PlayAnimator(1)
		velocity.y = -speed
		velocity.x = 0
		animation.play("walkback")
	
	else :
		PlayAnimator(0)
		velocity.x = 0
		velocity.y = 0

	if  Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$Area2D/CollisionShape2D.disabled = false
		animation.play("frontAttack")
	else :
		$Area2D/CollisionShape2D.disabled = true
	
	move_and_slide()


func PlayAnimator(movement):
	var dir = current_direct
>>>>>>> Stashed changes
	
	if dir == "right":
		if movement == 1:
			animation.play("walkside")
		elif  movement == 0:
			animation.play("Idleside")
	
	if dir == "left":
		if movement == 1:
			animation.play("walkleft")
		elif  movement == 0:
			animation.play("idleleft")
			
	if dir == "down":
		if movement == 1:
			animation.play("walkfront")
		elif  movement == 0:
			animation.play("Idlefront")
			
	if dir == "up":
		if movement == 1:
			animation.play("walkback")
		elif  movement == 0:
			animation.play("idleback")
		

func _on_area_2d_area_entered(area):
	if area.is_in_group("Hit"):
		area.TakesDamage()
	
















	# The CODE BELOW IS OUTDATED  
	
#	var input_direction = Vector2(
#		Input.get_action_strength("right") - Input.get_action_strength("left"),
#		Input.get_action_strength("down") - Input.get_action_strength("up"))
#
#	# Normalize input direction vector
#	input_direction = input_direction.normalized()
#
#	# Multiply by speed
#	var velocity = input_direction * speed
#
#	# Determine animation state based on input direction
#	if input_direction.x > 0 and input_direction.y > 0:
#		animation.play("walkfront")
#	elif input_direction.x < 0 and input_direction.y > 0:
#		animation.play("walkfront")
#	elif input_direction.x > 0 and input_direction.y < 0:
#		animation.play("walkback")
#	elif input_direction.x < 0 and input_direction.y < 0:
#		animation.play("walkback")
#	elif input_direction.x > 0:
#		animation.play("walkside")
#	elif input_direction.x < 0:
#		animation.play("walkleft")
#	elif input_direction.y > 0:
#		animation.play("walkfront")
#	elif input_direction.y < 0:
#		animation.play("walkback")
#	else:
<<<<<<< Updated upstream
#		animation.play("Idlefront")




=======
#		# Determine idle animation based on input direction
#		if velocity.x > 0:
#			animation.play("idleside")
#		elif velocity.x < 0:
#			animation.play("idleleft")
#		elif velocity.y > 0:
#			animation.play("Idlefront")
#		else:
#			animation.play("idleback")
#	# Move the character
#	move_and_slide()
	

	
	
	
	

	
	
	






>>>>>>> Stashed changes
