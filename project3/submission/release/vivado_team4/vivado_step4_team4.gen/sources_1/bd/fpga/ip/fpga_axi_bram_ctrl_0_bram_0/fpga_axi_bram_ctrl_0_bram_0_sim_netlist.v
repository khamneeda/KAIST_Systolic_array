// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Nov 23 09:38:13 2023
// Host        : b58ffcd424ed running 64-bit Ubuntu 22.04.3 LTS
// Command     : write_verilog -force -mode funcsim -rename_top fpga_axi_bram_ctrl_0_bram_0 -prefix
//               fpga_axi_bram_ctrl_0_bram_0_ CS411_task1_axi_bram_ctrl_0_bram_0_sim_netlist.v
// Design      : CS411_task1_axi_bram_ctrl_0_bram_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "CS411_task1_axi_bram_ctrl_0_bram_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module fpga_axi_bram_ctrl_0_bram_0
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
  fpga_axi_bram_ctrl_0_bram_0_blk_mem_gen_v8_4_5 U0
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
ePqtunjvkd2KPHU7e0G6l5dmis+M5Cxl0Cg=
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
