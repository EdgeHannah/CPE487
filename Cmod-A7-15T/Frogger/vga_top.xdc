## This file is a general .xdc for the CmodA7 rev. B
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## 12 MHz Clock Signal
set_property -dict {PACKAGE_PIN L17 IOSTANDARD LVCMOS33} [get_ports {sysclk}]; #IO_L12P_T1_MRCC_14 Sch=gclk 
create_clock -period 83.330 -name sys_clk_pin -waveform {0.000 41.660} -add [get_ports {sysclk}];

## Buttons
set_property -dict {PACKAGE_PIN A18 IOSTANDARD LVCMOS33} [get_ports {reset}];
#set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { frog_up }]; #IO_L19P_T3_16 Sch=btn[1]

##LEDs
set_property -dict {PACKAGE_PIN A17 IOSTANDARD LVCMOS33} [get_ports lock_led]; #IO_L12N_T1_MRCC_16 Sch=led[1]

## GPIO Pins
## Pins 15 and 16 should remain commented if using them as analog inputs
set_property -dict {PACKAGE_PIN M3 IOSTANDARD LVCMOS33} [get_ports {vga_red[0]}]; #IO_L8N_T1_AD14N_35 Sch=pio[01]
set_property -dict {PACKAGE_PIN L3 IOSTANDARD LVCMOS33} [get_ports {vga_red[1]}]; #IO_L8P_T1_AD14P_35 Sch=pio[02]
set_property -dict {PACKAGE_PIN A16 IOSTANDARD LVCMOS33} [get_ports {vga_red[2]}]; #IO_L12P_T1_MRCC_16 Sch=pio[03]
set_property -dict {PACKAGE_PIN K3 IOSTANDARD LVCMOS33} [get_ports {vga_green[0]}]; #IO_L7N_T1_AD6N_35 Sch=pio[04]
set_property -dict {PACKAGE_PIN C15 IOSTANDARD LVCMOS33} [get_ports {vga_green[1]}]; #IO_L11P_T1_SRCC_16 Sch=pio[05]
set_property -dict {PACKAGE_PIN H1 IOSTANDARD LVCMOS33} [get_ports {vga_green[2]}]; #IO_L3P_T0_DQS_AD5P_35 Sch=pio[06]
set_property -dict {PACKAGE_PIN A15 IOSTANDARD LVCMOS33} [get_ports {vga_blue[0]}]; #IO_L6N_T0_VREF_16 Sch=pio[07]
set_property -dict {PACKAGE_PIN B15 IOSTANDARD LVCMOS33} [get_ports {vga_blue[1]}]; #IO_L11N_T1_SRCC_16 Sch=pio[08]

set_property -dict { PACKAGE_PIN J3    IOSTANDARD LVCMOS33 } [get_ports { frog_down }]; #IO_L7P_T1_AD6P_35 Sch=pio[10]
set_property -dict { PACKAGE_PIN J1    IOSTANDARD LVCMOS33 } [get_ports { frog_left }]; #IO_L3N_T0_DQS_AD5N_35 Sch=pio[11]
set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { frog_right }]; #IO_L5P_T0_AD13P_35 Sch=pio[12]
set_property -dict { PACKAGE_PIN M1    IOSTANDARD LVCMOS33 } [get_ports { frog_up }]; #IO_L9N_T1_DQS_AD7N_35 Sch=pio[17]

set_property -dict {PACKAGE_PIN U8 IOSTANDARD LVCMOS33} [get_ports vga_hsync]; #IO_L14P_T2_SRCC_34 Sch=pio[47]
set_property -dict {PACKAGE_PIN V8 IOSTANDARD LVCMOS33} [get_ports vga_vsync]; #IO_L14N_T2_SRCC_34 Sch=pio[48]

