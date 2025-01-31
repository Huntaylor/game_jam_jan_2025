extends Area2D
class_name CannonBall


#You can use this signal to alert other nodes that the bullet hit something
var speed =750
@export var health = 3
func _physics_process(delta: float):  
	position += transform.x * speed * delta




func _on_body_entered(body: Node2D) -> void:
	var main : HUD = get_tree().get_first_node_in_group("in_game_HUD")
	
	if body is Enemy:
		body.queue_free()
		main._on_enemy_hit()
	if body is Boss:
		body.hit()
		#if body.health == 0:
			#main.big_on_hit()

	
