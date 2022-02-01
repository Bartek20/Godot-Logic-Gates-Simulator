extends GraphNode

var plug_in = [0, 0]
var plug_out = [0]



func _on_XOR_close_request():
	Global.Remover('XOR', self.get_node("."))
