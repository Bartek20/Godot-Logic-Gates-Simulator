extends GraphNode

var plug_in = [0]



func _on_Output_close_request():
	Global.Remover('Output', self.get_node("."))
