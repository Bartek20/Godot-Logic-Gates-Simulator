extends GraphNode

var plug_in = [0, 0]
var plug_out = [0]



func _on_OR_close_request():
	Global.Remover('OR', self.get_node("."))
