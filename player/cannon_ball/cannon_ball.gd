extends Area2D
class_name CannonBall

#You can use this signal to alert other nodes that the bullet hit something
signal hit_something  

var speed =750
@export var health = 3
func _physics_process(delta: float):  
	position += transform.x * speed * delta




func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:
		print("enemy hit")
		body.queue_free()
	if body is Boss:
		body.hit()
