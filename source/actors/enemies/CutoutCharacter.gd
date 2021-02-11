extends Node2D

var look_direction = 1 setget set_look_direction

func set_look_direction(value):
	if sign(value) == 0:
		return
	look_direction = sign(value)
	scale.x = abs(scale.x) * look_direction


func play(animation):
	if $AnimationPlayer.has_animation(animation):
		$AnimationPlayer.play(animation)


func play_backwards(animation):
	if $AnimationPlayer.has_animation(animation):
		$AnimationPlayer.play_backwards(animation)
