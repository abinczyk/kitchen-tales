extends "res://actors/physics/State.gd"

func _on_command_started(command):
	match command:
		"Show":
			state_machine.change_state_to("Stand")


func _on_command_finished(command):
	pass
