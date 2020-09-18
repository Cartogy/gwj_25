extends Spatial

var velocity: Vector3
var angular_acceleration = 10



func _physics_process(delta):
	rotation.y = lerp_angle(rotation.y, atan2(-velocity.x, -velocity.z), delta * angular_acceleration)
	
func set_direction(val):
	velocity = val
	
func move():
	
	$Costume.move()
	
func to_idle():
	$Costume.to_idle()
	
func attack(direction):
	$Costume.attack()
