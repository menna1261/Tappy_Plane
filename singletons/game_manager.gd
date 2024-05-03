extends Node


const GROUP_PLAYER : String = "player"
const GAME : PackedScene= preload("res://Scenes/Game/game.tscn")
const MAIN : PackedScene= preload("res://Scenes/Game/main.tscn")


func load_game_scene() -> void :
	get_tree().change_scene_to_packed(GAME)
	
	
func load_main_scene() -> void :
	get_tree().change_scene_to_packed(MAIN)	

