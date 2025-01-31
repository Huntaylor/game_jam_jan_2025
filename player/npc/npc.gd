extends Sprite2D
const NPC_READY = preload("res://player/npc/assets/npc_ready.png")
const NPC_SCARED = preload("res://player/npc/assets/npc_scared.png")
const NPC_RUNNING = preload("res://player/npc/assets/npc_running.png")
@onready var timed_bravery: Timer = $TimedBravery
@onready var shaking_timer: Timer = $ShakingTimer
@onready var run_timer: Timer = $RunTimer
@onready var deletion: Timer = $Deletion

var shouldMove := false
var hasShook := false
var speed = 250
var currentPosition:Vector2

func _ready() -> void:
	texture = NPC_READY
	currentPosition = position
	
func start_the_process() -> void:
	timed_bravery.start()

func get_scared() -> void:
	shaking_timer.start()
	run_timer.start()
	visible = !visible
	texture = NPC_SCARED

func run_away() -> void:
	texture = NPC_RUNNING
	rotation = deg_to_rad(90)
	shouldMove = true
	
	
func _physics_process(delta: float) -> void:
	if shouldMove:
		position.x += delta * speed


func _on_timed_bravery_timeout() -> void:
		get_scared()


func _on_shaking_timer_timeout() -> void:
	if hasShook:
		position.x = currentPosition.x - 1
		hasShook = false
	else:
		position.x = currentPosition.x + 1
		hasShook = true

func _on_run_timer_timeout() -> void:
	deletion.start()
	shaking_timer.stop()
	run_away()


func _on_deletion_timeout() -> void:
	queue_free()
