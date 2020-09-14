extends Spatial

export (int) var base_damage
var current_damage : int

func _ready():
	current_damage = base_damage
	
func reset_damage():
	current_damage = base_damage
	
func update_damage(val: int):
	current_damage += val



