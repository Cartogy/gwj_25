extends "../../../../Scripts/StateMachine/state.gd"

var costume : Costume
var anim_tree : AnimationTree

func _ready():
	costume = get_parent().get_parent()
	anim_tree = costume.get_node("AnimationTree")

func enter():
	costume.deactivate_effect_area()
	costume.moving = false
	
	anim_tree.set("parameters/Movement/blend_amount", 0)
	anim_tree.set("parameters/Preparing/blend_amount", 0)
	anim_tree.set("parameters/Attack_Stance/blend_amount", 0)
	anim_tree.set("parameters/Attacking/blend_amount", 0)
	
func exit():
	pass
	
func update(delta):
	if costume.moving:
		return "Moving"
	
func input_handler(event):
	pass
	
