// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Nov 23 09:38:13 2023
// Host        : b58ffcd424ed running 64-bit Ubuntu 22.04.3 LTS
// Command     : write_verilog -force -mode funcsim -rename_top fpga_axi_bram_ctrl_3_bram_0 -prefix
//               fpga_axi_bram_ctrl_3_bram_0_ CS411_task1_axi_bram_ctrl_0_bram_0_sim_netlist.v
// Design      : CS411_task1_axi_bram_ctrl_0_bram_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "CS411_task1_axi_bram_ctrl_0_bram_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module fpga_axi_bram_ctrl_3_bram_0
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
  fpga_axi_bram_ctrl_3_bram_0_blk_mem_gen_v8_4_5 U0
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
o84uwraw5/NiSmPbLNGrs0HMoaLeX1x3QkE=
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
