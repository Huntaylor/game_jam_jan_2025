extends Control

@onready var confirmation_dialog: ConfirmationDialog = $ConfirmationDialog
var target = load("res://ui/assets/curser_larger_1.png")

@onready var music_button: SettingsButton = $VBoxContainer/music_button
@onready var sfx_button: SettingsButton = $VBoxContainer/sfx_button

@onready var sfx: AudioStreamPlayer2D = $SFX
@onready var music: AudioStreamPlayer2D = $Music


func _ready() -> void:
	confirmation_dialog.visible = false
	change_cursor_color( Color.WHITE)

func change_cursor_color( border_color : Color) -> void:
	var tex : CompressedTexture2D = target
	var image : Image = tex.get_image() 

	# Get the dimensions of the image
	var width = image.get_width()
	var height = image.get_height()

	# Loop through every pixel
	for x in range(width):
		for y in range(height):
			var color_on_pixel = image.get_pixel(x, y)
			if color_on_pixel == Color.BLACK: # if pixel is black, set its color to border color
				image.set_pixel(x, y, border_color)


	var texture = ImageTexture.create_from_image(image) 

	Input.set_custom_mouse_cursor(texture, 0, Vector2(32, 32))


func _on_start_button_pressed() -> void:
	sfx.play()
	get_tree().change_scene_to_file("res://levels/test_scenes/game_test.tscn")


func _on_exit_button_pressed() -> void:
	sfx.play()
	confirmation_dialog.visible = true


func _on_confirmation_dialog_confirmed() -> void:
	get_tree().quit()

func _on_confirmation_dialog_canceled() -> void:
	sfx.play()
	confirmation_dialog.visible = false

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


func _on_music_finished() -> void:
	music.play()
