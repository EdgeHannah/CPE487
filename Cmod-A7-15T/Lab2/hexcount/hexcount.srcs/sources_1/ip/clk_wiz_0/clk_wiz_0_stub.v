// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Sun Nov  1 11:07:29 2020
// Host        : DESKTOP-TF4Q9RE running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/eastc/Desktop/CPE487/Cmod-A7-15T/Lab2/hexcount/hexcount.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a15tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_out1, reset, locked, i_clk_100Mhz)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,reset,locked,i_clk_100Mhz" */;
  output clk_out1;
  input reset;
  output locked;
  input i_clk_100Mhz;
endmodule
