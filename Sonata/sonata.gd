extends CharacterBody2D

var speed = 80

@onready var animation = $AnimationPlayer
#parameters/Idle/blend_position
	

func _input(event):
	var input_direction = Vector2( 
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up"))
	
	velocity = input_direction * speed
	velocity.normalized()
#	if input_direction.x > Vector2.ZERO and input_direction.y > Vector2.ZERO:
#		animation.play("Idlefront")
	if  Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$Area2D/CollisionShape2D.disabled = false
		animation.play("frontAttack")
	else :
		$Area2D/CollisionShape2D.disabled = true
	
		
	if Input.get_action_strength("right"):
		animation.play("walkside") 
	
	elif  Input.is_action_just_released("right"):
		animation.play("Idleside")
	
	if Input.get_action_strength("left"):
		animation.play("walkleft")
	
	elif Input.is_action_just_released("left"):
		animation.play("idleleft")
	
	if Input.get_action_strength("down"):
		animation.play("walkfront")
	elif Input.is_action_just_released("down"):
		animation.play("Idlefront")
	
	if Input.get_action_strength("up"):
		animation.play("walkback")
	elif Input.is_action_just_released("up"):
		animation.play("idleback")


func _physics_process(delta):
	_input(input_event)
	move_and_slide()

#func _on_area_2d_area_entered(area):
#	if area.is_in_group("Hit"):
#		area.TakesDamage()
	

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

# JC script part down below!


func _on_attract_body_entered(body):
	if body.is_in_group("Enemy"):
		body.attack_timer.start()
	

func _on_attract_body_exited(body):
	if body.is_in_group("Enemy"):
		body.attack_timer.stop()
		body.state = body.SURROUND

func _on_enemy_attack_body_entered(body):
	if body.is_in_group("Enemy"):
		body.state = body.HIT

func _on_enemy_attack_body_exited(body):
	if body.is_in_group("Enemy"):
		body.state = body.SURROUND
