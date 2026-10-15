extends CharacterBody2D

@onready var animSprite: AnimatedSprite2D = $Sprite
const SPEED = 5.0

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO # Movement vector
	
	if Input.is_action_pressed("right"):
		velocity.x += 1
		animSprite.flip_h = false
		animSprite.play("walk")
		
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		animSprite.flip_h = true
		animSprite.play("walk")
				
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		animSprite.play("forward_walk")
		
	if Input.is_action_pressed("down"):
		velocity.y += 1
		animSprite.play("backward_walk")
		
	if (velocity.x == 0) and (velocity.y == 0):
		animSprite.stop()
		
	velocity = velocity.normalized() * SPEED
	move_and_collide(velocity)
	
