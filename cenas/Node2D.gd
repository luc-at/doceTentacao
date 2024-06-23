extends Node2D

@onready var choice_button_scn = preload("res://cenas/ChoiceButton.tscn")
@onready var panel_container = $Tela/PanelContainer

@onready var state = {
}

var choice_buttons: Array[Button] = []
var is_dialogue_done = false

func _ready():
	pass
	
func clear_panel_container():
	panel_container.position = Vector2(-200,-200)
	pass
	
func clear_dialogue_box():
	$Tela/PanelContainer/VBoxContainer/Text.text = ""
	for choice in choice_buttons:
		$Tela/PanelContainer/VBoxContainer.remove_child(choice)
	choice_buttons = []
	
func add_text(text: String):
	$Tela/PanelContainer/VBoxContainer/Text.text = text
	
	
	#$Tela/PanelContainer.bg_color = Color.AQUA
	
func add_choice(choice_text: String):
	var button_obj = choice_button_scn.instantiate()
	button_obj.choice_index = choice_buttons.size()
	choice_buttons.push_back(button_obj)
	button_obj.text = choice_text
	button_obj.choice_selected.connect(_on_choice_selected)
	$Tela/PanelContainer/VBoxContainer.add_child(button_obj)
	
func _on_choice_selected(choice_index: int):
	if !is_dialogue_done:
		($"../EzDialogue" as EzDialogue).next(choice_index)
	else:
		clear_dialogue_box()
		clear_panel_container()
		


