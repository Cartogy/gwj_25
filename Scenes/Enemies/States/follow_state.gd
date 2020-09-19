extends "../../../Scripts/StateMachine/state.gd"

var control

func _ready():
	control = get_owner();

func enter():
	control.move()
	
func exit():
	pass
	
# Don't stop following
func update(delta):
	if control.can_attack():
		return "Attack"
		
	control.follow()
	
	
func input_handler(event):
	pass
	
