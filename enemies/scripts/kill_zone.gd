extends Area2D





func _on_body_entered(body: Node2D) -> void:
	if body is Enemy or Boss:
		body.queue_free()
