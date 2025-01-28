class_name Boss


extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -400.0
var direction = 1
@export var health = 3

func _physics_process(delta: float) -> void:
	velocity.y = direction * SPEED


	move_and_slide()


func hit() -> void:
	health -= 1
	if health == 0:
		queue_free()
