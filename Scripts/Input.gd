extends GraphNode

var plug_out = [0]



func _ready():
	Input_Value()

func Input_Value():
	self.get_node(".").get_child(1).add_item('Choose state')
	self.get_node(".").get_child(1).set_item_disabled(0, true)
	self.get_node(".").get_child(1).add_item('Input 0')
	self.get_node(".").get_child(1).add_item('Input 1')

func _on_Input_close_request():
	Global.Remover('Input', self.get_node("."))


func _on_Input_item_selected(index):
	if (index == 1):
		plug_out[0] = 0
		set_slot_color_right(1, Color(255, 0, 0, 1))
	elif (index == 2):
		plug_out[0] = 1
		set_slot_color_right(1, Color(0, 255, 0, 1))
