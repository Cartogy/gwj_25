extends "../../../Scripts/StateMachine/state.gd"

var controller
var player : Player

func _ready():
	controller = get_parent().get_parent()
	player = controller.get_node("Player")

func enter():
	controller.velocity = Vector3.ZERO
	player.stop_moving()
	attack()
	
	
func exit():
	pass
	
func update(delta):
	pass
	
func input_handler(event):
	if event.is_action_pressed("attack"):
		controller.acquire_attack_direction()
		attack()
	
func attack():
	player.attack(controller.attack_direction)
	player.get_node("CostumeInterface").set_direction(controller.attack_direction)
