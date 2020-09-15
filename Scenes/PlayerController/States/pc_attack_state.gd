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
	player.to_idle()
	
func update(delta):
	if $Timer.is_stopped():
		player.to_idle()
		return "Idle"
	
func input_handler(event):
	if event.is_action_pressed("attack"):
		controller.acquire_attack_direction()
		attack()
	
func attack():
	$Timer.start()	# reset
	player.attack(controller.attack_direction)
	player.get_node("CostumeInterface").set_direction(controller.attack_direction)
	
