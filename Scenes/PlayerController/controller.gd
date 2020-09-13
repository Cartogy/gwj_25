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
	else:
		speed = 0
	
	$Player/Mesh.rotation.y = lerp_angle($Player/Mesh.rotation.y, atan2(-velocity.x, -velocity.z), delta * angular_acceleration)
	
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
