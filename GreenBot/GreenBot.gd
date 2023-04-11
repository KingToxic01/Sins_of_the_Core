extends CharacterBody2D

#
#@export var speed = 100
#@export var detection_range = 200
#@export var damage_amount = 10
#
#
#var target = null
#
#func _physics_process(delta):
#	if target != null:
#		# Calculate the vector from the enemy's position to the player's position
#		var direction = target.position - position
#		direction = direction.normalized()
#
#		# Move the enemy towards the player
#		move_and_slide()
#
#		# Rotate the enemy towards the player
#		look_at(target.position)
#
#		# Check for collision with player
#		var collision = move_and_collide(direction * speed * delta)
#		if collision and collision.collider.name == "Player":
#			# Remove health from the player
#			var player = collision.collider
#			player.health -= damage_amount


#func _on_detection_area_area_entered(area):
#	if area.name == "Player":
#		target = area
#
#func _on_detection_area_area_exited(area):
#	if area.name == "Player":
#		target = null
#
#
#func EnemyHit():
#	var time = Timer.new()
#	time.set_wait_time(0.1)
#	time.set_one_shot(true)
#	self.add_child(time)
#	time.start()
#	await (time)
