extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var samurai_unit_node
var basic_unit_node

# Called when the node enters the scene tree for the first time.
func _ready():
	samurai_unit_node = get_node("SamuraiUnits")
	basic_unit_node = get_node("BasicUnits")

func change_state(costume):
	$StateMachine.change_state(costume)
	AudioManager.change_music(costume)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
