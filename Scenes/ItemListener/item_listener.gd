extends Node

var near_item: bool

var current_item_id: String
var item_type

func is_near(id: String, type):
	near_item = true
	current_item_id = id
	item_type = type
	
func is_away():
	reset()

func reset():
	near_item = false
	current_item_id = ""
	item_type = null
