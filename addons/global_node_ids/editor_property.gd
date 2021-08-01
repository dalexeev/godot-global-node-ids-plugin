extends EditorProperty

var line_edit := LineEdit.new()

func _init() -> void:
	label = 'Global Id'
	line_edit.connect('text_changed', self, '_on_text_changed')
	add_child(line_edit)

func _on_text_changed(new_text: String) -> void:
	var object := get_edited_object()
	object.set_meta('_global_id', new_text)
	if !new_text:
		object.remove_meta('_global_id')
	emit_changed('global_id', new_text)

func update_property() -> void:
	var object := get_edited_object()
	var new_value := ''
	if object.has_meta('_global_id'):
		new_value = str(object.get_meta('_global_id'))
	if line_edit.text != new_value:
		line_edit.text = new_value
