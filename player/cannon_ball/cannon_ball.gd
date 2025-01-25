extends Area2D
class_name CannonBall

#You can use this signal to alert other nodes that the bullet hit something
signal hit_something  

var speed =750

func _physics_process(delta: float):  
	position += transform.x * speed * delta
