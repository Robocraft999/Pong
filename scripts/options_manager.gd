extends Node2D

var enable_screen_shake = true

	
func getSceneManager() -> SceneManager:
	return get_node("/root/root/SceneManager")
