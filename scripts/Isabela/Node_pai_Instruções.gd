#principal instruções!!!
extends Node2D

@onready var panel_container = $Caixa/Tela/PanelContainer
@onready var rich_text = $Caixa/Tela/PanelContainer/VBoxContainer/Text

@export var instruções: JSON
@onready var state = {}

func _ready():
	($EzDialogue as EzDialogue).start_dialogue(instruções, state)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_ez_dialogue_dialogue_generated(response):
	$Caixa.clear_dialogue_box()
	$Caixa.add_text(response.text)
	if response.choices.is_empty():
		$Caixa.add_choice("...")
	else:
		for choice in response.choices:
			$Caixa.add_choice(choice)
	
func _on_ez_dialogue_end_of_dialogue_reached():
	$Caixa.is_dialogue_done = true
	pass # Replace with function body.
			
pass # Replace with function body.

func _on_caixa_fim_instrução():
	get_tree().change_scene_to_file("res://cenas/Isabela/Pedido_1.tscn")
	pass # Replace with function body.
