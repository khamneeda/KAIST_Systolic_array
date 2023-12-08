// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Nov 23 09:38:13 2023
// Host        : b58ffcd424ed running 64-bit Ubuntu 22.04.3 LTS
// Command     : write_verilog -force -mode funcsim -rename_top fpga_axi_bram_ctrl_2_bram_0 -prefix
//               fpga_axi_bram_ctrl_2_bram_0_ CS411_task1_axi_bram_ctrl_0_bram_0_sim_netlist.v
// Design      : CS411_task1_axi_bram_ctrl_0_bram_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "CS411_task1_axi_bram_ctrl_0_bram_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module fpga_axi_bram_ctrl_2_bram_0
   (clka,
    rsta,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    web,
    addrb,
    dinb,
    doutb,
    rsta_busy,
    rstb_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [31:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [3:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [31:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;
  output rsta_busy;
  output rstb_busy;

  wire [31:0]addra;
  wire [31:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire rsta;
  wire rsta_busy;
  wire rstb;
  wire rstb_busy;
  wire [3:0]wea;
  wire [3:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "32" *) 
  (* C_ADDRB_WIDTH = "32" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "1" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.7492 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "1" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "NONE" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "1" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  fpga_axi_bram_ctrl_2_bram_0_blk_mem_gen_v8_4_5 U0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra[12:2],1'b0,1'b0}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addrb[12:2],1'b0,1'b0}),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[31:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(rstb),
        .rstb_busy(rstb_busy),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[31:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 59648)
`pragma protect data_block
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
ftbU7THFvBDwNJU680TeUG5HOMsW6YPVgYY=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
