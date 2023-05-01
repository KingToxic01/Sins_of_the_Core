extends Control

# get a reference to the AudioStreamPlayer node
var music
@onready var animation = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/NewButton.grab_focus()
	music = $AudioStreamPlayer2D
	music.play()
	music.set_volume_db(-10) # set the volume to -10 dB


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_new_button_pressed():
	animation.play("NewButttonClicked")
	get_tree().change_scene_to_file("res://Level 1/World.tscn")
	

func _on_quit_button_pressed():
	animation.play("QuitClicked")
	get_tree().quit()


func _on_new_button_mouse_entered():
	animation.play("MouseOverNew")
	# play the "MouseOverNew" animation when the mouse enters the new game button

func _on_new_button_mouse_exited():
	animation.play("NewNoAction")


func _on_quit_button_mouse_entered():
	animation.play("QuitMouseHover")



func _on_quit_button_mouse_exited():
	animation.play("QuitNoAction")



func _on_load_button_pressed():
	animation.play("LoadClicked")


func _on_load_button_mouse_entered():
	animation.play("LoadMouseHover")


func _on_load_button_mouse_exited():
	animation.play("LoadNoAction")
