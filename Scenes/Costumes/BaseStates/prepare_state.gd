extends "../../../../Scripts/StateMachine/state.gd"

var costume : Costume
var anim_tree : AnimationTree

# Determines whether to transition to Attack state upon completion
var finish = false

func _ready():
	costume = get_parent().get_parent()
	anim_tree = costume.get_node("AnimationTree")

func enter():
	print("In prepare")
	
func exit():
	print("Leaving Prepare")
	anim_tree.set("parameters/Preparing/blend_amount", 0)
	
func update(delta):
	var blend = anim_tree.get("parameters/Preparing/blend_amount")
	var new_blend = lerp(blend, 1.0, 0.12)
	
	anim_tree.set("parameters/Preparing/blend_amount", new_blend)
	
	if new_blend >= 0.95 && finish:
		print("Going to Attack")
		return "Attacking"
	
func input_handler(event):
	pass
	
