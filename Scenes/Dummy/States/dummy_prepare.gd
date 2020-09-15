extends "../../../../Scripts/StateMachine/state.gd"
var animation_tree

func _ready():
	animation_tree = get_owner().get_parent().get_node("AnimationTree")

func enter():
	animation_tree.set("properties/Prepare/blend_amount", 1)
	
func exit():
	pass
	
func update(delta):
	pass
	
func input_handler(event):
	pass
	

