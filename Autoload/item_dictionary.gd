extends Node

export (Dictionary) var costume_items
export (Dictionary) var consumable_items

func get_costume_item(id):

	return costume_items.get(id)
	
func get_consumable_item(id):
	return consumable_items[id]
