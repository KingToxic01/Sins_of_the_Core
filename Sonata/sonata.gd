extends CharacterBody2D

<<<<<<< Updated upstream
var attack_cooldown = true
var enemy_in_attack_range = false
var speed = 80
var attack_in_progress = false
=======
var enemy_inattack_range = false
var enemy_attack_ticks = true
var health = 100
var sonata_alive = true
var speed = 80
var attack_ip = false
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
	Attack()
=======
	enemy_attack()
	
	if health <= 0:
		sonata_alive = false # This is where you would add the END SCREEN IMPORTANT
		health = 0
		print("player has been disassembled")
		self.queue_free()
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
	
	
=======

#	if  Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
##		$player_hitbox/CollisionShape2D.disabled = false
#		animation.play("frontAttack")
#	else :
##		$player_hitbox/CollisionShape2D.disabled = true
>>>>>>> Stashed changes
	
	move_and_slide()


func PlayAnimator(movement):
	var dir = current_direct
	
	if dir == "right":
		if movement == 1:
			animation.play("walkside")
		elif  movement == 0:
<<<<<<< Updated upstream
			if attack_in_progress == false:
				animation.play("Idleside")
			
=======
			if attack_ip == false:
				animation.play("Idleside")
	
>>>>>>> Stashed changes
	if dir == "left":
		if movement == 1:
			animation.play("walkleft")
		elif  movement == 0:
<<<<<<< Updated upstream
			if attack_in_progress == false:
=======
			if attack_ip == false:
>>>>>>> Stashed changes
				animation.play("idleleft")
			
	if dir == "down":
		if movement == 1:
			animation.play("walkfront")
		elif  movement == 0:
<<<<<<< Updated upstream
			if attack_in_progress == false:
=======
			if attack_ip == false:
>>>>>>> Stashed changes
				animation.play("Idlefront")
			
	if dir == "up":
		if movement == 1:
			animation.play("walkback")
		elif  movement == 0:
			if attack_ip == false:
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
	
	if Input.is_action_just_pressed("Attack"):
		Global.player_current_attacking = true
		attack_in_progress = true
		if dir == "right":
			animation.play("Side Attack")
			attack_deal.start()
		if dir == "left":
			animation.play("attack_left")
			attack_deal.start()
		if dir == "down":
			animation.play("frontAttack")
			attack_deal.start()


func _on_deal_attack_timer_timeout():
	attack_deal.stop() # Replace with function body.
	Global.player_current_attacking = false
	attack_in_progress = false

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
func player():
	pass

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_inattack_range = true

func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_inattack_range = false

func enemy_attack():
	if enemy_inattack_range and enemy_attack_ticks == true:
		health = health - 10
		enemy_attack_ticks = false
		$attack_cooldown.start()
		print(health)

func _on_attack_cooldown_timeout():
	enemy_attack_ticks = true

func attack():
	var dir = current_direct
	if Input.is_action_just_pressed("MOUSE_BUTTON_LEFT"):
		global.player_current_attack = true
		attack_ip = true
		animation.play("frontAttack")
		$deal_attack_timer.start()
#		if dir == "right":
#			$AnimationPlayer.flip_h = false
#			$AnimationPlayer.play("frontAttack")
#			$deal_attack_timer.start()
#		if dir == "left":
#			$AnimationPlayer.flip_h = true
#			$AnimationPlayer.play("frontAttack")
#			$deal_attack_timer.start()
#		if dir == "down":
#			$AnimationPlayer.play("frontAttack")
#			$deal_attack_timer.start()
#		if dir == "up":
#			$AnimationPlayer.flip_v = true
#			$AnimationPlayer.play("frontAttack")
#			$deal_attack_timer.start()

<<<<<<< Updated upstream





=======
func _on_deal_attack_timer_timeout():
	$deal_attack_timer.stop()
	global.player_current_attack = false
	attack_ip = false
>>>>>>> Stashed changes
