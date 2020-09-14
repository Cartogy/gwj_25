extends Spatial

class_name Player

export (int) var max_health

func _ready():
	$Stats/CurrentStats.health = get_max_health()

func attack():
	pass


# -- Duck-tape methods for Targetable entities --
func hit():
	pass

func on_destroyed():
	pass
	
# -- --
	
func get_max_health() -> int:
	return $Stats.get_max_health()

# Change Player Data
func apply_consumable_item():
	var item_data = ItemDB.get_consumable_item($ItemListener.current_item_id)
	$Stats/CurrentStats.update_health(item_data.health)
	
func apply_costume():
	var costume_data = ItemDB.get_costume_item($ItemListener.current_item_id)
	$Stats/BonusStats.update_health(costume_data.health)
	change_costume(costume_data.model)
	
func change_costume(model):
	$CostumeInterface.remove_child($CostumeInterface/Model)
	var new_model = load(model)
	$CostumeInterface.add_child(new_model.instance())


# Item Listener functions
func is_near_item(id: String, t):
	$ItemListener.is_near(id, t)
	
func is_away_from_item():
	$ItemListener.is_away()

func clear_item():
	$ItemListener.reset()
