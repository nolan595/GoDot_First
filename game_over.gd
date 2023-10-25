extends Control

func _process(delta):
	$MarginContainer/HBoxContainer/VBoxContainer/Label.text = "Score: %s" % Game.Gold

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
