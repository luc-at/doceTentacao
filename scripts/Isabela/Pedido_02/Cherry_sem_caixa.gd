extends CharacterBody3D

signal personagem_chegou_no_balcão ()

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var animation_andar= null 
var animation_percurso = null 
var run = "run"
var chegando = "chegando"
var idle = "idle"

func _ready():
	pass


func _on_chegando_animation_finished(anim_name):
	animation_andar.play(idle)
	pass # Replace with function body.
	
func _on_node_pai_feedback_cookie_animação_andar():
	animation_andar = $AnimationPlayer
	animation_percurso = $Chegando
	animation_andar.play(run)
	animation_percurso.play(chegando)
	pass # Replace with function body.
	pass # Replace with function body.
