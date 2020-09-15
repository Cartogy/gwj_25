extends "../../../../Scripts/StateMachine/state.gd"

var animation_tree
func _ready():
	animation_tree = get_owner().get_parent().get_node("AnimationTree")

func enter():
	animation_tree.set("parameters/Arms/blend_amount", 0)
	animation_tree.set("parameters/Legs/blend_amount", 0)
	print("Attack")
	#animation_tree.set("parameters/Attack Transition/blend_amount", 1)
	
func exit():
	pass
	
func update(delta):
	if animation_tree.get("parameters/Attack Transition/blend_amount") >= 0.90:
		print("Going to Inter")
		return "Intermediary"
	
	# Interpolate blend value
	var new_blend = lerp(animation_tree.get("parameters/Attack Transition/blend_amount"), 1.0, 0.02)
	animation_tree.set("parameters/Attack Transition/blend_amount", new_blend)
	
	
	
func input_handler():
	pass
	

