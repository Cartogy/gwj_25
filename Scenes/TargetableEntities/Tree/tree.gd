extends "../../../Scripts/Classes/targetable.gd"




# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Duck-Typed functions
func hit(val):
	print("I am dying!")
	update_health(val)
	
func on_destroyed():
	queue_free()
