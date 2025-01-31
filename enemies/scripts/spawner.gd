extends Node2D

@onready var spawner_timer: Timer = $spawner_timer
@onready var speed_timer: Timer = $speed_timer
@onready var tutorial_timer: Timer = $TutorialTimer
@onready var boost_timer: Timer = $BoostTimer


@onready var enemy = load("res://enemies/scenes/enemy.tscn")
@onready var hard = load("res://enemies/scenes/boss.tscn")

var base_speed = 50
var SPEED = 20
var wave = 0
var isTutorial := true

func _on_timer_timeout() -> void:
	var ene = enemy.instantiate()
	ene.position = Vector2(randf_range(5, 635), 0)
	ene.SPEED = SPEED
	owner.add_child(ene)
	
	

func _on_speed_timer_timeout() -> void:
	SPEED += (base_speed/25)
	
	if !isTutorial:
		var time = spawner_timer.wait_time - 0.01
		spawner_timer.set_wait_time(time)


func _on_tutorial_timer_timeout() -> void:
	spawner_timer.set_wait_time(0.02)
	boost_timer.start()

func _on_boost_timer_timeout() -> void:
	spawner_timer.set_wait_time(1)
