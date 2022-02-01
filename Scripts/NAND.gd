extends GraphNode

var plug_in = [0, 0]
var plug_out = [0]



func _on_NAND_close_request():
	Global.Remover('NAND', self.get_node("."))
