extends CharacterBody2D

var speed = 100
var health = 100
var player_in_zone = false


var player_chase = false
var sonata = null
@onready var animation = $AnimatedSprite2D

func _physics_process(delta):
	velocity = Vector2.ZERO
	
		
	if  player_chase:
		position +=  (sonata.position - position)/speed
		animation.play("Front")
		if position.y:
			animation.play("Left")
		if (sonata.position.x - position.x) < 0:
			animation.flip_h = false
		else :
			animation.flip_h = true
	else :
		animation.play("Idle")
	
	
	move_and_collide(velocity)

func Enemy():
	pass
	


func _on_area_2d_body_entered(body):
	sonata = body
	player_chase = true
	


func _on_area_2d_body_exited(body):
	sonata = null
	player_chase = false
	animation.play("Idle")


func _on_attack_area_body_entered(body):
	if body.has_method("Player"):
		player_in_zone = true


func _on_attack_area_body_exited(body):
	if body.has_method("Player"):
		player_in_zone = false

func Enemy_Damage():
	if player_in_zone and Global.player_current_attacking == true:
		health = health - 20
		print("Enemy has:", health)
	if health <= 0:
		self.queue_free()










































#var enemy_velocity = Vector2.ZERO
#@onready var attack_timer = $AttackTimer
#
#var player = null
#var randomnum 
#var target
#
#
#enum {
#	SURROUND,
#	ATTACK,
#	HIT,
#}
#
#var state = SURROUND
#
#func _ready():
#	var rng = RandomNumberGenerator.new()
#	rng.randomize()
#	randomnum = rng.randf()
#
#
#
#func _physics_process(delta):
#	match state:
#		SURROUND:
#			move(get_circle_position(randomnum), delta)
#
#		ATTACK:
#			move(player.global_position, delta)
#
#		HIT:
#			print("Hit")
#			move(player.global_position, delta)
#
#			# enemy attack anim
#
#
#func move(target, delta):
#	var direction = (target - global_position).normalized()
#	var desired_velocity = direction * speed
#	var steering = (desired_velocity - velocity) * delta * 2.5
#	enemy_velocity += steering
#	enemy_velocity = move_and_slide()
#
#
#func _on_area_2d_body_entered(body):
#	print("entered")
#	player = body
#
#func _on_area_2d_body_exited(_body):
#	print("Exit")
#	player = null
#
#func get_circle_position(random):
#	var kill_circle_centre = player.global_position
#	var radius = 30
#	var angle = random * PI * 2;
#	var x = kill_circle_centre.x + cos(angle) * radius;
#	var y = kill_circle_centre.y + sin(angle) * radius;
#
#
#	return Vector2(x, y)
#
#func _on_attack_timer_timeout():
#	state = ATTACK
#
#
#func _on_area_2d_area_entered(area):
#	print("entered")
#	player = area





