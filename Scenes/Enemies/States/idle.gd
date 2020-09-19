extends "../../../Scripts/StateMachine/state.gd"

var control
func _ready():
	control = get_owner();

func enter():
	control.idle()
	
func exit():
	pass
	
# Go to Follow if near target
func update(delta):
	if control.near_target():
		return "Follow"
	
func input_handler(event):
	pass
	

