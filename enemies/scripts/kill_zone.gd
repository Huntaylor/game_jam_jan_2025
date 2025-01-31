extends Area2D
class_name Kill_zone





func _on_body_entered(body: Node2D) -> void:
	var hel : HUD = get_tree().get_first_node_in_group("in_game_HUD")
	
	if body is Enemy or Boss:
		body.queue_free()
		hel.on_hit()
