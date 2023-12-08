// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Nov 23 09:38:13 2023
// Host        : b58ffcd424ed running 64-bit Ubuntu 22.04.3 LTS
// Command     : write_verilog -force -mode funcsim -rename_top fpga_axi_bram_ctrl_1_bram_0 -prefix
//               fpga_axi_bram_ctrl_1_bram_0_ CS411_task1_axi_bram_ctrl_0_bram_0_sim_netlist.v
// Design      : CS411_task1_axi_bram_ctrl_0_bram_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "CS411_task1_axi_bram_ctrl_0_bram_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module fpga_axi_bram_ctrl_1_bram_0
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
  fpga_axi_bram_ctrl_1_bram_0_blk_mem_gen_v8_4_5 U0
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
ssdyOJ00wcCSSaPW6Cmz7wdlE32EZ60lkMA=
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
