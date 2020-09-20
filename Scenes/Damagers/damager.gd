extends Spatial

class_name Damager
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	setup()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func setup():
	pass

func _on_Area_body_entered(body):
	print("Hit")
	var owner = body.get_owner()
	if owner.get_class() != "Player":
		if owner.get_type() == "TargetableEntity":
			print("[Targetable it is]")
			owner.hit(-2)


func _on_Area_body_exited(body):
	pass # Replace with function body.
