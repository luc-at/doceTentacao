extends Control

@onready var forma_scene: PackedScene
@onready var recheio_scene: PackedScene

@onready var formaNode = $"../Formas"
@onready var recheioNode = $"../Recheios"

var saborMaterial

var saborIndex: int = 0
var formaIndex: int = 0

var formaExiste: bool = false
var recheioExiste: bool = false

func _process(_delta):
	#print(Globals.sabor, Globals.forma)
	pass
	
func forma_spawn():
	if formaExiste:
		forma_clear()
		
	if recheioExiste:
		for n in recheioNode.get_children():
			recheioNode.remove_child(n)
			n.queue_free()
		
	var forma = forma_scene.instantiate()
	forma.global_position = $"../BoloSpawn".position
	formaNode.add_child(forma)
	formaExiste = true

func forma_clear():
	for n in formaNode.get_children():
		formaNode.remove_child(n)
		n.queue_free() 
		
func loadRecheio(saborIndex):
	if recheioExiste:
		for n in recheioNode.get_children():
			recheioNode.remove_child(n)
			n.queue_free() 
	
	if formaExiste:
		var sabor = saborIndex
		var recheioSabor = saborMaterial 
		
		match formaIndex:
			1:
				match saborIndex:
					1:
						recheio_scene = load("res://Recheios/quadrado_bolo.tscn")
					2:
						recheio_scene = load("res://Recheios/quadrado_chocolate.tscn")
					3:
						recheio_scene = load("res://Recheios/quadrado_baunilha.tscn")
					4:
						recheio_scene = load("res://Recheios/quadrado_morango.tscn")
					5:
						recheio_scene = load("res://Recheios/quadrado_chocolate_amargo.tscn")
			2:
				match saborIndex:
					1:
						recheio_scene = load("res://Recheios/circulo_bolo.tscn")
					2:
						recheio_scene = load("res://Recheios/circulo_chocolate.tscn")
					3:
						recheio_scene = load("res://Recheios/circulo_baunilha.tscn")
					4:
						recheio_scene = load("res://Recheios/circulo_morango.tscn")
					5:
						recheio_scene = load("res://Recheios/circulo_chocolate_amargo.tscn")
			3:
				match saborIndex:
					1:
						recheio_scene = load("res://Recheios/coracao_bolo.tscn")
					2:
						recheio_scene = load("res://Recheios/coracao_chocolate.tscn")
					3:
						recheio_scene = load("res://Recheios/coracao_baunilha.tscn")
					4:
						recheio_scene = load("res://Recheios/coracao_morango.tscn")
					5:
						recheio_scene = load("res://Recheios/coracao_chocolate_amargo.tscn")
						
		Globals.sabor_scene = recheio_scene
		var recheio = recheio_scene.instantiate()

		recheio.global_position = $"../RecheioSpawn".position
		recheio.scale.y = 0.6
		recheioNode.add_child(recheio)
	

func _on_forma_1_pressed():
	formaIndex = 1
	Globals.forma = 1
	forma_scene = load("res://Formas/forma_quadrada.tscn")


	forma_spawn()


func _on_forma_2_pressed():
	formaIndex = 2
	Globals.forma = 2
	forma_scene = load("res://Formas/forma_redonda.tscn")
	print(formaExiste)

	forma_spawn()
	
func _on_forma_3_pressed():
	formaIndex = 3
	Globals.forma = 3
	forma_scene = load("res://Formas/forma_coraçao.tscn")
	print(formaExiste)
	
	forma_spawn()

	

func _on_sabor_1_pressed():
	saborIndex = 1
	Globals.sabor = 1
	#Globals.saborMaterial = load("res://materials/sabor0.tres")
	loadRecheio(1)
	recheioExiste = true
	

func _on_sabor_2_pressed():
	saborIndex = 2
	Globals.sabor = 2
	#Globals.saborMaterial = load("res://materials/sabor1.tres")
	loadRecheio(2)
	recheioExiste = true
	

func _on_sabor_3_pressed():
	saborIndex = 3
	Globals.sabor = 3
	loadRecheio(3)
	recheioExiste = true


func _on_sabor_4_pressed():
	saborIndex = 4
	Globals.sabor = 4
	loadRecheio(4)
	recheioExiste = true

func _on_sabor_5_pressed():
	saborIndex = 5
	Globals.sabor = 5
	loadRecheio(5)
	recheioExiste = true


func _on_bolo_final_pressed():
	if formaExiste && recheioExiste:
		get_tree().change_scene_to_file("res://cenas/ColocarCobertura.tscn")


# 1: baunilha
# 2: bolo
# 3: chocolate
# 4: chocolate amargo
# 5: morango



