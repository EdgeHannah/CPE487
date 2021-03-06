set_property SRC_FILE_INFO {cfile:c:/Users/eastc/Desktop/CPE487/Cmod-A7-15T/Lab3/No-Modifications/vga_ball/vga_ball.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc rfile:../../../vga_ball.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc id:1 order:EARLY scoped_inst:clk_wiz_0_inst} [current_design]
set_property SRC_FILE_INFO {cfile:C:/Users/eastc/Desktop/CPE487/Cmod-A7-15T/Lab3/No-Modifications/vga_top.xdc rfile:../../../../vga_top.xdc id:2} [current_design]
current_instance clk_wiz_0_inst
set_property src_info {type:SCOPED_XDC file:1 line:1 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 83.333 [get_ports -no_traverse {}]
set_property src_info {type:SCOPED_XDC file:1 line:4 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -source [get_ports clk_in1] -edges {1 2 3} -edge_shift {0.000 -21.667 -43.333} [get_ports {}]
current_instance
set_property src_info {type:XDC file:2 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN L17 IOSTANDARD LVCMOS33} [get_ports sysclk]
set_property src_info {type:XDC file:2 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN A18 IOSTANDARD LVCMOS33} [get_ports reset]
set_property src_info {type:XDC file:2 line:14 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN A17 IOSTANDARD LVCMOS33} [get_ports lock_led]
set_property src_info {type:XDC file:2 line:18 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN M3 IOSTANDARD LVCMOS33} [get_ports {vga_red[0]}]
set_property src_info {type:XDC file:2 line:19 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN L3 IOSTANDARD LVCMOS33} [get_ports {vga_red[1]}]
set_property src_info {type:XDC file:2 line:20 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN A16 IOSTANDARD LVCMOS33} [get_ports {vga_red[2]}]
set_property src_info {type:XDC file:2 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN K3 IOSTANDARD LVCMOS33} [get_ports {vga_green[0]}]
set_property src_info {type:XDC file:2 line:22 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN C15 IOSTANDARD LVCMOS33} [get_ports {vga_green[1]}]
set_property src_info {type:XDC file:2 line:23 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN H1 IOSTANDARD LVCMOS33} [get_ports {vga_green[2]}]
set_property src_info {type:XDC file:2 line:24 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN A15 IOSTANDARD LVCMOS33} [get_ports {vga_blue[0]}]
set_property src_info {type:XDC file:2 line:25 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN B15 IOSTANDARD LVCMOS33} [get_ports {vga_blue[1]}]
set_property src_info {type:XDC file:2 line:26 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN U8 IOSTANDARD LVCMOS33} [get_ports vga_hsync]
set_property src_info {type:XDC file:2 line:27 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN V8 IOSTANDARD LVCMOS33} [get_ports vga_vsync]
