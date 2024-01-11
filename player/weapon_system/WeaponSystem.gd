extends Node3D
class_name EquipmentSystem

## The node that will emit the weapon change signal
@export var player_node : CharacterBody3D
## The signal name should be connected to trigger the equipment swap
@export var player_signal_trigger : String = "weapon_changed"
## The primary item location. Recommend to be a child node of a bone attachement
@export var held_mount_point : Node3D
## The secondary item location. Recommend to be a child node of a bone attachement
@export var stored_mount_point : Node3D
## The item currently in under the held mount point
@onready var current_equipment : Node3D



func _ready():
	if player_node:
		player_node.connect(player_signal_trigger,change_equipment)
	
	if held_mount_point.get_child(0):
		current_equipment = held_mount_point.get_child(0)
	
func change_equipment():
	if stored_mount_point.get_child(0) && held_mount_point.get_child(0):
		var stored_equipment = stored_mount_point.get_child(0)
		
		print("Former equpiment: " + str(current_equipment))
		held_mount_point.remove_child(current_equipment)
		stored_mount_point.remove_child(stored_equipment)
		held_mount_point.add_child(stored_equipment)
		stored_mount_point.add_child(current_equipment)
		
		# Update current
		current_equipment = held_mount_point.get_child(0)
		print("New equipment: " + str(current_equipment))
		
		
		