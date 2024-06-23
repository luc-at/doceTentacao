extends Control

var corCobertura: int = 0
var coberturaScene: PackedScene
@onready var coberturaNode = $"../Cobertura"

var coberturaExiste: bool = false
var formaIndex = Globals.forma

func _ready():

	var sabor = Globals.sabor_scene
	#print(sabor)
	var boloModelo = sabor.instantiate()
	boloModelo.global_position = $"../BoloSpawn".position
	$"../Recheios".add_child(boloModelo)

func _on_cobertura_1_pressed():
	corCobertura = 1
	Globals.cor = 1
	coberturaSpawn()

func _on_cobertura_2_pressed():
	corCobertura = 2
	Globals.cor = 2
	coberturaSpawn()

func _on_cobertura_3_pressed():
	corCobertura = 3
	Globals.cor = 3
	coberturaSpawn()

func _on_cobertura_4_pressed():
	corCobertura = 4
	Globals.cor = 4
	coberturaSpawn()

func _on_cobertura_5_pressed():
	corCobertura = 5
	Globals.cor = 5
	coberturaSpawn()
	
func _on_cobertura_6_pressed():
	corCobertura = 6
	Globals.cor = 6
	coberturaSpawn()

	
func coberturaSpawn():
	if coberturaExiste:
		clearCobertura()
	
	match formaIndex:
		1:
			match corCobertura:
				1:
					coberturaScene = load("res://Coberturas/quadrado_azul.tscn")
				2:
					coberturaScene = load("res://Coberturas/quadrado_branco.tscn")
				3:
					coberturaScene = load("res://Coberturas/quadrado_lilas.tscn")
				4:
					coberturaScene = load("res://Coberturas/quadrado_preto.tscn")
				5:
					coberturaScene = load("res://Coberturas/quadrado_rosa.tscn")
				6:
					coberturaScene = load("res://Coberturas/quadrado_vermelho.tscn")
		2:
			match corCobertura:
				1:
					coberturaScene = load("res://Coberturas/circulo_azul.tscn")
				2:
					coberturaScene = load("res://Coberturas/circulo_branco.tscn")
				3:
					coberturaScene = load("res://Coberturas/circulo_lilas.tscn")
				4:
					coberturaScene = load("res://Coberturas/circulo_preto.tscn")
				5:
					coberturaScene = load("res://Coberturas/circulo_rosa.tscn")
				6:
					coberturaScene = load("res://Coberturas/circulo_vermelho.tscn")
					
		3:
			match corCobertura:
				1:
					coberturaScene = load("res://Coberturas/coracao_azul.tscn")
				2:
					coberturaScene = load("res://Coberturas/coracao_branco.tscn")
				3:
					coberturaScene = load("res://Coberturas/coracao_lilas.tscn")
				4:
					coberturaScene = load("res://Coberturas/coracao_preto.tscn")
				5:
					coberturaScene = load("res://Coberturas/coracao_rosa.tscn")
				6:
					coberturaScene = load("res://Coberturas/coracao_vermelho.tscn")
					
	var cobertura = coberturaScene.instantiate()
	cobertura.global_position = $"../RecbeioSpawn".position
	coberturaNode.add_child(cobertura)
	Globals.cor_scene = coberturaScene
	coberturaExiste = true

func clearCobertura():
	for n in coberturaNode.get_children():
		coberturaNode.remove_child(n)
		n.queue_free() 
		
#1 azul
#2 branco
#3 lilás
#4 preto
#5 rosa
#6 vermelho

func _on_cobertura_cena_muda_pressed():
	if coberturaExiste:
		get_tree().change_scene_to_file("res://cenas/ColocarDecoracao.tscn")
