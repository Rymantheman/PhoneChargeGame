extends Area2D

var entered: bool = false

func _on_body_entered(body: Node2D) -> void:
	entered = true
	


func _on_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
