## This file is a general .xdc for the CmodA7 rev. B
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Buttons
set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { dig[0] }]; #IO_L19N_T3_VREF_16 Sch=btn[0]
set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { dig[1] }]; #IO_L19P_T3_16 Sch=btn[1]

## GPIO Pins
## Pins 15 and 16 should remain commented if using them as analog inputs
set_property -dict { PACKAGE_PIN M3    IOSTANDARD LVCMOS33 } [get_ports { data[0] }]; #IO_L8N_T1_AD14N_35 Sch=pio[01]
#set_property -dict { PACKAGE_PIN L3    IOSTANDARD LVCMOS33 } [get_ports { data[1] }]; #IO_L8P_T1_AD14P_35 Sch=pio[02]
set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVCMOS33 } [get_ports { data[2] }]; #IO_L12P_T1_MRCC_16 Sch=pio[03]
set_property -dict { PACKAGE_PIN K3    IOSTANDARD LVCMOS33 } [get_ports { data[3] }]; #IO_L7N_T1_AD6N_35 Sch=pio[04]
#set_property -dict { PACKAGE_PIN C15   IOSTANDARD LVCMOS33 } [get_ports { pio05 }]; #IO_L11P_T1_SRCC_16 Sch=pio[05]
#set_property -dict { PACKAGE_PIN H1    IOSTANDARD LVCMOS33 } [get_ports { pio06 }]; #IO_L3P_T0_DQS_AD5P_35 Sch=pio[06]
set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVCMOS33 } [get_ports { seg[0] }]; #IO_L6N_T0_VREF_16 Sch=pio[07]
set_property -dict { PACKAGE_PIN B15   IOSTANDARD LVCMOS33 } [get_ports { seg[1] }]; #IO_L11N_T1_SRCC_16 Sch=pio[08]
set_property -dict { PACKAGE_PIN A14   IOSTANDARD LVCMOS33 } [get_ports { seg[2] }]; #IO_L6P_T0_16 Sch=pio[09]
set_property -dict { PACKAGE_PIN J3    IOSTANDARD LVCMOS33 } [get_ports { seg[3] }]; #IO_L7P_T1_AD6P_35 Sch=pio[10]
set_property -dict { PACKAGE_PIN J1    IOSTANDARD LVCMOS33 } [get_ports { seg[4] }]; #IO_L3N_T0_DQS_AD5N_35 Sch=pio[11]
set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { seg[5] }]; #IO_L5P_T0_AD13P_35 Sch=pio[12]
set_property -dict { PACKAGE_PIN L1    IOSTANDARD LVCMOS33 } [get_ports { seg[6] }]; #IO_L6N_T0_VREF_35 Sch=pio[13]
set_property -dict { PACKAGE_PIN L2    IOSTANDARD LVCMOS33 } [get_ports { anode[0] }]; #IO_L5N_T0_AD13N_35 Sch=pio[14]
set_property -dict { PACKAGE_PIN M1    IOSTANDARD LVCMOS33 } [get_ports { anode[1] }]; #IO_L9N_T1_DQS_AD7N_35 Sch=pio[17]
set_property -dict { PACKAGE_PIN N3    IOSTANDARD LVCMOS33 } [get_ports { anode[2] }]; #IO_L12P_T1_MRCC_35 Sch=pio[18]
set_property -dict { PACKAGE_PIN P3    IOSTANDARD LVCMOS33 } [get_ports { anode[3] }]; #IO_L12N_T1_MRCC_35 Sch=pio[19]
#set_property -dict { PACKAGE_PIN U8    IOSTANDARD LVCMOS33 } [get_ports { data[0] }]; #IO_L14P_T2_SRCC_34 Sch=pio[47]
set_property -dict { PACKAGE_PIN V8    IOSTANDARD LVCMOS33 } [get_ports { data[1] }]; #IO_L14N_T2_SRCC_34 Sch=pio[48]