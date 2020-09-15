extends Node

var current_state
var all_states = {}

# states to transition to once a state ends
var state_queues = []

export (NodePath) var START_STATE

func _ready():
	for child in get_children():
		all_states[child.NAME] = child
	initialize(START_STATE)
	
func _input(event):
	current_state.input_handler(event)

func tick(delta):
	var next_state = current_state.update(delta)
	if next_state != null:
		change_state(next_state)

func initialize(start_state):
	current_state = all_states[get_node(start_state).NAME]
	current_state.enter()
	
func change_state(state):
	current_state.exit()
	current_state = all_states[state]
	current_state.enter()

func add_to_queue(state):
	state_queues.append(state)
	
func pop_queue():
	var next_state = state_queues.pop_front()
	return next_state
