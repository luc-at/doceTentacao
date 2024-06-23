extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Audio1._play_music_level()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	#Globals.level = 1
	get_tree().change_scene_to_file("res://cenas/Isabela/Instruções_cena.tscn")
	pass # Replace with function body.
