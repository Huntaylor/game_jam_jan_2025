extends Label
class_name HUD_label


var score : int = 0

#func _ready():
	#cannon_ball.enemy_hit.connect(_on_enemy_hit)
	
func _on_enemy_hit():
	score += 10
	text = str("Score: ", score)
	
func big_on_hit():
	score += 100
	text = str("Score: ", score)
 
