extends Node2D

@onready var enemy = load("res://enemies/scenes/enemy.tscn")
@onready var hard = load("res://enemies/scenes/boss.tscn")
var boss = 0

func _on_timer_timeout() -> void:
	var ene = enemy.instantiate()
	ene.position = Vector2(randf_range(5, 635), 0)
	get_parent().get_node("EnemyHandler").add_child(ene)
	
	boss += 1
	print(boss)
	
	if boss == 10:
		var bos = hard.instantiate()
		bos.position = Vector2(randf_range(0, 250), 0)
		get_parent().get_node("EnemyHandler").add_child(bos)
		boss = 0
