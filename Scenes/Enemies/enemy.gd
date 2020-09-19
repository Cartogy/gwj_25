extends KinematicBody

class_name Enemy

# For now it can be anything, but specifically Player
var target : Spatial
var speed
var min_distance = 5

var health



func _ready():
	speed = 5

func _physics_process(delta):
	$StateMachine.tick(delta)

func near_target() -> bool:
	if target != null:
		var distance = (target.translation - translation).length()
		if distance <= min_distance:
			return true
	return false
		
func can_attack():
	# Acquire distance information
	var min_attack_distance = $Model.get_attack_distance()
	var distance = (target.translation - translation).length()
	
	# Check if attack is possible
	if distance <= min_attack_distance:
		return true
	else:
		return false

func move():
	$Model.move()
	
func idle():
	$Model.idle()
	
func attack():
	$Model.attack()
	
func stunned():
	$Model.stunned()

# Targetable Methods
func update_health(val):
	health += val
	
func on_destroyed():
	queue_free()

func hit(val):
	update_health(val)
	if health <= 0:
		queue_free()
	else:
		$StateMachine.change_state("Stunned")

func follow(delta):
	var direction = target.translation - translation
	var dir_n = direction.normalized()
	
	move_and_slide(dir_n * speed * delta, Vector3.UP)
