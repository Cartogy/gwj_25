extends "../../../../Scripts/StateMachine/state.gd"

var enemies_node : Node



func _ready():
	pass # Replace with function body.

func enter():
	spawn_enemies()
	#other stuff
	
func exit():
	remove_enemies()
	
func update(delta):
	pass
	
func input_handler(event):
	pass
	
func spawn_enemies():
	get_owner().add_child(enemies_node)
	
func remove_enemies():
	get_owner().remove_child(enemies_node)
