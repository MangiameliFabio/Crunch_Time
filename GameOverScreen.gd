extends Control

onready var controls = $VBoxContainer as VBoxContainer
onready var restart_button = $VBoxContainer/RestartButton as Button
onready var back_button = $VBoxContainer/BackToMenuButton as Button
onready var quit_button = $VBoxContainer/QuitButton as Button

func _unhandled_input(event):
	if event.is_action_pressed("ui_down") or event.is_action_pressed("ui_up"):
		enable_focus()
		restart_button.grab_focus()

func disable_focus():
	restart_button.set_focus_mode(FOCUS_NONE)
	back_button.set_focus_mode(FOCUS_NONE)
	quit_button.set_focus_mode(FOCUS_NONE)	

func enable_focus():
	restart_button.set_focus_mode(FOCUS_ALL)
	back_button.set_focus_mode(FOCUS_ALL)
	quit_button.set_focus_mode(FOCUS_ALL)

func _on_RestartButton_pressed():
	WorldManager.reset_game()
	get_tree().change_scene("res://Scene/Main.tscn")
	WorldManager.game_started = true


func _on_BackToMenuButton_pressed():
	WorldManager.reset_game()
	get_tree().change_scene("res://Scene/MainMenu.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_VBoxContainer_mouse_entered():
	disable_focus()
