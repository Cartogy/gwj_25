extends Spatial


export (String) var item_id

func _on_Area_body_entered(body):
	print("Someone entered")
	if body is Player:
		body.is_near_item(item_id, get_type())


func _on_Area_body_exited(body):
	if body is Player:
		body.is_away_from_item()

# Overidden by derived classes
func get_type():
	pass
