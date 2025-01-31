extends Label
class_name Health
var life : int = 10

func _on_ready():
	text = str("Life: ", life)

func on_hit():
	life -= 1
	text = str("Life: ", life)
	if life == 0:
		get_tree().change_scene_to_file("res://ui/main_menu.tscn")
