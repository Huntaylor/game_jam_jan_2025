class_name Boss


extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -400.0
var direction = 1

func _physics_process(delta: float) -> void:
	velocity.y = direction * SPEED


	move_and_slide()
