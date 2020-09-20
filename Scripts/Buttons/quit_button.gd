extends Node



func ready():
	self.connect("pressed", self, "quit")
	
func transition():
	get_tree().quit()


func _on_Quit_pressed():
	transition()
