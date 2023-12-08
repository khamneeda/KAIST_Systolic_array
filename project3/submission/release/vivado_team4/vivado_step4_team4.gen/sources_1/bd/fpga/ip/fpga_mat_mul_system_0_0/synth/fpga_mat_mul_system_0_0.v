// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:mat_mul_system:1.0
// IP Revision: 1

(* X_CORE_INFO = "mat_mul_system,Vivado 2022.2" *)
(* CHECK_LICENSE_TYPE = "fpga_mat_mul_system_0_0,mat_mul_system,{}" *)
(* CORE_GENERATION_INFO = "fpga_mat_mul_system_0_0,mat_mul_system,{x_ipProduct=Vivado 2022.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=mat_mul_system,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,SYS_ARR_SIZE=8,ACT_DATA_WIDTH=16,WGT_DATA_WIDTH=16,PE_OUT_WIDTH=32,W_RAM_ADDR_WIDTH=10,A_RAM_ADDR_WIDTH=10,O_RAM_ADDR_WIDTH=10,INTEGER_BIT=10}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module fpga_mat_mul_system_0_0 (
  clk,
  addr_sp_bram,
  enable_sp_bram,
  data_out_sp_bram,
  w_enable_sp_bram,
  data_in_sp_bram,
  addr_a_bram,
  enable_a_bram,
  data_out_a_bram,
  addr_w_bram,
  enable_w_bram,
  data_out_w_bram,
  addr_o_bram,
  enable_o_bram,
  w_enable_o_bram,
  data_in_o_bram
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 1000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN fpga_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
output wire [31 : 0] addr_sp_bram;
output wire enable_sp_bram;
input wire [31 : 0] data_out_sp_bram;
output wire [3 : 0] w_enable_sp_bram;
output wire [31 : 0] data_in_sp_bram;
output wire [31 : 0] addr_a_bram;
output wire enable_a_bram;
input wire [31 : 0] data_out_a_bram;
output wire [31 : 0] addr_w_bram;
output wire enable_w_bram;
input wire [31 : 0] data_out_w_bram;
output wire [31 : 0] addr_o_bram;
output wire enable_o_bram;
output wire [3 : 0] w_enable_o_bram;
output wire [31 : 0] data_in_o_bram;

  mat_mul_system #(
    .SYS_ARR_SIZE(8),
    .ACT_DATA_WIDTH(16),
    .WGT_DATA_WIDTH(16),
    .PE_OUT_WIDTH(32),
    .W_RAM_ADDR_WIDTH(10),
    .A_RAM_ADDR_WIDTH(10),
    .O_RAM_ADDR_WIDTH(10),
    .INTEGER_BIT(10)
  ) inst (
    .clk(clk),
    .addr_sp_bram(addr_sp_bram),
    .enable_sp_bram(enable_sp_bram),
    .data_out_sp_bram(data_out_sp_bram),
    .w_enable_sp_bram(w_enable_sp_bram),
    .data_in_sp_bram(data_in_sp_bram),
    .addr_a_bram(addr_a_bram),
    .enable_a_bram(enable_a_bram),
    .data_out_a_bram(data_out_a_bram),
    .addr_w_bram(addr_w_bram),
    .enable_w_bram(enable_w_bram),
    .data_out_w_bram(data_out_w_bram),
    .addr_o_bram(addr_o_bram),
    .enable_o_bram(enable_o_bram),
    .w_enable_o_bram(w_enable_o_bram),
    .data_in_o_bram(data_in_o_bram)
  );
endmodule
