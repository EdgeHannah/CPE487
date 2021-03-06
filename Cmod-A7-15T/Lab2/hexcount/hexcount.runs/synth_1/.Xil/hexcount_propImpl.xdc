set_property SRC_FILE_INFO {cfile:c:/Users/eastc/Desktop/CPE487/Cmod-A7-15T/Lab2/hexcount/hexcount.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0/clk_wiz_0_in_context.xdc rfile:../../../hexcount.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0/clk_wiz_0_in_context.xdc id:1 order:EARLY scoped_inst:hexcount_inst} [current_design]
set_property SRC_FILE_INFO {cfile:C:/Users/eastc/Desktop/CPE487/Cmod-A7-15T/Lab2/hexcount.xdc rfile:../../../../hexcount.xdc id:2} [current_design]
current_instance hexcount_inst
set_property src_info {type:SCOPED_XDC file:1 line:1 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 83.333 [get_ports -no_traverse {}]
set_property src_info {type:SCOPED_XDC file:1 line:4 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -source [get_ports clk_in1] -edges {1 2 3} -edge_shift {0.000 -31.667 -63.333} [get_ports {}]
current_instance
set_property src_info {type:XDC file:2 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN L17   IOSTANDARD LVCMOS33 } [get_ports { sysclk }]; #IO_L12P_T1_MRCC_14 Sch=gclk
set_property src_info {type:XDC file:2 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A17   IOSTANDARD LVCMOS33 } [get_ports { lock_led }]; #IO_L12N_T1_MRCC_16 Sch=led[1]
set_property src_info {type:XDC file:2 line:20 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { reset }]; #IO_L19N_T3_VREF_16 Sch=btn[0]
set_property src_info {type:XDC file:2 line:48 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVCMOS33 } [get_ports { seg[0] }]; #IO_L6N_T0_VREF_16 Sch=pio[07]
set_property src_info {type:XDC file:2 line:49 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B15   IOSTANDARD LVCMOS33 } [get_ports { seg[1] }]; #IO_L11N_T1_SRCC_16 Sch=pio[08]
set_property src_info {type:XDC file:2 line:50 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A14   IOSTANDARD LVCMOS33 } [get_ports { seg[2] }]; #IO_L6P_T0_16 Sch=pio[09]
set_property src_info {type:XDC file:2 line:51 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN J3    IOSTANDARD LVCMOS33 } [get_ports { seg[3] }]; #IO_L7P_T1_AD6P_35 Sch=pio[10]
set_property src_info {type:XDC file:2 line:52 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN J1    IOSTANDARD LVCMOS33 } [get_ports { seg[4] }]; #IO_L3N_T0_DQS_AD5N_35 Sch=pio[11]
set_property src_info {type:XDC file:2 line:53 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { seg[5] }]; #IO_L5P_T0_AD13P_35 Sch=pio[12]
set_property src_info {type:XDC file:2 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN L1    IOSTANDARD LVCMOS33 } [get_ports { seg[6] }]; #IO_L6N_T0_VREF_35 Sch=pio[13]
set_property src_info {type:XDC file:2 line:82 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U7    IOSTANDARD LVCMOS33 } [get_ports { anode[0] }]; #IO_L19P_T3_34 Sch=pio[45]
set_property src_info {type:XDC file:2 line:83 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN W7    IOSTANDARD LVCMOS33 } [get_ports { anode[1] }]; #IO_L13P_T2_MRCC_34 Sch=pio[46]
set_property src_info {type:XDC file:2 line:84 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U8    IOSTANDARD LVCMOS33 } [get_ports { anode[2] }]; #IO_L14P_T2_SRCC_34 Sch=pio[47]
set_property src_info {type:XDC file:2 line:85 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V8    IOSTANDARD LVCMOS33 } [get_ports { anode[3] }]; #IO_L14N_T2_SRCC_34 Sch=pio[48]
