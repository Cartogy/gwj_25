extends Spatial

class_name TargetableEntity
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var health
var material : Material

# Called when the node enters the scene tree for the first time.
func _ready():
	get_child(0).material = get_child(0).material.duplicate()	# 
	var material = get_child(0).material
	print(get_child(0).get_class())
	material.set_shader_param("fresnel_color_intensity", 0);

func get_health():
	return health

func update_health(val):
	health += val
	print("Health decreased")
	if health <= 0:
		on_destroyed()
#	pass

func get_type():
	return "TargetableEntity"

func activate_hover_effect():
	var material = get_child(0).material
	material.set_shader_param("fresnel_color_intensity", 3);
	
func deactivate_hover_effect():
	var material = get_child(0).material
	material.set_shader_param("fresnel_color_intensity", 0);

func on_destroyed():
	pass
