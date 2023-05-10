extends CharacterBody2D
var enemy_range = false
var enemy_attackcooldown = true
var health = 100
var player_alive = true
var attack_cooldown = true
var enemy_in_attack_range = false
var speed = 100
var attack_ip = false
var current_direct = "none"
@onready var animation = $AnimationPlayer
@onready var attack_deal = $Deal_attack_timer

#parameters/Idle/blend_position
	


#func _input(event):

# https://www.youtube.com/watch?v=pBoXqW4RykE&ab_channel=DevWorm <---- This video save me much time
func _ready():
	
	animation.play("Idlefront")

func _physics_process(delta):
	PlayerMovement(delta)
	attack()
	enemy_attack()
	if health <= 0:
		player_alive = false
		health = 0
		print("Your bad")
		self.get_tree().change_scene_to_file("res://Menu buttons and Logo/menu.tscn")

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
			if attack_ip == false:
				animation.play("Idleside")
			
	if dir == "left":
		if movement == 1:
			animation.play("walkleft")
		elif  movement == 0:
			if attack_ip == false:
				animation.play("idleleft")
			
	if dir == "down":
		if movement == 1:
			animation.play("walkfront")
		elif  movement == 0:
			if attack_ip == false:
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
		

func player():
	pass

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_range = true


func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_range = false

func enemy_attack() :
	if enemy_range and enemy_attackcooldown == true:
		$enemy_cooldown.start()
		enemy_attackcooldown = false
		health = health - 10
		print (health)


func _on_enemy_cooldown_timeout():
	enemy_attackcooldown = true

func attack():
	var dir = current_direct
	
	if Input.is_action_just_pressed("Attack"):
		global.player_current_attack = true
		attack_ip = true
		if dir == "right":
			$SpriteAnimation.flip_h = false
			$SpriteAnimation.play("sideattack")
			$deal_attack_timer.start()
		if dir == "left":
			$SpriteAnimation.flip_h = true
			$SpriteAnimation.play("sideattack")
			$deal_attack_timer.start()
		if dir == "down":
			#$SpriteAnimation.flip_v = false
			$SpriteAnimation.play("frontAttack")
			$deal_attack_timer.start()
		if dir == "up":
			#$SpriteAnimation.flip_v = true
			$SpriteAnimation.play("frontAttack")
			$deal_attack_timer.start()



func _on_deal_attack_timer_timeout():
	$deal_attack_timer.stop()
	global.player_current_attack = false
	attack_ip = false
