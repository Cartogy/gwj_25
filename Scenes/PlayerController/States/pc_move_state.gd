extends "../../../Scripts/StateMachine/state.gd"

var controller
var player : Player

func _ready():
	controller = get_parent().get_parent()
	player = controller.get_node("Player")

func enter():
	pass
	
func exit():
	print("Leaving Moving")
	
func update(delta):
	if controller.velocity.length() == 0:
		return "Idle"
	player.rotate_towards(controller.velocity)
	player.move_and_slide(-controller.velocity * controller.speed, Vector3.UP)
	player.move()
	
func input_handler(event):
	pass
	
