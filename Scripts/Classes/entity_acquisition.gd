extends Node

var viewport : Viewport
var camera : Camera
var world : World

var entity_hovered

func _ready():
	var controller = get_parent()
	viewport = controller.get_viewport()
	world = controller.get_world()
	camera = controller.get_node("Player").get_node("Camera")

func _process(delta):
	if entity_hovered != null:
		print(entity_hovered)
	entity_hovered = entity_hover()

func entity_hover():
	var ray_origin = camera.project_ray_origin(viewport.get_mouse_position())
	var ray_direction = camera.project_ray_normal(viewport.get_mouse_position())
	
	# Cast a ray
	var from = ray_origin
	var to = ray_origin + ray_direction * 5000.0
	var space_state = world.get_direct_space_state()
	var hit = space_state.intersect_ray(from, to)
	if hit.size() != 0:
		var entity = hit.collider.get_owner()
		print(entity.name)
		if entity.has_method("get_type"):
			if entity.get_type() == "TargetableEntity":
				print("Is targetable")
				return entity
	else:
		return null
