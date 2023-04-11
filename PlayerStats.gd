extends Node

@export var max_health = 1
@onready var health = max_health

signal  no_health
signal  change_health(value)
func set_health(value):
	health = value
	emit_signal("change_health",health)
	if health <= 0:
		emit_signal("no_health ")
