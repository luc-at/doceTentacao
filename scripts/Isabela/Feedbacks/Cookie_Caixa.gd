extends CharacterBody3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var animation_andar= $AnimationPlayer
var animation_percurso = null 
var run = "runCAIXA"
var embora = "embora"
var idle = "idleCAIXA"
var pode_andar = false

func _ready():
	animation_andar.play(idle)
	pass
	
func _on_node_pai_feedback_cookie_animação_andar():
	animation_percurso = $AnimationPlayer2
	animation_andar.play(run)
	animation_percurso.play(embora)
	pass # Replace with function body.
