extends Control

onready var controls = $VBoxContainer as VBoxContainer
onready var start_button = $VBoxContainer/StartButton as Button
onready var controls_button = $VBoxContainer/ControlsButton as Button
onready var quit_button = $VBoxContainer/QuitButton as Button

func _unhandled_input(event):
	if event.is_action_pressed("ui_down") or event.is_action_pressed("ui_up"):
		enable_focus()
		start_button.grab_focus()

func disable_focus():
	start_button.set_focus_mode(FOCUS_NONE)
	controls_button.set_focus_mode(FOCUS_NONE)
	quit_button.set_focus_mode(FOCUS_NONE)	

func enable_focus():
	start_button.set_focus_mode(FOCUS_ALL)
	controls_button.set_focus_mode(FOCUS_ALL)
	quit_button.set_focus_mode(FOCUS_ALL)	

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scene/Main.tscn")


func _on_OptionsButton_pressed():
	pass # Replace with function body.


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_VBoxContainer_mouse_entered():
	disable_focus()
