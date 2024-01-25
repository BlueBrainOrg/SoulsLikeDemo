extends Area3D
class_name EquipmentObject

@export var equipment_info : EquipmentResource = EquipmentResource.new()
@onready var equipped = false : set = update_equipped

signal equipped_changed
	
func update_equipped(_new_value):
	equipped = _new_value
	equipped_changed.emit(_new_value)