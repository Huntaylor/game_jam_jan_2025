class_name HUD
extends Control


@onready var health: Label = $ProgressBar/Health
@onready var scoring: Label = $Score
@onready var paused: Label = $V_pause/Paused
@onready var v_Game: VBoxContainer = $V_game_over
@onready var game_over: Label = $V_game_over/Game_Over
@onready var number: Label = $V_game_over/Number
@onready var v_pause: VBoxContainer = $V_pause
@onready var exit: Button = $V_pause/Exit
@onready var play: Button = $V_pause/Play
@onready var pause: Button = $Pause
@onready var H_bar: ProgressBar = $ProgressBar
@onready var sfx_button: SettingsButton = $V_pause/sfx_button
@onready var music_button: SettingsButton = $V_pause/music_button
@onready var sfx: AudioStreamPlayer2D = $SFX


var life : int = 10
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scoring.text = str("Score: ", score)
	paused.hide()
	v_Game.show()
	game_over.hide()
	number.hide()
	v_pause.hide()
	H_bar.value = life


func on_hit():
	life -= 1
	H_bar.value = life
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
	sfx.play()
	v_pause.hide()
	paused.hide()
	get_tree().paused = false

func _on_pause_toggled(toggled_on: bool) -> void:
	sfx.play()
	if toggled_on == true:
		paused.show()
		v_pause.show()
		get_tree().paused = true
	if toggled_on == false:
		paused.hide()
		v_pause.hide()
		get_tree().paused = false
		


func _on_exit_pressed() -> void:
	sfx.play()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
	


func _on_music_button_pressed() -> void:
	sfx.play()
	on_settings_changed(music_button)


func _on_sfx_button_pressed() -> void:
	sfx.play()
	on_settings_changed(sfx_button)

func on_settings_changed(button: SettingsButton) -> void:
	var newVolume := button.state
	
	match button.state:
		button.VolumeState.OFF:
			button.state = button.VolumeState.ON
		button.VolumeState.HALF:
			button.state = button.VolumeState.OFF
		button.VolumeState.ON:
			button.state = button.VolumeState.HALF
	
	newVolume = button.state
	if button.bus_name == "SFX" and button.state == button.VolumeState.ON :
		newVolume = 6
	print(newVolume)
	
	AudioServer.set_bus_volume_db(button.bus_index, newVolume)
