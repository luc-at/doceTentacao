extends Node

var level: int = 0
var forma: int = 0 #1 quadrado 2 redondo 3 coracao
var sabor: int = 0 #
var cor: int = 0
var decorType: int = 0
var pontos: int = 0


var levelAvai1: int = 0 #0 é bom 1 é regular 2 é ruim
var levelAvai2: int = 0
var levelAvai3: int = 0
var levelAvai4: int = 0





#1 azul
#2 branco
#3 lilás
#4 preto
#5 rosa
#6 vermelho
func _process(delta):
	#print(level)
	pass


var decor1: int = 0
var decor2: int = 0
var decor3: int = 0
var decor4: int = 0
var decor5: int = 0

var sabor_scene: PackedScene
var cor_scene: PackedScene

func hit(decorType):

	match decorType:
		1:
			decor1 += 1
		2:
			decor2 += 1
		3:
			decor3 += 1
		4:
			decor4 += 1
		5:
			decor5 += 1

func reset():
	forma = 0 #1 quadrado 2 redondo 3 coracao
	sabor = 0 
	cor= 0
	decorType = 0
	
	decor1 = 0
	decor2 = 0
	decor3 = 0
	decor4 = 0
	decor5 = 0
	
			
	
