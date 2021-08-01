extends Node

var _nodes := {}

func _enter_tree() -> void:
	get_tree().connect('node_added', self, '_on_node_added')
	get_tree().connect('node_removed', self, '_on_node_removed')
	
	var node_list := [get_tree().root]
	while !node_list.empty():
		var node := node_list.pop_back() as Node
		_on_node_added(node)
		node_list.append_array(node.get_children())

func get_by_id(id: String) -> Node:
	if !_nodes.has(id):
		printerr('Global node id "%s" not found!' % id)
		return null
	return _nodes.get(id)

func _on_node_added(node: Node) -> void:
	if node.has_meta('_global_id'):
		var id := str(node.get_meta('_global_id'))
		if _nodes.has(id) && _nodes.get(id) != node:
			printerr('Duplicate global node id "%s"!' % id)
			return
		_nodes[id] = node

func _on_node_removed(node: Node) -> void:
	if node.has_meta('_global_id'):
		var id := str(node.get_meta('_global_id'))
		if !_nodes.has(id):
			printerr('Global node id "%s" was removed!' % id)
			return
		_nodes.erase(id)
