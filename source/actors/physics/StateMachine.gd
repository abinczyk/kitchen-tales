extends Node
"""
Description:
	Transits between States preventing multiple States from being
	active at the same time
"""

signal state_changed(new_state)
signal direction_changed(new_direction)

var direction = Vector2.RIGHT setget set_direction

onready var _current_state = get_child(0)
onready var _previous_state = _current_state

var current_state_name = ""
var previous_state_name = ""

func _ready():
	_initialize()


func _initialize():
	previous_state_name = _previous_state.name
	current_state_name = _current_state.name
	_current_state.active = true


func change_state_to(new_state_name):
	if not has_node(new_state_name + "State"):
		return
	var new_state = get_node(new_state_name + "State")
	if new_state.name == _current_state.name:
		return
	_previous_state = _current_state
	_current_state = new_state
	previous_state_name = _previous_state.name
	current_state_name = _current_state.name
	_previous_state.active = false
	_current_state.active = true
	emit_signal("state_changed", new_state_name)


func set_direction(new_direction):
	direction = new_direction
	emit_signal("direction_changed", direction)
	for state in get_children():
		state.set_direction(direction)


func execute(command_name):
	_current_state.execute(command_name)


func cancel(command_name):
	_current_state.cancel(command_name)
