extends Control


onready var itemLabel = $ItemLabel


func _on_DeleteButton_pressed() -> void:
	Global.removeItem(itemLabel.text, self)