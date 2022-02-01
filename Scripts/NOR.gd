extends GraphNode

var plug_in = [0, 0]
var plug_out = [0]



func _on_NOR_close_request():
	Global.Remover('NOR', self.get_node("."))
