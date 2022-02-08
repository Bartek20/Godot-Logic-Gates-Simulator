extends Control



#####
#
# Program Startup
#
#####
func _ready():
	Global.Runner()
	Global.RCM()

func _input(event):
	EventHandler.App(event)

#####
#
# Working on connections
#
#####
func _on_Interface_connection_request(from, from_port, to, to_port):
	Global.Connector('Connect', from, from_port, to, to_port)
func _on_Interface_disconnection_request(from, from_port, to, to_port):
	Global.Connector('Disconnect', from, from_port, to, to_port)

#####
#
# Adding In / Out
#
#####
func _on_Input_pressed():
	Global.Adder('Input')
func _on_Output_pressed():
	Global.Adder('Output')

#####
#
# Adding Gates
#
#####
func _on_NOT_pressed():
	Global.Adder('NOT')
func _on_AND_pressed():
	Global.Adder('AND')
func _on_NAND_pressed():
	Global.Adder('NAND')
func _on_OR_pressed():
	Global.Adder('OR')
func _on_NOR_pressed():
	Global.Adder('NOR')
func _on_XOR_pressed():
	Global.Adder('XOR')
func _on_XNOR_pressed():
	Global.Adder('XNOR')

#####
#
# Cleaning Interface
#
#####
func _on_Clear_Connections_pressed():
	Global.Clearer('Connections')
func _on_Clear_Items_pressed():
	Global.Clearer('Items')

#####
#
# Running calculations
#
#####
func _on_Start_pressed():
	#Logic.Worker()
	#Logic.Worker()
	pass


func _on_Right_Click_Menu_id_pressed(id):
	match(id):
		0: Global.Adder('Input')
		1: Global.Adder('Output')
		2: Global.Adder('NOT')
		3: Global.Adder('AND')
		4: Global.Adder('NAND')
		5: Global.Adder('OR')
		6: Global.Adder('NOR')
		7: Global.Adder('XOR')
		8: Global.Adder('XNOR')
		#9: for _i in range(0,2): Logic.Worker()
