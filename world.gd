extends Node2D

func _process(delta):
	$UI/LabelTimer.text = "%s" % roundf($Timer.time_left)
		
	
func _on_area_2d_body_entered(body):
	if body.name == "NewPlayer":
		get_tree().change_scene_to_file("res://game_over.tscn")
		Utils.resetGame()



func _on_timer_timeout():
	get_tree().change_scene_to_file("res://game_over.tscn")
	Utils.resetGame()
	
	
		
func reload_scene():
	get_tree().reload_current_scene()
	
