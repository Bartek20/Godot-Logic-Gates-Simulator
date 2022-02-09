extends Node

var mouse_position



func App(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_RIGHT:
		mouse_position = get_node("/root/UI").get_global_mouse_position()
		var popup_menu = self.get_node("/root/UI/Right Click Menu")
		popup_menu.popup(Rect2(mouse_position.x, mouse_position.y, popup_menu.rect_size.x, popup_menu.rect_size.y))
