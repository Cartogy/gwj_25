extends Node

var viewport : Viewport
var camera : Camera
var world : World

var current_entity : TargetableEntity = null

func _ready():
	var controller = get_parent()
	viewport = controller.get_viewport()
	world = controller.get_world()
	camera = controller.get_node("Player").get_node("Camera")

func _process(delta):
	if is_instance_valid(current_entity) == false:
		current_entity = null
	entity_hovering(hit_collision_dictionary())

# Gathers the collision from the point of the mouse
func hit_collision_dictionary():
	var ray_origin = camera.project_ray_origin(viewport.get_mouse_position())
	var ray_direction = camera.project_ray_normal(viewport.get_mouse_position())
	
	# Cast a ray
	var from = ray_origin
	var to = ray_origin + ray_direction * 5000.0
	var space_state = world.get_direct_space_state()
	var hit = space_state.intersect_ray(from, to)
	return hit
	
# Changes entity based on the current entity being hovered
func entity_hovering(hit):
	if hit.size() != 0:
		
		var entity = hit.collider.get_owner()
		if entity.has_method("get_type"):
			if entity.get_type() == "TargetableEntity":
				entity = entity as TargetableEntity
				if entity != current_entity:
					if current_entity != null:
						current_entity.deactivate_hover_effect()
					entity.activate_hover_effect()
					current_entity = entity
	else:	# Not hovering
		if is_instance_valid(current_entity) == false:
			current_entity = null
		elif current_entity != null:
			current_entity.deactivate_hover_effect()
			current_entity = null

func get_current_entity():
	
	if is_instance_valid(current_entity):
		print(current_entity.name)
		return current_entity
		
	else:
		return null
