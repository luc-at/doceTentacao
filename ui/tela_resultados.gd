extends Control

var level = Globals.level
var forma = Globals.forma
var cor = Globals.cor
var sabor = Globals.cor

var decor1 = Globals.decor1
var decor2 = Globals.decor2
var decor3 = Globals.decor3
var decor4 = Globals.decor4
var decor5 = Globals.decor5


var pont: int = 0

func _ready():

	match level:
		1:
			avalia(1)
			

func avalia(lv):
	pont = 0
	if lv == 1:  
		pont += decor1 * 8
		pont += (decor2 + decor3 + decor4 + decor5) * -1
		print(pont)
		if forma == 1 && cor == 1 && sabor == 1 && pont > 30:
			Globals.levelAvai1 = 0
			get_tree().change_scene_to_file("res://cenas/Isabela/feedbacks/feedback_cookie.tscn")
		else:
			Globals.levelAvai1 = 2
			
			


	#$pontos.text = str(pont)

	
