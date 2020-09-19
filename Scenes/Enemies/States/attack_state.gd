extends "../../../Scripts/StateMachine/state.gd"

var control

func _ready():
	control = get_owner();

func enter():
	control.attack()
	
func exit():
	pass
	
func update(delta):
	pass
	
func input_handler(event):
	pass
	
