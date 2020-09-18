extends "../../../../Scripts/StateMachine/state.gd"

var costume : Costume

func _ready():
	costume = get_parent().get_parent()

func enter():
	costume.deactivate_effect_area()
	
func exit():
	pass
	
func update(delta):
	pass
	
func input_handler(event):
	pass
	


