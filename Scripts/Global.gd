extends Node

# Syntax [in, out, all]
var limits = [5, 1, 30]
var parts = [0, 0, 0] # Do not edit

var SCHEMATIC = load("res://Schematic.tscn").instance()


var NAND = SCHEMATIC.get_node('./NAND')
var OR = SCHEMATIC.get_node('./OR')
var NOR = SCHEMATIC.get_node('./NOR')
var XOR = SCHEMATIC.get_node('./XOR')
var XNOR = SCHEMATIC.get_node('./XNOR')



func Runner():
	print('Program started succesfully :).')
	for amount in range(0, 3):
		parts[amount] = 0
	Blocker()

func Adder(item):
	var Part = ''
	if (item == 'Input'):
		if (parts[0] < limits[0]):
			Part = SCHEMATIC.get_node('./Input').duplicate()
			parts[0] += 1
			if (parts[0] >= limits[0]):
				print ('You reached max amount of input elements.')
				self.get_node("/root/UI/Menu/Input").text = 'MAX Input reached...'
				self.get_node("/root/UI/Menu/Input").disabled = true
	elif (item == 'Output'):
		if (parts[1] < limits[1]):
			Part = SCHEMATIC.get_node('./Output').duplicate()
			parts[1] += 1
			if (parts[1] >= limits[1]):
				print ('You reached max amount of output elements.')
				self.get_node("/root/UI/Menu/Output").text = 'MAX Output reached...'
				self.get_node("/root/UI/Menu/Output").disabled = true
	else:
		Part = SCHEMATIC.get_node(item).duplicate()
	self.get_node("/root/UI/Interface").add_child(Part)
	Part.offset = Vector2(40, 40)
	parts[2] += 1
	Blocker()

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
	for con in node.get_parent().get_connection_list():
			if con.to == node.name or con.from == node.name:
				node.get_parent().disconnect_node(con.from, con.from_port, con.to, con.to_port)
	node.queue_free()
	parts[2] -= 1
	if (item == 'Input'):
		parts[0] -= 1
		node.get_node("../../").get_child(1).get_child(3).text = 'Input'
		node.get_node("../../").get_child(1).get_child(3).disabled = false
	elif (item == "Output"):
		parts[1] -= 1
		node.get_node("../../").get_child(1).get_child(4).text = 'Output'
		node.get_node("../../").get_child(1).get_child(4).disabled = false
	Blocker()
