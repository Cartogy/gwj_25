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
	if $StateMachine.current_state.NAME != "Prepare":
		$StateMachine/Prepare.finish = true
		$StateMachine.change_state("Prepare")
	elif $StateMachine.current_state.NAME == "Intermediary":
		$StateMachine.change_state("Attack")
	elif $StateMachine.current_state.NAME == "Prepare":
		$StateMachine/Prepare.finish = true
	
func to_idle():
	$StateMachine.change_state("Idle")
	moving = false
	
func move():
	if moving == false:
		$StateMachine.change_state("Moving")

