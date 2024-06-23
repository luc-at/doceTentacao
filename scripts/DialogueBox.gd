extends CanvasLayer

@onready var choice_button_scn = preload("res://cenas/ChoiceButton.tscn")

var choice_buttons: Array[Button] = []
func _ready():
	add_choice("this is choice number 0")
	add_choice("this is choice number 1")
	
func add_text(text: String):
	$VBoxContainer/Text.text = text
	
func add_choice(choice_text: String):
	var button_obj = choice_button_scn.instantiate()
	button_obj.choice_index = choice_buttons.size()
	choice_buttons.push_back(button_obj)
	button_obj.text = choice_text
	button_obj.choice_selected.connect(_on_choice_selected)
	$VBoxContainer.add_child(button_obj)
	
func _on_choice_selected(choice_index: int):
	print(choice_index)
	pass
