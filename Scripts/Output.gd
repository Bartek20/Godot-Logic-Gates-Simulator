extends GraphNode

var plug_in = [0]



func _on_Output_close_request():
	Global.Remover('Output', self.get_node("."))

func Calc():
	if (plug_in[0] == 0):
		set_slot_color_left(1, Color(255, 0, 0 ,1))
		self.get_node('.').get_child(1).text = '0'
	else:
		set_slot_color_left(1, Color(0, 255, 0 ,1))
		self.get_node('.').get_child(1).text = '1'
