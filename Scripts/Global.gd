extends Node

# Syntax [in, out, all]
var limits = [5, 1, 30]
var parts = [0, 0, 0] # Do not edit



func Blocker():
	self.get_node("/root/UI/Menu/Limit").text = str(parts[2]) + ' / ' + str(limits[2])
	if (parts[2] >= limits[2]):
		for button in range(3, self.get_node("/root/UI/Menu").get_child_count() - 4):
			if self.get_node("/root/UI/Menu").get_child(button) is Button:
				self.get_node("/root/UI/Menu").get_child(button).disabled = true
	elif (parts[2] < limits[2]):
		if (parts[0] < limits[0]):
			self.get_node("/root/UI/Menu/Input").text = 'Input'
			self.get_node("/root/UI/Menu/Input").disabled = false
		if (parts[1] < limits[1]):
			self.get_node("/root/UI/Menu/Output").text = 'Output'
			self.get_node("/root/UI/Menu/Output").disabled = false
		for button in range(6, self.get_node("/root/UI/Menu").get_child_count() - 4):
			self.get_node("/root/UI/Menu").get_child(button).disabled = false

func Remover(item, node):
	if (item == 'Input'):
		node.queue_free()
		parts[0] -= 1
		node.get_node("../../").get_child(1).get_child(3).text = 'Input'
		node.get_node("../../").get_child(1).get_child(3).disabled = false
		parts[2] -= 1
		Blocker()
	elif (item == "Output"):
		node.get_node(".").queue_free()
		parts[1] -= 1
		node.get_node("../../").get_child(1).get_child(4).text = 'Output'
		node.get_node("../../").get_child(1).get_child(4).disabled = false
		parts[2] -= 1
		Blocker()
	else:
		node.queue_free()
		parts[2] -= 1
		Blocker()
