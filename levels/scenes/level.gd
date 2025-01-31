extends Node2D

@onready var tutorial_song: AudioStreamPlayer2D = $tutorial_song
@onready var game_start: AudioStreamPlayer2D = $game_start
@onready var game_music: AudioStreamPlayer2D = $game_music
@onready var panel: Panel = $Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_tutorial_song_finished() -> void:
	var npcs = get_tree().get_nodes_in_group("NPC")
	for npc_group_node: Sprite2D in npcs:
		npc_group_node.start_the_process()
	panel.game_start()
	game_start.play()


func _on_game_start_finished() -> void:
	game_music.play()


func _on_game_music_finished() -> void:
	game_music.play()
