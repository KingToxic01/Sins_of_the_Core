extends CharacterBody2D

var speed = 40


var player_chase = false
var sonata = null
@onready var animation = $AnimatedSprite2D

func _physics_process(delta):
	if player_chase:
		position +=  (sonata.position - position)/speed
		animation.play("Front")
	else :
		animation.play("Idle")


func _on_area_2d_body_entered(body):
	sonata = body
	player_chase = true


func _on_area_2d_body_exited(body):
	sonata = null
	player_chase = false














































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


