extends Control

# get a reference to the AudioStreamPlayer node
var music

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
	get_tree().change_scene_to_file("res://Level 1/World.tscn")
	

func _on_quit_button_pressed():
	get_tree().quit()
