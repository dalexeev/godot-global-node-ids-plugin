extends Node

func _ready() -> void:
	var text_edit := GlobalNodes.get_by_id('text_edit') as TextEdit
	text_edit.text = 'Hello from GlobalNodes!'
