extends GraphNode

var plug_in = [0, 0]
var plug_out = [0]



func _on_XNOR_close_request():
	Global.Remover('XNOR', self.get_node("."))
