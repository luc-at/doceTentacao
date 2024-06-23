extends CharacterBody3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var animation_andar= null 
var animation_percurso = null 
var run = "Walking"
var chegando = "chegando"
var idle = "idlee"

func _ready():
	pass
	
func _on_d_layout_pedido_03_animação_andar():
	animation_andar = $AnimationPlayer
	animation_percurso = $AnimationPlayer2
	animation_andar.play(run)
	animation_percurso.play(chegando)

func _on_animation_player_2_animation_finished(anim_name):
	animation_andar.play(idle)
