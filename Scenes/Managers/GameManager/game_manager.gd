extends Node


func ready():
	pass
	
func costume_change(costume):
	$StateMachine.change_state(costume)
