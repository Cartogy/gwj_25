extends "../costume.gd"


func _ready():
	pass
	
func prepare_attack():
	$StateMachine.change_state("Prepare")
	
func attack():
	if $StateMachine.current_state.NAME == "Prepare":
		if $StateMachine.current_state.is_complete == false:
			$StateMachine.current_state.complete_state()
	elif $StateMachine.current_state.NAME == "Attack":
		$StateMachine.current_state.next_attack()
	else:
		$StateMachine.add_to_queue("Attack")
		$StateMachine.change_state("Prepare")
	
func to_idle():
	$StateMachine.change_state("Idle")
