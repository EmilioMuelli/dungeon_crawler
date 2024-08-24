extends Node2D

var open = false
var player_in_area = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$open_close.play("close")

var key = preload("res://key.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_in_area && Input.is_action_pressed("e"):
		if open == false:
			open = true
			drop_item()
		
	
	if open:
		$open_close.play("open")
	else:
		$open_close.play("close")
	
	
	
	
func _on_collectable_area_body_entered(body):
	if body.has_method("character"):
		player_in_area = true


func _on_collectable_area_body_exited(body):
	if body.has_method("character"):
		player_in_area = false 

func drop_item():
	var key_instance = key.instantiate()
	key_instance.global_position = $Marker2D.global_position
	get_parent().add_child(key_instance)
	key_instance.drop_from_chest()
	if key_instance.has_key_collected() == true:
		pass
	
	
