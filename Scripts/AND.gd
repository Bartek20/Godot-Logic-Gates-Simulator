extends GraphNode

var plug_in = [0, 0]
var plug_out = [0]



func _on_AND_close_request():
	Global.Remover('AND', self.get_node("."))
