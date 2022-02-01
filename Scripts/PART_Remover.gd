extends GraphNode

func _ready():
	if self.get_node(".").get_child(1) is OptionButton:
		Input_Value(self.get_node(".").get_child(1))

func Input_Value(choose_button):
	choose_button.add_item('Choose state')
	choose_button.set_item_disabled(0, true)
	choose_button.add_item('Input 0')
	choose_button.add_item('Input 1')

func _on_Input_close_request():
	Global.Remover('Input', self.get_node("."))

func _on_Output_close_request():
	Global.Remover('Output', self.get_node("."))

func _on_NOT_close_request():
	Global.Remover('NOT', self.get_node("."))

func _on_AND_close_request():
	Global.Remover('AND', self.get_node("."))

func _on_NAND_close_request():
	Global.Remover('NAND', self.get_node("."))

func _on_OR_close_request():
	Global.Remover('OR', self.get_node("."))

func _on_NOR_close_request():
	Global.Remover('NOR', self.get_node("."))

func _on_XOR_close_request():
	Global.Remover('XOR', self.get_node("."))

func _on_XNOR_close_request():
	Global.Remover('XNOR', self.get_node("."))
