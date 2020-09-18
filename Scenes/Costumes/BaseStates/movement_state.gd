extends "../../../../Scripts/StateMachine/state.gd"

var costume : Costume
var anim_tree : AnimationTree

func _ready():
	costume = get_parent().get_parent()
	anim_tree = costume.get_node("AnimationTree")

func enter():
	print("Entering Movement in Costume")
	costume.moving = true
	anim_tree.set("parameters/Movement/blend_amount", 1.0)
	
func exit():
	costume.moving = false
	anim_tree.set("parameters/Movement/blend_amount", 0.0)
	
func update(delta):
	pass
	
func input_handler(event):
	pass
	
