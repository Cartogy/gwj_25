extends "../../../../Scripts/StateMachine/state.gd"

var costume : Costume
var anim_tree : AnimationTree

var next_attack 
var first_punch : bool

# Manages the states of the Attacking blend animations

func _ready():
	costume = get_parent().get_parent()
	anim_tree = costume.get_node("AnimationTree")

func enter():
	next_attack = $StateMachine/Attack1
	anim_tree.set("parameters/Attack_Stance/blend_amount", -1.0)
	$StateMachine/Attack0.transition = false	# Only for first punch
	first_punch = true
	
func exit():
	# Deactivate attacking blend
	anim_tree.set("parameters/Attacking/blend_amount", 0)
	$StateMachine.change_state("Idle")
	$StateMachine/Attack0.transition = false
	print("Leaving Attack in Costume")
	
	
func update(delta):
	# Upon attacking
	if first_punch:
		var blend = anim_tree.get("parameters/Attacking/blend_amount")
		var new_blend = lerp(blend, 1.0, 0.16)
		anim_tree.set("parameters/Attacking/blend_amount", new_blend)
		if new_blend >= 0.95:
			print("First Punch finished")
			first_punch = false
			$StateMachine/Attack0.transition = true
			if $StateMachine.current_state != $StateMachine/Attack0:
				$StateMachine.change_state("Attack0")
	# Propogate State of Intermediary
	elif $StateMachine.current_state == $StateMachine/Intermediary:
		if $StateMachine.current_state.attack_finish:
			return "Idle"
	$StateMachine.tick(delta)
	
func input_handler(event):
	pass
	
# Transition between various attack states
func attack():
	if $StateMachine.current_state == $StateMachine/Intermediary:
		if next_attack == $StateMachine/Attack1:
			$StateMachine.change_state("Attack1")
			next_attack = $StateMachine/Attack0
		elif next_attack == $StateMachine/Attack0:
			$StateMachine.change_state("Attack0")
			next_attack = $StateMachine/Attack1

func get_anim_tree() -> AnimationTree:
	return anim_tree
