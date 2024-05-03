extends Control

@onready var audio_stream_player = $AudioStreamPlayer
@onready var timer = $Timer
@onready var laugh_point = $"Laugh-point"
@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	
	hide()
	SignalManager.on_plane_died.connect(on_plane_died)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible == true and Input.is_action_just_pressed("fly") == true :
		GameManager.load_main_scene()

func run_sequence():
	#laugh_point.hide()
	$"Laugh-point".visible = not $"Laugh-point".visible
	label.show()
	
func on_plane_died():
	show()
	label.hide()
	audio_stream_player.play()
	timer.start()


func _on_timer_timeout():
	run_sequence() # Replace with function body.
