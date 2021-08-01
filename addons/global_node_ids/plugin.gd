tool
extends EditorPlugin

var inspector_plugin: EditorInspectorPlugin

func _enter_tree() -> void:
	inspector_plugin = preload('inspector_plugin.gd').new()
	add_inspector_plugin(inspector_plugin)
	var path := preload('singleton.gd').resource_path
	add_autoload_singleton('GlobalNodes', path)

func _exit_tree() -> void:
	remove_inspector_plugin(inspector_plugin)
	remove_autoload_singleton('GlobalNodes')
