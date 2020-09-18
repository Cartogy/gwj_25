extends "../../../../Scripts/StateMachine/state.gd"

var costume : Costume
var anim_tree : AnimationTree

# Determines whether to transition to Attack state upon completion
var finish = false

func _ready():
	costume = get_parent().get_parent()
	anim_tree = costume.get_node("AnimationTree")

func enter():
	anim_tree.set("parameters/Preparing/blend_amount", 1)
	
func exit():
	pass
	
func update(delta):
	var blend = anim_tree.get("parameters/Preparing/blend_amount")
	var new_blend = lerp(blend, 1.0, 0.02)
	
	anim_tree.set("parameters/Preparing/blend_amount", new_blend)
	
	if new_blend >= 1.0 && finish:
		return "Attacking"
	
func input_handler(event):
	pass
	
