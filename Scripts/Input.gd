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
