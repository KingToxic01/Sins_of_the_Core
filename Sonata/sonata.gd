extends CharacterBody2D

func _physics_process(delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"), # <--- I added a comma
		Input.get_action_strength("down") - Input.get_action_strength("up"))
		
	print(input_direction) #This print the direction of the characte movement in the vector
	
