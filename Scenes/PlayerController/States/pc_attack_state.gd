extends "../../../Scripts/StateMachine/state.gd"

var controller
var player : Player

func _ready():
	controller = get_parent().get_parent()
	player = controller.get_node("Player")

func enter():
	print("IN Attack")
	$Timer.start()
	controller.velocity = Vector3.ZERO
	player.stop_moving()
	attack()
	
	
func exit():
	pass
	
func update(delta):
	if $Timer.is_stopped():
		return "Idle"
	
func input_handler(event):
	if event.is_action_pressed("attack"):
		controller.acquire_attack_direction(controller.get_node("EntityAcquisition").entity_hovered)
		attack()
	
func attack():
	$Timer.start()	# reset
	player.attack(controller.attack_direction)
	player.rotate_towards(controller.attack_direction)
	
