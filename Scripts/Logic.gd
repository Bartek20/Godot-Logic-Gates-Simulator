extends Node



func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
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

