extends Button
class_name SettingsButton

enum VolumeState {ON = 0, HALF = -10, OFF = -100}

@export var state: VolumeState
@export_enum("Master", "Music", "SFX") var bus_name: String

var bus_index: int = 0

func _ready() -> void:
	get_bus_name_by_index()
	get_state()
	set_display_text()

func _on_pressed() -> void:
	set_display_text()

func set_display_text() -> void:
	var volume: float
	
	match state:
		VolumeState.ON:
			volume = 100
		VolumeState.HALF:
			volume = 50
		VolumeState.OFF:
			volume = 0
	print(volume)
	var percent = ' ' + str(volume) + '%'
	self.text = str(bus_name) + percent
	

func get_bus_name_by_index() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)


func set_audio_num_label_text() -> void:
	var percent = str(state) + '%'
	self.text = str(bus_name) + percent
	print(state)

func get_state() -> void:
	var data = AudioServer.get_bus_volume_db(bus_index)
	if data == 0 or data == 6:
		state = VolumeState.ON
	elif data == -10:
		state = VolumeState.HALF
	elif data == -100:
		state = VolumeState.OFF


func on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	set_audio_num_label_text()
