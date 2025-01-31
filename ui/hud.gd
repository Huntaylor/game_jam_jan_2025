class_name HUD
extends Control


@onready var health: Label = $Health
@onready var scoring: Label = $Score
@onready var paused: Label = $V_pause/Paused
@onready var v_Game: VBoxContainer = $V_game_over
@onready var game_over: Label = $V_game_over/Game_Over
@onready var number: Label = $V_game_over/Number
@onready var v_pause: VBoxContainer = $V_pause
@onready var exit: Button = $V_pause/Exit
@onready var play: Button = $V_pause/Play
@onready var pause: Button = $Pause


var life : int = 1
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health.text = str("Life: ", life)
	scoring.text = str("Score: ", score)
	paused.hide()
	v_Game.show()
	game_over.hide()
	number.hide()
	v_pause.hide()



func on_hit():
	life -= 1
	health.text = str("Life: ", life)
	if life == 0:
		v_Game.show()
		game_over.show()
		number.show()
		v_pause.show()
		play.hide()
		pause.hide()
		number.text = str("Score: ", score)
		get_tree().paused = true
		
		
func _on_enemy_hit():
	score += 10
	scoring.text = str("Score: ", score)
	


func _on_play_pressed() -> void:
	v_pause.hide()
	paused.hide()
	get_tree().paused = false

func _on_pause_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		paused.show()
		v_pause.show()
		get_tree().paused = true
	if toggled_on == false:
		paused.hide()
		v_pause.hide()
		get_tree().paused = false
		


func _on_exit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
	
