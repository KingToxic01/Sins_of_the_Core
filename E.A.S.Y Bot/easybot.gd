extends CharacterBody2D

@export var speed = 100



var attacking = false


@onready var animation = $AnimatedSprite2D

func _physics_process(delta): 
	
	move_and_slide()
