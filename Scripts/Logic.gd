extends Node



func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	Worker()
	
func Cleaner():
	var Interface = self.get_node("/root/UI/Interface")
	var Childrens = Interface.get_child_count()
	
	for i in Childrens:
		if Interface.get_child(i) is GraphNode:
			var node = Interface.get_child(i)
			if (node.plug_in.size() == 1):
				node.plug_in = [0]
			else:
				node.plug_in = [0, 0]
			node.Calc()

func Worker():
	var Interface = self.get_node("/root/UI/Interface")
	var Connections = Interface.get_connection_list()
	
	for i in Connections:
		var signal_from = Interface.get_node(i.from)
		var signal_to = Interface.get_node(i.to)
		var signal_from_port = i.from_port
		var signal_to_port = i.to_port
		
		signal_to.plug_in[signal_to_port] = signal_from.plug_out[signal_from_port]
		signal_to.Calc()
