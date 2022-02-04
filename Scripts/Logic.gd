extends Node



func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func Cleaner():
	var Interface = self.get_node("/root/UI/Interface")
	var Childrens = Interface.get_child_count()
	
	for i in Childrens:
		if Interface.get_child(i) is GraphNode:
			var node = Interface.get_child(i)
			for j in range(0,2):
				if (node.is_slot_enabled_left(j) == true):
					node.set_slot_color_left(j, Color(0, 255, 255, 1))
				if (node.is_slot_enabled_right(j) == true):
					node.set_slot_color_right(j, Color(0, 255, 255, 1))
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
		
		print(signal_from, " >>> ", signal_to)
		print(signal_from_port, " >>> ", signal_to_port)
		print("=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=")
		print(signal_from.plug_out[0], " >>> ", signal_to.plug_in[0])

