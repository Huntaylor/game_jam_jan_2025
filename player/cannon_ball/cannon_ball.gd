extends Area2D
class_name CannonBall


#You can use this signal to alert other nodes that the bullet hit something
signal enemy_hit  
var speed =750
@export var health = 3
func _physics_process(delta: float):  
	position += transform.x * speed * delta


func _on_body_entered(body: Node2D) -> void:
	var hud : HUD_label = get_tree().get_first_node_in_group("in_game_HUD")
	
	if body is Enemy:
		print("enemy hit")
		body.queue_free()
		enemy_hit.emit()
		hud._on_enemy_hit()
	if body is Boss:
		body.hit()
		if body.health == 0:
			hud.big_on_hit()

	
