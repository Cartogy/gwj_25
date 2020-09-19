extends "../../../../Scripts/StateMachine/state.gd"

export (String, FILE, "*.wav") var music_path
var music

func _ready():
	music = load(music_path)

func enter():
	get_owner().play(music)
	#other stuff
	
func exit():
	get_owner().stop(music)
	
func update(delta):
	pass
	
func input_handler(event):
	pass
	
