extends Panel
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var label: Label = $Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("tutorial")

func game_start() -> void:
	animation_player.play("playing_text")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	animation_player.reset_on_save
