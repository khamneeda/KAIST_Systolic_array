-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
-- Date        : Fri Dec  1 05:04:30 2023
-- Host        : ac441d3eae35 running 64-bit Ubuntu 22.04.3 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ fpga_mat_mul_system_0_0_stub.vhdl
-- Design      : fpga_mat_mul_system_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    clk : in STD_LOGIC;
    addr_sp_bram : out STD_LOGIC_VECTOR ( 31 downto 0 );
    enable_sp_bram : out STD_LOGIC;
    data_out_sp_bram : in STD_LOGIC_VECTOR ( 31 downto 0 );
    w_enable_sp_bram : out STD_LOGIC_VECTOR ( 3 downto 0 );
    data_in_sp_bram : out STD_LOGIC_VECTOR ( 31 downto 0 );
    addr_a_bram : out STD_LOGIC_VECTOR ( 31 downto 0 );
    enable_a_bram : out STD_LOGIC;
    data_out_a_bram : in STD_LOGIC_VECTOR ( 31 downto 0 );
    addr_w_bram : out STD_LOGIC_VECTOR ( 31 downto 0 );
    enable_w_bram : out STD_LOGIC;
    data_out_w_bram : in STD_LOGIC_VECTOR ( 31 downto 0 );
    addr_o_bram : out STD_LOGIC_VECTOR ( 31 downto 0 );
    enable_o_bram : out STD_LOGIC;
    w_enable_o_bram : out STD_LOGIC_VECTOR ( 3 downto 0 );
    data_in_o_bram : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,addr_sp_bram[31:0],enable_sp_bram,data_out_sp_bram[31:0],w_enable_sp_bram[3:0],data_in_sp_bram[31:0],addr_a_bram[31:0],enable_a_bram,data_out_a_bram[31:0],addr_w_bram[31:0],enable_w_bram,data_out_w_bram[31:0],addr_o_bram[31:0],enable_o_bram,w_enable_o_bram[3:0],data_in_o_bram[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "mat_mul_system,Vivado 2022.2";
begin
end;
