extends "../../../Scripts/StateMachine/state.gd"

var control

func _ready():
	control = get_owner();

func enter():
	control.stunned()
	$Timer.start()
	
func exit():
	pass
	
func update(delta):
	if $Timer.is_stopped():
		return "Follow"
	
func input_handler(event):
	pass
	
