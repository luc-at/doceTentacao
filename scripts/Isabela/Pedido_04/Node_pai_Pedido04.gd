extends Node2D

@export var pedido_namorado: JSON
signal animação_andar

@onready var panel_container = $Caixa/Tela/PanelContainer
@onready var rich_text = $Caixa/Tela/PanelContainer/VBoxContainer/Text

@onready var state = {
	"entrada_personagem": false,
	"voz_personagem": false,
}

func _ready():
	($EzDialogue as EzDialogue).start_dialogue(pedido_namorado, state)
	Globals.reset()
	Globals.level = 4

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
	if params[0] == "entra":
		var variable_name2 = params [1]
		var variable_value2 = params [2]
		var bol_variable = (variable_value2 == "true")
		state [variable_name2] = bol_variable
		if variable_name2 == "entrada_personagem":
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
	get_tree().change_scene_to_file("res://cenas/BoloForma.tscn")
	
#AQUI LUCAS!!!
func _on_caixa_fim_cena():
	#colocar cena de fazer bolo do cookie (pedido 01)
	#get_tree().change_scene_to_file()
	#está mudando a cena para o feedback do pedido por enquanto!
	get_tree().change_scene_to_file("res://cenas/Isabela/feedbacks/feedback_namorado.tscn")
	pass # Replace with function body.
