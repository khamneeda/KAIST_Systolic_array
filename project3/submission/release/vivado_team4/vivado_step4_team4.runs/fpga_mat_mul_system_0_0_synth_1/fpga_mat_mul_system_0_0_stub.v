// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Fri Dec  1 05:04:30 2023
// Host        : ac441d3eae35 running 64-bit Ubuntu 22.04.3 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ fpga_mat_mul_system_0_0_stub.v
// Design      : fpga_mat_mul_system_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "mat_mul_system,Vivado 2022.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, addr_sp_bram, enable_sp_bram, 
  data_out_sp_bram, w_enable_sp_bram, data_in_sp_bram, addr_a_bram, enable_a_bram, 
  data_out_a_bram, addr_w_bram, enable_w_bram, data_out_w_bram, addr_o_bram, enable_o_bram, 
  w_enable_o_bram, data_in_o_bram)
/* synthesis syn_black_box black_box_pad_pin="clk,addr_sp_bram[31:0],enable_sp_bram,data_out_sp_bram[31:0],w_enable_sp_bram[3:0],data_in_sp_bram[31:0],addr_a_bram[31:0],enable_a_bram,data_out_a_bram[31:0],addr_w_bram[31:0],enable_w_bram,data_out_w_bram[31:0],addr_o_bram[31:0],enable_o_bram,w_enable_o_bram[3:0],data_in_o_bram[31:0]" */;
  input clk;
  output [31:0]addr_sp_bram;
  output enable_sp_bram;
  input [31:0]data_out_sp_bram;
  output [3:0]w_enable_sp_bram;
  output [31:0]data_in_sp_bram;
  output [31:0]addr_a_bram;
  output enable_a_bram;
  input [31:0]data_out_a_bram;
  output [31:0]addr_w_bram;
  output enable_w_bram;
  input [31:0]data_out_w_bram;
  output [31:0]addr_o_bram;
  output enable_o_bram;
  output [3:0]w_enable_o_bram;
  output [31:0]data_in_o_bram;
endmodule
