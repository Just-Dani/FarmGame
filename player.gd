extends CharacterBody2D

# Speed of the character
@export var speed: float = 200.0
@onready var sprite_2d = $Sprite2D

func _physics_process(delta):
	# Reset velocity
	velocity = Vector2.ZERO
	var is_moving = false
	# Capture movement input
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		sprite_2d.play("walkright")
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		sprite_2d.play("walkleft")
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		sprite_2d.play("walkdown")
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		sprite_2d.play("walkup")

	# Normalize velocity to maintain consistent speed in all directions
	if velocity != Vector2.ZERO: # If moving
		velocity = velocity.normalized() * speed
	else: # Not moving
		if Input.is_action_just_released("ui_right"):
			sprite_2d.play("idleright")
		if Input.is_action_just_released("ui_left"):
			sprite_2d.play("idleleft")
		if Input.is_action_just_released("ui_up"):
			sprite_2d.play("idleup")
		if Input.is_action_just_released("ui_down"):
			sprite_2d.play("idledown")

	# Apply movement
	move_and_slide()
