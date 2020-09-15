extends "../../../../Scripts/StateMachine/state.gd"
var animation_tree

func _ready():
	animation_tree = get_owner().get_parent().get_node("AnimationTree")

func enter():
	$Timer.start()
	
func exit():
	animation_tree.set("parameters/Attack To Inter/blend_amount", 0)
	animation_tree.set("parameters/Attack Transition/blend_amount", 0)
	$Timer.stop()
	
func update(delta):
	if $Timer.is_stopped():
		return "Idle"
	var new_blend = lerp(animation_tree.get("parameters/Attack To Inter/blend_amount"), 1, 0.2)
	animation_tree.set("parameters/Attack To Inter/blend_amount", new_blend)
	
	
	
func input_handler(event):
	pass
	

