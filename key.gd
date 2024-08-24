extends StaticBody2D
@export var Chest_drop = true
var player_in_area = false
var key_collected = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _process(delta):
	if player_in_area && Input.is_action_pressed("e"):
		$AnimationPlayer.play("fade")
		await get_tree().create_timer(0.5).timeout
		key_collected

func drop_from_chest():
	$AnimationPlayer.play("key_chest_drop")
	await get_tree().create_timer(1.1).timeout
	$AnimationPlayer.play("pos_0")
	await get_tree().create_timer(0.001).timeout
	position.x += 3
	position.y += 20
	


func _on_area_2d_body_entered(body):
	if body.has_method("character"):
		player_in_area = true
	


func _on_area_2d_body_exited(body):
	if body.has_method("character"):
		player_in_area = false
		
func has_key_collected():
	if key_collected:
		return true
	
