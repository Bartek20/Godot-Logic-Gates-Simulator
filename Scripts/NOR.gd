extends GraphNode

var plug_in = [0, 0]
var plug_out = [0]



func _on_NOR_close_request():
	Global.Remover('NOR', self.get_node("."))

func Calc():
	if (plug_in[0] == 0):
		set_slot_color_left(0, Color(255, 0, 0 ,1))
	else:
		set_slot_color_left(0, Color(0, 255, 0 ,1))
	if (plug_in[1] == 0):
		set_slot_color_left(2, Color(255, 0, 0 ,1))
	else:
		set_slot_color_left(2, Color(0, 255, 0 ,1))
	
	if (plug_in[0] == 0) and (plug_in[1] == 0):
		plug_out[0] = 1
		set_slot_color_right(1, Color(0, 255, 0 ,1))
	else:
		plug_out[0] = 0
		set_slot_color_right(1, Color(255, 0, 0 ,1))
