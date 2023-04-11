extends Control

var current_health = 100
var damage = 50
func update_health_bar():
	var bar_width = current_health - damage
	get_node("Bar").set_size(Vector2(bar_width, 17))

func _ready():
		update_health_bar()




