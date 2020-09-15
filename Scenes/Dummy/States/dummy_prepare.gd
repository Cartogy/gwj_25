extends "../../../../Scripts/StateMachine/state.gd"
var animation_tree

# Determines wheter to transition to Attack or not
var finish = false

func _ready():
	animation_tree = get_owner().get_parent().get_node("AnimationTree")

func enter():
	animation_tree.set("parameters/Prepare/blend_amount", 1)
	
func exit():
	pass
		
	
func update(delta):
	var blend = animation_tree.get("parameters/Prepare/blend_amount")
	print(blend)
	var new_blend = lerp(blend, 1.0, 0.1)
	animation_tree.set("parameters/Prepare/blend_amount", new_blend)
	
	if finish:
		
		if animation_tree.get("parameters/Prepare/blend_amount") >= 1:
			return "Attack"
		
	
	
func input_handler(event):
	pass
	

