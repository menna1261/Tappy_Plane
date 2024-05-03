extends Node2D

@onready var pipe_holder = $pipeHolder
const PIPES = preload("res://Scenes/Game/pipes.tscn")
@onready var spawn_u = $spawnU
@onready var spawn_u_2 = $spawnU2
@onready var spawn_timer = $SpawnTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_plane_died.connect(_on_plane_died)
	ScoreManager.set_score(0)
	randomize()
	spawn_pipes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_pipes():
	var new_scene = PIPES.instantiate()
	# randomize the highet of the pipes 
	var y_pos = randf_range(spawn_u.position.y ,spawn_u_2.position.y )
	# set the initial position of the newely created pipe
	new_scene.position = Vector2(spawn_u.position.x , y_pos)
	pipe_holder.add_child(new_scene)

func stop_pipes():
	spawn_timer.stop()
	for pipe in pipe_holder.get_children():
		pipe.set_process(false)	

# this function will be emitted every 1.2 seconds
func _on_spawn_timer_timeout():
	spawn_pipes()
		 
func _on_plane_died():
	stop_pipes()
