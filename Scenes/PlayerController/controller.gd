extends Spatial

var velocity = Vector3.FORWARD
var angular_acceleration = 10
var speed = 0

func _input(event):
	if event.is_action_pressed("pick_item"):
		apply_item()

func _physics_process(delta):
	
	if (Input.is_action_pressed("forward")
		|| Input.is_action_pressed("backward")
		|| Input.is_action_pressed("right")
		|| Input.is_action_pressed("left")):
			speed = 2
			velocity = Vector3(Input.get_action_strength("right") - Input.get_action_strength("left"),
			0,
			Input.get_action_strength("backward") - Input.get_action_strength("forward"))
			velocity = convert_coordinates($Player/Camera.rotation.y, velocity)
	else:
		speed = 0
	
	#$Player/CostumeInterface.rotation.y = lerp_angle($Player/CostumeInterface.rotation.y, atan2(-velocity.x, -velocity.z), delta * angular_acceleration)
	$Player/CostumeInterface.set_direction(velocity)
	
	$Player.move_and_slide(-velocity * speed, Vector3.UP)
	
func convert_direction(dir: Vector3) -> Vector3:
	return Vector3.ZERO
	
# Temporary Hack
func apply_item():
	if near_item():
		if $Player/ItemListener.item_type == "CostumeItem":
			$Player.apply_costume()
		elif $Player/ItemListener.item_type == "ConsumableItem":
			$Player.apply_consumable_item()
	
func near_item() -> bool:
	return $Player/ItemListener.near_item

func convert_coordinates(cam_angle, dir: Vector3):
	
	# Percentage to full rotating
	var x_amount = -sin(cam_angle)    # Go along the Up axis
	var z_amount = cos(cam_angle)     # Go along the Side Axis
	# Values always going to be between -1, 1
	var x = x_amount * dir.z
	var z = z_amount * dir.x
	
	x = to_unit(x)
	z = to_unit(z)
	
	# Idea is to swap the direction based on the angle of the camera
	var velocity = Vector3(x, 0, z)
	return velocity.normalized()

# Maintain a value of either 0, -1, 1
func to_unit(x):
	if x == 0:
		return 0
	elif x < 0:
		return -1
	else:
		return 1
