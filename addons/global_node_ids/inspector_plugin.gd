extends EditorInspectorPlugin

const PropertyEditor = preload('editor_property.gd')

func can_handle(object: Object) -> bool:
	return object is Node

func parse_category(object: Object, category: String) -> void:
	if category == 'Node':
		add_property_editor('global_id', PropertyEditor.new())
