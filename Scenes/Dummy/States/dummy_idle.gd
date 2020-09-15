extends "../../../../Scripts/StateMachine/state.gd"

var animation_tree : AnimationTree

func _ready():
	animation_tree = get_owner().get_parent().get_node("AnimationTree")
	print(get_owner().name)

func enter():
	print("Idle")
	animation_tree.set("parameters/Arms n Legs", 0.5)
	animation_tree.set("parameters/Arms/blend_amount", 0)
	animation_tree.set("parameters/Legs/blend_amount", 0)
	animation_tree.set("parameters/Prepare/blend_amount", 0)
	animation_tree.set("parameters/Attack Transition", 0)
	
	get_owner().get_parent().moving = false
	
func exit():
	pass
	
func update(delta):
	pass
	
func input_handler():
	pass
	

