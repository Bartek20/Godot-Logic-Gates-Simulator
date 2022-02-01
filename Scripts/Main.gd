extends Control

var SCHEMATIC = load("res://Schematic.tscn").instance()

var IN = SCHEMATIC.get_node('./Input')
var OUT = SCHEMATIC.get_node('./Output')

var NOT = SCHEMATIC.get_node('./NOT')
var AND = SCHEMATIC.get_node('./AND')
var NAND = SCHEMATIC.get_node('./NAND')
var OR = SCHEMATIC.get_node('./OR')
var NOR = SCHEMATIC.get_node('./NOR')
var XOR = SCHEMATIC.get_node('./XOR')
var XNOR = SCHEMATIC.get_node('./XNOR')



func _ready():
	print('Program started succesfully :).')
	for amount in range(0, 2):
		Global.parts[amount] = 0
	Global.Blocker()

func _on_Interface_connection_request(from, from_port, to, to_port):
	for item in $Interface.get_connection_list():
		if item.to == to and item.to_port == to_port:
			return
	$Interface.connect_node(from, from_port, to, to_port)

func _on_Interface_disconnection_request(from, from_port, to, to_port):
	$Interface.disconnect_node(from, from_port, to, to_port)



func _on_Input_pressed():
	if (Global.parts[0] < Global.limits[0]):
		var IN_Model = IN.duplicate()
		$Interface.add_child(IN_Model)
		IN_Model.offset = Vector2(40, 40)
		Global.parts[0] += 1
		Global.parts[2] += 1
		if (Global.parts[0] >= Global.limits[0]):
			print ('You reached max amount of input elements.')
			$Menu/Input.text = 'MAX Input reached...'
			$Menu/Input.disabled = true
	Global.Blocker()

func _on_Output_pressed():
	if (Global.parts[1] < Global.limits[1]):
		var OUT_Model = OUT.duplicate()
		$Interface.add_child(OUT_Model)
		OUT_Model.offset = Vector2(40, 40)
		Global.parts[1] += 1
		Global.parts[2] += 1
		if (Global.parts[1] >= Global.limits[1]):
			print ('You reached max amount of output elements.')
			$Menu/Output.text = 'MAX Output reached...'
			$Menu/Output.disabled = true
	Global.Blocker()



func _on_NOT_pressed():
	var NOT_Model = NOT.duplicate()
	$Interface.add_child(NOT_Model)
	NOT_Model.offset = Vector2(40, 40)
	Global.parts[2] += 1
	Global.Blocker()

func _on_AND_pressed():
	var AND_Model = AND.duplicate()
	$Interface.add_child(AND_Model)
	AND_Model.offset = Vector2(40, 40)
	Global.parts[2] += 1
	Global.Blocker()

func _on_NAND_pressed():
	var NAND_Model = NAND.duplicate()
	$Interface.add_child(NAND_Model)
	NAND_Model.offset = Vector2(40, 40)
	Global.parts[2] += 1
	Global.Blocker()

func _on_OR_pressed():
	var OR_Model = OR.duplicate()
	$Interface.add_child(OR_Model)
	OR_Model.offset = Vector2(40, 40)
	Global.parts[2] += 1
	Global.Blocker()

func _on_NOR_pressed():
	var NOR_Model = NOR.duplicate()
	$Interface.add_child(NOR_Model)
	NOR_Model.offset = Vector2(40, 40)
	Global.parts[2] += 1
	Global.Blocker()

func _on_XOR_pressed():
	var XOR_Model = XOR.duplicate()
	$Interface.add_child(XOR_Model)
	XOR_Model.offset = Vector2(40, 40)
	Global.parts[2] += 1
	Global.Blocker()

func _on_XNOR_pressed():
	var XNOR_Model = XNOR.duplicate()
	$Interface.add_child(XNOR_Model)
	XNOR_Model.offset = Vector2(40, 40)
	Global.parts[2] += 1
	Global.Blocker()


	
func _on_Clear_Connections_pressed():
	$Interface.clear_connections()
	$"Menu/Clear Connections".text = 'Connections Cleared'
	$"Menu/Clear Connections".disabled = true
	yield(get_tree().create_timer(1), "timeout")
	$"Menu/Clear Connections".text = 'Clear Connections'
	$"Menu/Clear Connections".disabled = false

func _on_Clear_Items_pressed():
	var nodes = $Interface.get_children()
	for node in nodes:
		if node is GraphNode:
			node.queue_free()
	for amount in range(0,2):
		Global.parts[amount] = 0
	Global.Blocker()
	$"Menu/Clear Items".text = 'Items Cleared'
	$"Menu/Clear Items".disabled = true
	yield(get_tree().create_timer(1), "timeout")
	$"Menu/Clear Items".text = 'Clear Items'
	$"Menu/Clear Items".disabled = false



func _on_Start_pressed():
	var CONNECTIONS_List = $Interface.get_connection_list()
	if (CONNECTIONS_List.empty() == false):
		for i in range(0, CONNECTIONS_List.size()):
			print(CONNECTIONS_List[i])
