extends GraphNode

var plug_in = [0]
var plug_out = [0]



func _on_NOT_close_request():
	Global.Remover('NOT', self.get_node("."))

func Calc():
	if (plug_in[0] == 0):
		set_slot_color_left(1, Color(255, 0, 0 ,1))
	else:
		set_slot_color_left(1, Color(0, 255, 0 ,1))
	
	if (plug_in[0] == 1):
		plug_out[0] = 0
		set_slot_color_right(1, Color(255, 0, 0 ,1))
	else:
		plug_out[0] = 1
		set_slot_color_right(1, Color(0, 255, 0 ,1))
