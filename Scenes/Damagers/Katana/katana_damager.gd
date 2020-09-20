extends "../damager.gd"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func setup():
		$Katana/Area.connect("body_entered", self, "_on_Area_body_entered")
