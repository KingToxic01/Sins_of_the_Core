extends Control
@onready var animation = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Letters")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_new_pressed():
	animation.play("newclicked")
	get_tree().change_scene_to_file("res://Level 1/World.tscn")


func _on_quit_pressed():
	animation.play("QuitKLick")
	get_tree().quit()


func _on_new_mouse_entered():
	animation.play("NewHover")
	# play the "MouseOverNew" animation when the mouse enters the new game button


func _on_new_mouse_exited():
	animation.play("NewIdle")


func _on_quit_mouse_entered():
	animation.play("Hoverquit")


func _on_quit_mouse_exited():
	animation.play("IdleQuit")
