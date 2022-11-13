extends Control


onready var back_button = $BackButton as Button

func _ready():
	back_button.grab_focus()


func _on_BackButton_pressed():
	get_tree().change_scene("res://Scene/MainMenu.tscn")
