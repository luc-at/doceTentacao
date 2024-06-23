extends Node2D

signal animação_andar

@export var feedback_bom: JSON
@export var feedback_ruim: JSON
@export var feedback_regular: JSON

@onready var panel_container = $Caixa/Tela/PanelContainer
@onready var rich_text = $Caixa/Tela/PanelContainer/VBoxContainer/Text

@onready var state = {
	"saída_personagem": false,
	"voz_personagem": false
}

func _ready():
	#aqui precisa acertar o "if" dependendo de qual feedback o jogador vai receber
	if Globals.levelAvai3 == 0:
		($EzDialogue as EzDialogue).start_dialogue(feedback_bom, state)
		print("wirdo bom")
	elif Globals.levelAvai3 == 1:
		($EzDialogue as EzDialogue).start_dialogue(feedback_regular, state)
		print("wirdo meio")
	elif Globals.levelAvai3 == 2:
		print("wirdo ruim")
		($EzDialogue as EzDialogue).start_dialogue(feedback_ruim, state)

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

func _on_ez_dialogue_custom_signal_received(value: String):
	var params = value.split(",")
		
	if params[0] == "sai":
		var variable_name = params [1]
		if variable_name == "true":
			animação_andar.emit()
	
	if params[0] == "voz":
		var variable_name3 = params [1]
		var variable_value3 = params [2]
		var bol_variable3 = (variable_value3 == "true")
		if bol_variable3:
		#if variable_name3 == "voz_personagem":
			mudar_cor(0xffd4d8ff, 0xea6f79ff, 0xea6f79ff)
		else:
			mudar_cor(0xd39ffbff,0x8c41c6ff,0x8c41c6ff)
		
func mudar_cor(cor_bg, cor_contorno, cor_texto):
	var style_box = panel_container.get_theme_stylebox("panel")
	
	if style_box:
		style_box.bg_color = Color.hex(cor_bg)
		style_box.border_color = Color.hex(cor_contorno)
		panel_container.add_theme_stylebox_override("panel", style_box)
		
	rich_text.add_theme_color_override("default_color", Color.hex(cor_texto))
	
func _on_ez_dialogue_end_of_dialogue_reached():
	$Caixa.is_dialogue_done = true
	pass # Replace with function body.
	
func _on_caixa_fim_cena():
	get_tree().change_scene_to_file("res://cenas/Isabela/Pedido_04/pedido_04.tscn")
	pass # Replace with function body.
