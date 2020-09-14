extends Spatial

var velocity: Vector3
var angular_acceleration = 10

func attack_towards():
	if $Model is ProjectileCostume:
		$Model.attack(velocity)

func _physics_process(delta):
	rotation.y = lerp_angle(rotation.y, atan2(-velocity.x, -velocity.z), delta * angular_acceleration)
	
func set_direction(val):
	velocity = val
