extends Control

@onready var score = $MarginContainer/score

# Called when the node enters the scene tree for the first time.
func _ready():
	# it means : connect to this function when that signal is emitted
	SignalManager.on_score_updated.connect(on_score_updated)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#score.text = str(ScoreManager.get_score())
	pass

func on_score_updated():
	score.text = str(ScoreManager.get_score())
