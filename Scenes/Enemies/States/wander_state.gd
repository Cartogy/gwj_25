extends "../../../Scripts/StateMachine/state.gd"

var waypoints = []
var control

var min_distance = 2.0
var current_waypoint

func _ready():
	control = get_owner();

func enter():
	pass
	
func exit():
	pass
	
# Go to Follow if near target
func update(delta):
	if control.near_target():
		return "Follow"
		
	move_around()
	
func input_handler(event):
	pass
	
func calculate_waypoint(origin: Vector3) -> Vector3:
	return Vector3.ZERO;
	
func move_around():
	pass
