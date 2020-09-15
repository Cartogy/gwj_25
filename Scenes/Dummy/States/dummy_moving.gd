extends "../../../../Scripts/StateMachine/state.gd"
var animation_tree

func _ready():
	animation_tree = get_owner().get_node("AnimationTree")

func enter():
	get_owner().moving = true
	print("Moving")
	
func exit():
	pass
	
func update(delta):
	var leg_blend = animation_tree.get("parameters/Legs/blend_amount")
	var arm_blend = animation_tree.get("parameters/Arms/blend_amount")
	
	if leg_blend < 1:
		var new_leg_blend = lerp(leg_blend, 1, 0.2)
		animation_tree.set("parameters/Legs/blend_amount", new_leg_blend)
	if arm_blend < 1:
		var new_arm_blend = lerp(arm_blend, 1, 0.2)
		animation_tree.set("parameters/Arms/blend_amount", new_arm_blend)
	
	
func input_handler():
	pass
	

