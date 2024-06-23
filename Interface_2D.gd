extends Node2D

#@onready var vbox_container = $Caixa/Tela/VBoxContainer
#@onready var vbox_container = get_node("$Control_Box/Panel/Dialogue_Scene/Caixa/Tela/VBoxContainer")
#@onready var panel_rect = get_node("$Control_Box/Panel")

func _ready():
	pass
	#vbox_container.resized.connect(_on_v_box_container_resized)
	
	
#func _on_v_box_container_resized():
	#print ("mudou de tamanho")
	# Obter o tamanho atual do VBoxContainer
	#var vbox_size = vbox_container.size
	# Definir a margem desejada para a borda do retângulo
	#var border_margin = 4
	# Calcular o tamanho do retângulo
	#var rect_size = vbox_size + Vector2(border_margin * 2, border_margin * 2)
	# Definir o tamanho mínimo do retângulo
	#panel_rect.size = rect_size

