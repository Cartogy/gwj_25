extends "../../../../Scripts/StateMachine/state.gd"

var anim_tree : AnimationTree
var attack_finish : bool

var awaiting_transition : bool

func _ready():
	anim_tree = get_parent().get_parent().get_parent().get_parent().get_node("AnimationTree")

func enter():
	attack_finish = false
	awaiting_transition = false
	
func exit():
	$Timer.stop()
	awaiting_transition = false
	print("Leaving INtermediary")
	
func update(delta):
	if awaiting_transition:
		if $Timer.is_stopped():
			attack_finish = true
	else:
		var blend = anim_tree.get("parameters/Attack_Stance/blend_amount")
		var new_blend = lerp(blend, 0.0, 0.1)
		anim_tree.set("parameters/Attack_Stance/blend_amount", new_blend)
		
		if new_blend >= -0.01 && new_blend <=0.01:
			$Timer.start()
			awaiting_transition = true
	
	
	
func input_handler(event):
	pass
	
		
