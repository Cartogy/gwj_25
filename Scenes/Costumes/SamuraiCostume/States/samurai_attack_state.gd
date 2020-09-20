extends "../../../../Scripts/StateMachine/state.gd"


var costume : Costume
var anim_tree : AnimationTree
var anim_fsm : AnimationNodeStateMachinePlayback

var next_attack 
var first_punch : bool

func _ready():
	costume = get_parent().get_parent()
	anim_tree = costume.get_node("AnimationTree")
	anim_fsm = anim_tree.get("parameters/StateMachine/playback")
	anim_fsm.start("idle")




func enter():
	anim_tree.set("parameters/Attacking/blend_amount", 1)
	next_attack = $StateMachine/Attack0
	attack()
	
func exit():
	# Deactivate attacking blend
	anim_tree.set("parameters/Attacking/blend_amount", 0)
	$StateMachine.change_state("Idle")
	print("Leaving Attack in Costume")
	
	
func update(delta):
	# Upon attacking
	pass
	
func input_handler(event):
	pass
	
# Transition between various attack states
func attack():
	if next_attack == $StateMachine/Attack1:
			anim_fsm.travel("Attack1")
			next_attack = $StateMachine/Attack0
	elif next_attack == $StateMachine/Attack0:
		anim_fsm.travel("Attack0")
		next_attack = $StateMachine/Attack1

func get_anim_tree() -> AnimationTree:
	return anim_tree
