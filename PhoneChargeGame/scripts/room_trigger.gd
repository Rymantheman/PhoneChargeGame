extends Area2D

var entered: bool = false
@export_file("*.tscn") var next_scene_path: String
var player: CharacterBody2D
@export var new_player_pos: Vector2

func _ready():
	player = get_parent().get_parent().get_node("Player") # TODO: How to make this better
	print("Player:" + str(player))
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: CharacterBody2D) -> void:
	entered = true
	print("entered")
	# Instantiate new room scene
	var new_scene = load(next_scene_path)
	get_parent().get_parent().add_child(new_scene.instantiate())
	# Free old room scene
	get_parent().get_parent().get_node(""+get_parent().name).queue_free() # TODO: Make less janky
	
	player.global_position = new_player_pos # Set position to where player will start in next room
	print(player.global_position)
	
func _on_body_exited(body: CharacterBody2D) -> void:
	entered = false
