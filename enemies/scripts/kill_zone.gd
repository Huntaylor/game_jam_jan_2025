extends Area2D
class_name Kill_zone





func _on_body_entered(body: Node2D) -> void:
	var hel : Health = get_tree().get_first_node_in_group("Health")
	
	if body is Enemy or Boss:
		body.queue_free()
		hel.on_hit()
