extends Control

signal unpause
signal exit

func _input(_event):
	if Input.is_action_just_pressed("pause"):
		print("input from menu")
		unpause.emit()
		get_viewport().set_input_as_handled()


func _on_resume_pressed():
	unpause.emit()


func _on_menu_pressed():
	exit.emit()
