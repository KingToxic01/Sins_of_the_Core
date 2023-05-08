extends CharacterBody2D

var attack_cooldown = true
var enemy_in_attack_range = false
var speed = 80
var attack_in_progress = false
var current_direct = "none"
@onready var animation = $AnimationPlayer
@onready var attack_deal = $Deal_attack_timer

#parameters/Idle/blend_position
	


#func _input(event):

# https://www.youtube.com/watch?v=pBoXqW4RykE&ab_channel=DevWorm <---- This video save me much time
func _ready():
	
	animation.play("Idlefront")

func _physics_process(delta):
	EnemyAttack()
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

	
	
	move_and_slide()


func PlayAnimator(movement):
	var dir = current_direct
	
	if dir == "right":
		if movement == 1:
			animation.play("walkside")
		elif  movement == 0:
			if attack_in_progress == false:
				animation.play("Idleside")
			
	if dir == "left":
		if movement == 1:
			animation.play("walkleft")
		elif  movement == 0:
			if attack_in_progress == false:
				animation.play("idleleft")
			
	if dir == "down":
		if movement == 1:
			animation.play("walkfront")
		elif  movement == 0:
			if attack_in_progress == false:
				animation.play("Idlefront")
			
	if dir == "up":
		if movement == 1:
			animation.play("walkback")
		elif  movement == 0:
			animation.play("idleback")
		
func _on_front_attack_body_entered(body):
	if body.has_method("Enemy"):
		enemy_in_attack_range = true


func _on_front_attack_body_exited(body):
	if body.has_method("Enemy"):
		enemy_in_attack_range = false
		

func EnemyAttack():
	if enemy_in_attack_range and attack_cooldown == true:
		attack_cooldown = false
		$AttackTimer.start()
		print("Enemy is attacking")


func _on_attack_timer_timeout():
	attack_cooldown = true 
	
func Attack():
	var dir = current_direct
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		Global.player_current_attacking = true
		attack_in_progress = true
		if dir == "right":
			animation.flip_h = false
			animation.play("Side Attack")
			attack_deal.start()
		if dir == "left":
			animation.flip_h = true
			animation.play("Side Attack")
			attack_deal.start()
		if dir == "down":
			animation.play("frontAttack")
func Player():
	pass
















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
#	if  Input.is_key_pressed(KEY_S):
#	# Determine animation state based on input direction
#	if input_direction.x > 0 and input_direction.y > 0:
#		animation.play("walkfront")
#		velocity = Vector2(0,1) * MAX_SPEED
#		move_and_slide()
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
	

	
	
	
	

	
	
	








