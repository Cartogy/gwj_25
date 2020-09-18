extends "../../../../Scripts/StateMachine/state.gd"

export (Array) var enemies



func _ready():
	pass # Replace with function body.

func enter():
	spawn_enemies()
	
func exit():
	remove_enemies()
	
func update(delta):
	pass
	
func input_handler(event):
	pass
	
func spawn_enemies():
	pass
	
func remove_enemies():
	pass
