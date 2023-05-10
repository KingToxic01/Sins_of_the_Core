extends VideoStreamPlayer


func _ready():
	pass # Replace with function body.


func _on_finished():
	get_tree().change_scene_to_file("res://Level 1/World.tscn")
