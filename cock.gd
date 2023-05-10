extends CharacterBody2D
var sonata = null
var speed = 40
var player_chase = false
var health = 100
var player_inattack_zone = false
var can_take_damage = true

func _physics_process(delta):
	take_damage()
	
	if player_chase:
		position += (sonata.position - position)/speed
		if (sonata.position.x - position.x) < 0:
			$Sprite2D.flip_h = false
		else :
			$Sprite2D.flip_h = true
		move_and_collide(Vector2.ZERO)



func _on_detection_area_body_entered(body):
	sonata = body
	player_chase = true


func _on_detection_area_body_exited(body):
	sonata = body
	player_chase = true
	
func enemy():
	pass


func _on_hitbox_body_entered(body):
	if body.has_method("player"):
		player_inattack_zone = true


func _on_hitbox_body_exited(body):
	if body.has_method("player"):
		player_inattack_zone = false

func take_damage():
	if player_inattack_zone and global.player_current_attack == true:
		if can_take_damage == true:
			health = health - 33
			$take_damage_cooldown.start()
			$AudioStreamPlayer2D.play()
			can_take_damage = false
			print("cock health = ", health)
			if health <= 0:
				self.queue_free()
				


func _on_take_damage_cooldown_timeout():
	can_take_damage = true
