extends Control

@onready var confirmation_dialog: ConfirmationDialog = $ConfirmationDialog


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/test_scenes/player_movement_level.tscn")

func _on_options_button_pressed() -> void:
	pass # Replace with function body.


func _on_exit_button_pressed() -> void:
	confirmation_dialog.visible = true


func _on_confirmation_dialog_confirmed() -> void:
	get_tree().quit()


func _on_confirmation_dialog_canceled() -> void:
	confirmation_dialog.visible = false
