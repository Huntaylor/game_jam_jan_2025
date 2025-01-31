extends Node2D

@onready var spawner_timer: Timer = $spawner_timer
@onready var speed_timer: Timer = $speed_timer


@onready var enemy = load("res://enemies/scenes/enemy.tscn")
@onready var hard = load("res://enemies/scenes/boss.tscn")


#var boss = 0
var SPEED = 50
var wave = 0

func _on_timer_timeout() -> void:
	var ene = enemy.instantiate()
	ene.position = Vector2(randf_range(5, 635), 0)
	ene.SPEED = SPEED
	get_parent().get_node("EnemyHandler").add_child(ene)
	
	wave += 1
	
	#boss += 1
	#print(boss)
	
#	this code here makes the bosses appear every ten rounds
	
		#var bos = hard.instantiate()
		#bos.position = Vector2(randf_range(0, 250), 0)
		#get_parent().get_node("EnemyHandler").add_child(bos)
		#boss = 0
	if wave == 40:
		spawner_timer.set_wait_time(0.4)


func _on_speed_timer_timeout() -> void:
	SPEED += (SPEED/25)
