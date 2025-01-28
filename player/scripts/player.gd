extends Node
@onready var marker_2d: Marker2D = $Marker2D
@onready var sprite_2d: Sprite2D = $Marker2D/CharacterBody2D/Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var cpu_particles_2d: CPUParticles2D = $Marker2D/CPUParticles2D
@onready var margin_container: MarginContainer = $MarginContainer

@onready var cannon_ball = load("res://player/cannon_ball/cannon_ball.tscn")

@export var isReloading:bool = false
@export var speed_scale:float = 1.0

func _ready() -> void:
	margin_container.visible = false
	animation_player.speed_scale = speed_scale
	cpu_particles_2d.speed_scale = speed_scale
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var camera = get_viewport().get_camera_2d()
		marker_2d.rotate(marker_2d.get_angle_to(camera.get_global_mouse_position()))
	elif Input.is_action_just_pressed("Cannon Fire") and event.is_pressed():
		if !isReloading:
			isReloading = true
			animation_player.play('reloading')
			shoot(event)
		else:
			print('RELOADING!')

func shoot(event:InputEventMouseButton) -> void:
	cpu_particles_2d.emitting = true
	var newBall = cannon_ball.instantiate()
	owner.add_child(newBall)
	newBall.transform = marker_2d.global_transform
	newBall.z_index = self.z_index -1
