extends TextureButton


export (String, FILE, "*.tscn") var next_scene
func ready():
	self.connect("pressed", self, "transition")
	
func transition():
	print("transition")
	get_tree().change_scene(next_scene)


func _on_Start_pressed():
	transition()
