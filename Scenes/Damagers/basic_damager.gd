extends "damager.gd"

func setup():
	$RightPunch.connect("body_entered", self, "_on_Area_body_entered")
	$LeftPunch.connect("body_entered", self, "_on_Area_body_entered")
