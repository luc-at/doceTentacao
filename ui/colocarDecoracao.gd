extends Control

var decor_scene: PackedScene
var decorSelec: bool = false

func _ready():

	var sabor = Globals.sabor_scene
	var cobertura = Globals.cor_scene
	#var sabor = load("res://Recheios/coracao_baunilha.tscn")
	#var cobertura = load("res://Coberturas/coracao_azul.tscn")
	var hitbox: PackedScene
	
	match Globals.forma:
		1:
			hitbox = load("res://Recheios/quadradoHitbox.tscn")
		2:
			hitbox = load("res://Recheios/circuloHitbox.tscn")
		3:
			hitbox = load("res://Recheios/coracaoHitbox.tscn")
		
	
	
	var boloModelo = sabor.instantiate()
	var coberturaModelo = cobertura.instantiate()
	var hitboxModelo = hitbox.instantiate()
	

	
	boloModelo.global_position = $"../BoloSpawn".position
	$"../Recheios".add_child(boloModelo)
	
	coberturaModelo.global_position = $"../RecbeioSpawn".position
	$"../Cobertura".add_child(coberturaModelo)
	
	hitboxModelo.global_position =  $"../BoloSpawn".position
	$"../Recheios".add_child(hitboxModelo)
	hitboxModelo.add_to_group("hitbox")
	
	
	
func _physics_process(delta):

	var decorIndex = Globals.decorType
	#print(decorIndex,decorSelec)
	
	
	if Input.is_action_just_pressed("left_click") && decorSelec == true:
		match decorIndex:
			1:
				decor_scene = load("res://decor/cereja2.tscn")
			2:
				decor_scene = load("res://decor/chantilly.tscn")
			3:
				decor_scene = load("res://decor/coracao.tscn")
			4:
				decor_scene = load("res://decor/frango.tscn")
			5:
				decor_scene = load("res://decor/aranha2.tscn")
			
			
		var decor = decor_scene.instantiate()
	
		var pos: Vector3 =  $"../Camera_002/DecorSpawn".global_position
		
		var mouseX = get_viewport().get_mouse_position()[0]
		var mouseY = get_viewport().get_mouse_position()[1]
		
		pos[0] = pos[0] + remap(mouseX,0,1280,-0.5,0.5)
		pos[1] = pos[1] + remap(mouseY,0,720,0.8,-0.5)

		
		decor.position = pos
		$"../Decor".add_child(decor)
		


func _on_decor_1_pressed():
	Globals.decorType = 1
	decorSelec = true


func _on_decor_2_pressed():
	Globals.decorType = 2
	decorSelec = true

func _on_decor_3_pressed():
	Globals.decorType = 3
	decorSelec = true


func _on_decor_4_pressed():
	Globals.decorType = 4
	decorSelec = true


func _on_decor_5_pressed():
	Globals.decorType = 5
	decorSelec = true
	
# 1 cereja
# 2 chantily
# 3 coracao
# 4 frango
# 5 aranha


func _on_final_bolo_pressed():
	#print(Globals.forma, Globals.cor, Globals.sabor)
	if Globals.level == 1:
		var pontuacao = aval(1)
		
		if pontuacao >= 25:
			Globals.levelAvai1 = 0
		elif pontuacao <= 5:
			Globals.levelAvai1 = 2
		else:
			Globals.levelAvai1 = 1
			
		print(pontuacao)
		print(Globals.levelAvai1)
		
		#Globals.levelAvai1 = 0
		get_tree().change_scene_to_file("res://cenas/Isabela/feedbacks/feedback_cookie.tscn")
		
	if Globals.level == 2:
		var pontuacao = aval(2)
		
		if pontuacao >= 25:
			Globals.levelAvai2 = 0
		elif pontuacao <= 5:
			Globals.levelAvai2 = 2
		else:
			Globals.levelAvai2 = 1
			
		print(pontuacao)
		print(Globals.levelAvai2)
		
		#Globals.levelAvai1 = 0
		get_tree().change_scene_to_file("res://cenas/Isabela/feedbacks/feedback_cherry.tscn")
		
	if Globals.level == 3:
		var pontuacao = aval(3)
		
		if pontuacao >= 25:
			Globals.levelAvai3 = 0
		elif pontuacao <= 5:
			Globals.levelAvai3 = 2
		else:
			Globals.levelAvai3 = 1
			
		print(pontuacao)
		print(Globals.levelAvai3)
		
		#Globals.levelAvai1 = 0
		get_tree().change_scene_to_file("res://cenas/Isabela/feedbacks/feedback_wirdo.tscn")
		
	if Globals.level == 4:
		var pontuacao = aval(4)
		
		if pontuacao >= 25:
			Globals.levelAvai4 = 0
		elif pontuacao <= 5:
			Globals.levelAvai4 = 2
		else:
			Globals.levelAvai4 = 1
			
		print(pontuacao)
		print(Globals.levelAvai4)
		
		#Globals.levelAvai1 = 0
		get_tree().change_scene_to_file("res://cenas/Isabela/feedbacks/feedback_namorado.tscn")


		
func aval(num):
	match num:
		1:
			var pontos = 0
			
			if Globals.forma == 1 || Globals.forma == 2:
				pontos += 5
				
			if Globals.sabor == 5 or Globals.sabor == 2:
				pontos += 10
			elif Globals.sabor == 1:
				pontos -= 5
				
			if Globals.cor == 1 or Globals.cor == 2 or Globals.cor == 6:
				pontos += 10
			elif Globals.cor == 4:
				pontos -= 10
				
			if Globals.decor4 > 3:
				pontos += 10
			if Globals.decor5 > 1:
				pontos -= 10
				
			return pontos
			
		2:
			var pontos = 0
			
			if Globals.forma == 3:
				pontos += 5
				
			if Globals.sabor == 3 or Globals.sabor == 4:
				pontos += 10
			elif Globals.sabor == 1:
				pontos -= 5
				
			if Globals.cor == 5 or Globals.cor == 6:
				pontos += 10
			elif Globals.cor == 4:
				pontos -= 10
				
			if Globals.decor1 > 3 or Globals.decor3 > 3:
				pontos += 10
			if Globals.decor5 > 1:
				pontos -= 10
				
			return pontos
			
		3:
			var pontos = 0
			
			if Globals.forma == 2:
				pontos += 5
				
			if Globals.sabor == 5:
				pontos += 10
			elif Globals.sabor == 1:
				pontos -= 5
				
			if Globals.cor == 4 or Globals.cor == 6:
				pontos += 10
			elif Globals.cor == 2:
				pontos -= 10
				
			if Globals.decor3 > 3:
				pontos += 10
			if Globals.decor1 > 1:
				pontos -= 10
				
			return pontos
			
		4:
			var pontos = 0
			
			if Globals.forma == 1:
				pontos += 5
				
			if Globals.sabor == 1:
				pontos += 10
			
				
			if Globals.cor == 2:
				pontos += 10
			elif Globals.cor == 4:
				pontos -= 10
				
			if Globals.decor2 > 3:
				pontos += 10
			if Globals.decor5 > 1:
				pontos -= 10
				
			return pontos
			
			
				
				
			
				
		
