extends "../../../../Scripts/StateMachine/state.gd"


var anim_tree : AnimationTree


# transition to Intermediary or not
var transition : bool

func _ready():
	transition = false

func enter():
	print("In Attack 0")
	
	if anim_tree == null:
		anim_tree = get_parent().get_parent().get_parent().get_parent().get_node("AnimationTree")
