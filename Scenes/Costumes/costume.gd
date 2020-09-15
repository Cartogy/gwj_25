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
	$StateMachine.change_state("Attack")
	
func to_idle():
	$StateMachine.change_state("Idle")

