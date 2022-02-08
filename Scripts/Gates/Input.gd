extends GraphNode

var plug_in = [0]
var plug_out = [0]



func _ready():
	Calc()

func _on_Input_close_request():
	Global.Remover('Input', self.get_node("."))


func _on_Input_item_selected(_index):
	Calc()
	
func Calc():
	if (get_child(1).is_pressed() == false):
		plug_out[0] = 0
		get_child(1).text = "0"
		set_slot_color_right(1, Color(255, 0, 0, 1))
	elif (get_child(1).is_pressed() == true):
		plug_out[0] = 1
		get_child(1).text = "1"
		set_slot_color_right(1, Color(0, 255, 0, 1))


func _on_CheckButton_toggled(_button_pressed):
	Calc()
