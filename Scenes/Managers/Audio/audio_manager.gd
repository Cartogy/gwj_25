extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func change_music(state):
	print("Change MUsic")
	print(state)
	$StateMachine.change_state(state)

func play(music):
	$Music.stream = music
	$Music.play()
	
func stop(music):
	$Music.stop()