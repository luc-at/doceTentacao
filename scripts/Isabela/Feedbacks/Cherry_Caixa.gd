extends CharacterBody3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var animation_andar= $AnimationPlayer
var animation_percurso = null 
var run = "runcaixa"
var embora = "embora"
var idle = "idlecaixa"
var pode_andar = false

func _ready():
	animation_andar.play(idle)
	
func _on_node__pai_feedback_cherry_animação_andar():
	animation_percurso = $AnimationPlayer2
	animation_andar.play(run)
	animation_percurso.play(embora)
