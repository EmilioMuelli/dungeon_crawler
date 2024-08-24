extends CharacterBody2D


@export var speed = 100
var keypressed = false
var counter = 0
func _ready():
	pass

func _physics_process(delta):
	keypressed = false
	
	var velocity = Vector2(0,0)
	if Input.is_action_pressed("right"):
		velocity.x += 1
		keypressed =true
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		keypressed =true
	if Input.is_action_pressed("down"):
		velocity.y += 1
		keypressed =true
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		keypressed =true

	if velocity.length() > 0:
		move_and_collide(velocity.normalized() * speed)
		if velocity.x < 0:
			$character_animation.play("walk_left")
			$AnimationPlayer_hands.play("walk_left")
		if velocity.x >= 0: 
			$character_animation.play("walk_right")
			$AnimationPlayer_hands.play("walk_right")
			
	if keypressed == false:
		$character_animation.play("Idle")
		$AnimationPlayer_hands.play("Hands_Idle")
		
	
func character():
	pass
