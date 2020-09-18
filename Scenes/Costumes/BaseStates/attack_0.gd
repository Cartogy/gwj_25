extends "../../../../Scripts/StateMachine/state.gd"

var anim_tree : AnimationTree


# transition to Intermediary or not
var transition : bool

func _ready():
	print(anim_tree)
	transition = false

func enter():
	print("In Attack 0")
	
	if anim_tree == null:
		anim_tree = get_parent().get_parent().get_parent().get_parent().get_node("AnimationTree")
	
func exit():
	print("LEaving Attack 0")
	
func update(delta):
	var blend = anim_tree.get("parameters/Attack_Stance/blend_amount")
	var new_blend = lerp(blend, -1.0, 0.2)
	
	anim_tree.set("parameters/Attack_Stance/blend_amount", new_blend)
	if transition && new_blend <= -0.95:
		return "Intermediary"
	
func input_handler(event):
	pass
	
