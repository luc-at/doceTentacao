extends CharacterBody3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var animation_andar= null 
var animation_percurso = null 
var run = "run"
var chegando = "chegando"
var idle = "idle"
var monstro = "monstrao"
var pode_andar = false

func _ready():
	pass

func _on_dialogue_scene_animação_andar():
	animation_andar = $AnimationPlayer
	animation_percurso = $AnimationPlayer2
	animation_andar.play(run)
	animation_percurso.play(chegando)
	pass # Replace with function body.

func _on_dialogue_scene_animação_monstro():
	animation_andar.play(monstro)
	pass # Replace with function body.

func _on_dialogue_scene_animação_idle():
	animation_andar.play(idle)
	pass # Replace with function body.

func _on_animation_player_2_animation_finished(anim_name):
	animation_andar.play(idle)
	pass # Replace with function body.
