class_name Enemy

extends CharacterBody2D

@onready var projectile = load("res://enemies/scenes/projectile.tscn")

var SPEED = randf_range(50, 250)
var direction = 1
var x_val = randf_range(-1, 1)


func left_side() -> void:
	print("He's touching me!!!!!")
	x_val = x_val * -1
	print(x_val)
	velocity.x = x_val * SPEED

func _physics_process(delta: float) -> void:

	velocity.y = direction * SPEED
	
	move_and_slide()
	


func _on_timer_timeout() -> void:
	var movement = randf_range(0, 100)

	if movement >= 75:
		velocity.x = x_val * SPEED
	else:
		velocity.x = 0
	

	
