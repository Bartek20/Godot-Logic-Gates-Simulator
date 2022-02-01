extends GraphNode

var plug_in = [0]
var plug_out = [0]



func _on_NOT_close_request():
	Global.Remover('NOT', self.get_node("."))
