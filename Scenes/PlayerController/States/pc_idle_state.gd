extends "../../../Scripts/StateMachine/state.gd"

var controller
var player : Player

func _ready():
	controller = get_parent().get_parent()
	player = controller.get_node("Player")

func enter():
	player.stop_moving()
	player.to_idle()
	
func exit():
	pass
	
func update(delta):
	if controller.velocity.length() != 0:
		return "Move"
	
func input_handler(event):
	pass
	
