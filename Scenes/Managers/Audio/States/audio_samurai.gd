extends "../../../../Scripts/StateMachine/state.gd"

var music

func _ready():
	pass # Replace with function body.

func enter():
	get_owner().play(music)
	#other stuff
	
func exit():
	get_owner().stop(music)
	
func update(delta):
	pass
	
func input_handler(event):
	pass
	
