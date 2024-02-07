## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
# Switches
set_property PACKAGE_PIN V17 [get_ports {data[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {data[0]}]
set_property PACKAGE_PIN V16 [get_ports {data[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {data[1]}]
set_property PACKAGE_PIN W16 [get_ports {data[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {data[2]}]
set_property PACKAGE_PIN W17 [get_ports {data[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {data[3]}]
set_property PACKAGE_PIN W15 [get_ports {data[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {data[4]}]
set_property PACKAGE_PIN V15 [get_ports {data[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {data[5]}]
set_property PACKAGE_PIN W14 [get_ports {data[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {data[6]}]
set_property PACKAGE_PIN W13 [get_ports {data[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {data[7]}]
#set_property PACKAGE_PIN V2 [get_ports {sw[8]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]
#set_property PACKAGE_PIN T3 [get_ports {sw[9]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]
#set_property PACKAGE_PIN T2 [get_ports {sw[10]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]
#set_property PACKAGE_PIN R3 [get_ports {sw[11]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}]
#set_property PACKAGE_PIN W2 [get_ports {sw[12]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
#set_property PACKAGE_PIN U1 [get_ports {sw[13]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]
set_property PACKAGE_PIN T1 [get_ports {reset}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reset}]
set_property PACKAGE_PIN R2 [get_ports {switch}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switch}]
 

# LEDs
set_property PACKAGE_PIN U16 [get_ports {LEDA[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDA[0]}]
set_property PACKAGE_PIN E19 [get_ports {LEDA[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDA[1]}]
set_property PACKAGE_PIN U19 [get_ports {LEDA[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDA[2]}]
set_property PACKAGE_PIN V19 [get_ports {LEDA[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDA[3]}]
set_property PACKAGE_PIN W18 [get_ports {LEDA[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDA[4]}]
set_property PACKAGE_PIN U15 [get_ports {LEDA[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDA[5]}]
set_property PACKAGE_PIN U14 [get_ports {LEDA[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDA[6]}]
set_property PACKAGE_PIN V14 [get_ports {LEDA[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDA[7]}]
set_property PACKAGE_PIN W3 [get_ports {stateLed[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {stateLed[0]}]
set_property PACKAGE_PIN U3 [get_ports {stateLed[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {stateLed[1]}]
	set_property PACKAGE_PIN L1 [get_ports {lastLed}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {lastLed}]
	
#7 segment display
set_property PACKAGE_PIN W7 [get_ports {seg_outputs[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_outputs[0]}]
set_property PACKAGE_PIN W6 [get_ports {seg_outputs[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_outputs[1]}]
set_property PACKAGE_PIN U8 [get_ports {seg_outputs[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_outputs[2]}]
set_property PACKAGE_PIN V8 [get_ports {seg_outputs[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_outputs[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg_outputs[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_outputs[4]}]
set_property PACKAGE_PIN V5 [get_ports {seg_outputs[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_outputs[5]}]
set_property PACKAGE_PIN U7 [get_ports {seg_outputs[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_outputs[6]}]

#set_property PACKAGE_PIN V7 [get_ports dp]							
	#set_property IOSTANDARD LVCMOS33 [get_ports dp]
	
set_property PACKAGE_PIN U2 [get_ports {an[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]

##Buttons
set_property PACKAGE_PIN U18 [get_ports BTNC]						
	set_property IOSTANDARD LVCMOS33 [get_ports BTNC]
set_property PACKAGE_PIN T18 [get_ports BTNU]						
	set_property IOSTANDARD LVCMOS33 [get_ports BTNU]
set_property PACKAGE_PIN W19 [get_ports BTNL]						
	set_property IOSTANDARD LVCMOS33 [get_ports BTNL]
set_property PACKAGE_PIN T17 [get_ports BTNR]						
	set_property IOSTANDARD LVCMOS33 [get_ports BTNR]
set_property PACKAGE_PIN U17 [get_ports BTND]						
	set_property IOSTANDARD LVCMOS33 [get_ports BTND]
	
	
	
	
##Pmod Header JB
##Sch name = JB1
set_property PACKAGE_PIN A14 [get_ports {JB}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JB}]
##Sch name = JB2
#set_property PACKAGE_PIN A16 [get_ports {TXserial}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {TXserial}]
##Sch name = JB3
#set_property PACKAGE_PIN B15 [get_ports {JB[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[2]}]
##Sch name = JB4
#set_property PACKAGE_PIN B16 [get_ports {JB[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[3]}]
##Sch name = JB7
#set_property PACKAGE_PIN A15 [get_ports {JB[4]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[4]}]
##Sch name = JB8
#set_property PACKAGE_PIN A17 [get_ports {JB[5]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[5]}]
##Sch name = JB9
#set_property PACKAGE_PIN C15 [get_ports {JB[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[6]}]
##Sch name = JB10 
#set_property PACKAGE_PIN C16 [get_ports {JB[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[7]}]
	
	
##Pmod Header JC
##Sch name = JC1
set_property PACKAGE_PIN K17 [get_ports {JC}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JC}]
##Sch name = JC2
#set_property PACKAGE_PIN M18 [get_ports {JC[1]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[1]}]
	