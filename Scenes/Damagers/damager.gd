extends Spatial

class_name Damager
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$RightPunch.connect("body_entered", self, "_on_Area_body_entered")
	$LeftPunch.connect("body_entered", self, "_on_Area_body_entered")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	print("Hit")
	var owner = body.get_owner()
	print(owner.get_class())
	if owner.get_type() == "TargetableEntity":
		print("[Targetable it is]")
		owner.hit(-2)
	pass # Replace with function body.


func _on_Area_body_exited(body):
	pass # Replace with function body.
