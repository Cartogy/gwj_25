extends Spatial

class_name Costume

var moving: bool

func _ready():
	pass
	
func _physics_process(delta):
	$StateMachine.tick(delta)	
	
func prepare_attack():
	$StateMachine.change_state("Prepare")
	
func attack():
	if $StateMachine.current_state.NAME == "Attacking":
		$StateMachine/Attacking.attack()
	elif $StateMachine.current_state.NAME == "Prepare":
		$StateMachine/Prepare.finish = true
	elif $StateMachine.current_state.NAME != "Prepare":
		$StateMachine/Prepare.finish = true
		$StateMachine.change_state("Prepare")
	
func to_idle():
	$StateMachine.change_state("Idle")
	moving = false
	
func move():
	if moving == false:
		$StateMachine.change_state("Movement")

func deactivate_effect_area():
	$EffectArea.set_physics_process(false)
	$EffectArea.set_process(false)
	$EffectArea.set_process_input(false)
	
func activate_effect_area():
	$EffectArea.set_physics_process(true)
	$EffectArea.set_process(true)
	$EffectArea.set_process_input(true)
