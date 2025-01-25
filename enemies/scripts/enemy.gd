class_name Enemy

extends CharacterBody2D

@onready var projectile = load("res://enemies/scenes/projectile.tscn")

var SPEED = randf_range(50, 250)
const JUMP_VELOCITY = -400.0
var direction = 1
@export var x_val = randf_range(-1, 0)


func left_side() -> void:
	print("He's touching me!!!!!")
	x_val = 1
	print(x_val)
	velocity.x = x_val * SPEED

func _physics_process(delta: float) -> void:

	velocity.y = direction * SPEED
	
	move_and_slide()
	


func _on_timer_timeout() -> void:
	var movement = randf_range(0, 100)
	var sides = randf_range(-1, 1)
	if movement >= 75:
		velocity.x = sides * SPEED
	else:
		velocity.x = 0
	

	
