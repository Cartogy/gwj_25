extends "../../../../Scripts/StateMachine/state.gd"


var anim_tree : AnimationTree

# transition to Intermediary or not
var transition : bool

func _ready():
	anim_tree = get_parent().get_parent().get_parent().get_parent().get_node("AnimationTree")

func enter():
	if anim_tree == null:
		anim_tree = get_parent().get_parent().get_parent().get_parent().get_node("AnimationTree")
