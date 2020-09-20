extends "../../../../Scripts/StateMachine/state.gd"

var enemies_node : Node
export (float) var energy


func _ready():
	pass # Replace with function body.

func enter():
	var world: Environment = get_owner().get_node("WorldEnvironment").environment
	print(world.set("background_energy", energy))
	print("Done")
	#spawn_enemies()
	#other stuff
	
func exit():
	pass
	#remove_enemies()
	
func update(delta):
	pass
	
func input_handler(event):
	pass
	
func spawn_enemies():
	get_owner().add_child(enemies_node)
	
func remove_enemies():
	get_owner().remove_child(enemies_node)
