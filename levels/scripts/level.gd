extends Node
@onready var panel: Panel = $Panel
@onready var label: Label = $Panel/Label
@onready var animation_player: AnimationPlayer = $Panel/AnimationPlayer

func _ready() -> void:
	panel.visible = true
	animation_player.play("playing_text")
