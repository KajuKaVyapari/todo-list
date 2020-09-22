extends Control


onready var textInput = $LineEdit


func _ready() -> void:
	pass
	

func _on_AddButton_pressed() -> void:
	if not textInput.text == '' and not textInput.text in Global.itemsList:
		Global.addItem(textInput.text)
		textInput.text = ''