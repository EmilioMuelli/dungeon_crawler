extends Control

@onready var inv: Inv = preload("res://Inventory/player_Inv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
var is_open = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func update_slots():
	for i in range(min(inv.Items.size(),slots.size())):
		slots[i].update(inv.Items[i])
func _process(delta):
	if Input.is_action_pressed("open_inv") and is_open == false:
		open()
	if Input.is_action_pressed("open_inv") and is_open == true:
		close()

func open():
	visible = true
	is_open = true
	
func close():
	visible = false
	is_open = false
