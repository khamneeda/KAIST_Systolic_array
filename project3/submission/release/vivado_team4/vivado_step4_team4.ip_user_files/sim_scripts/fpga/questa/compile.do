vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_13
vlib questa_lib/msim/processing_system7_vip_v1_0_15
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/proc_sys_reset_v5_0_13
vlib questa_lib/msim/xlconstant_v1_1_7
vlib questa_lib/msim/smartconnect_v1_0
vlib questa_lib/msim/axi_register_slice_v2_1_27
vlib questa_lib/msim/axi_bram_ctrl_v4_1_7
vlib questa_lib/msim/blk_mem_gen_v8_4_5

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_13 questa_lib/msim/axi_vip_v1_1_13
vmap processing_system7_vip_v1_0_15 questa_lib/msim/processing_system7_vip_v1_0_15
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13
vmap xlconstant_v1_1_7 questa_lib/msim/xlconstant_v1_1_7
vmap smartconnect_v1_0 questa_lib/msim/smartconnect_v1_0
vmap axi_register_slice_v2_1_27 questa_lib/msim/axi_register_slice_v2_1_27
vmap axi_bram_ctrl_v4_1_7 questa_lib/msim/axi_bram_ctrl_v4_1_7
vmap blk_mem_gen_v8_4_5 questa_lib/msim/blk_mem_gen_v8_4_5

vlog -work xilinx_vip -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L smartconnect_v1_0 -L xilinx_vip "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"/home/user/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/user/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/user/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93  \
"/home/user/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr -mfcu  "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_13 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ffc2/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_15 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/fpga/ip/fpga_processing_system7_0_0/sim/fpga_processing_system7_0_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93  \
"../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93  \
"../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/fpga/ip/fpga_proc_sys_reset_0_0/sim/fpga_proc_sys_reset_0_0.vhd" \

vlog -work xlconstant_v1_1_7 -64 -incr -mfcu  "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/badb/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_0/sim/bd_b08f_one_0.v" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_1/sim/bd_b08f_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_2/sim/bd_b08f_arsw_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_3/sim/bd_b08f_rsw_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_4/sim/bd_b08f_awsw_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_5/sim/bd_b08f_wsw_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_6/sim/bd_b08f_bsw_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/be1f/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_7/sim/bd_b08f_s00mmu_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/4fd2/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_8/sim/bd_b08f_s00tr_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/637d/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_9/sim/bd_b08f_s00sic_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f38e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_10/sim/bd_b08f_s00a2s_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_11/sim/bd_b08f_sarn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_12/sim/bd_b08f_srn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_13/sim/bd_b08f_sawn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_14/sim/bd_b08f_swn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_15/sim/bd_b08f_sbn_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/9cc5/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_16/sim/bd_b08f_m00s2a_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_17/sim/bd_b08f_m00arn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_18/sim/bd_b08f_m00rn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_19/sim/bd_b08f_m00awn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_20/sim/bd_b08f_m00wn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_21/sim/bd_b08f_m00bn_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/6bba/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_22/sim/bd_b08f_m00e_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_23/sim/bd_b08f_m01s2a_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_24/sim/bd_b08f_m01arn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_25/sim/bd_b08f_m01rn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_26/sim/bd_b08f_m01awn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_27/sim/bd_b08f_m01wn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_28/sim/bd_b08f_m01bn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_29/sim/bd_b08f_m01e_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_30/sim/bd_b08f_m02s2a_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_31/sim/bd_b08f_m02arn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_32/sim/bd_b08f_m02rn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_33/sim/bd_b08f_m02awn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_34/sim/bd_b08f_m02wn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_35/sim/bd_b08f_m02bn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_36/sim/bd_b08f_m02e_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_37/sim/bd_b08f_m03s2a_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_38/sim/bd_b08f_m03arn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_39/sim/bd_b08f_m03rn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_40/sim/bd_b08f_m03awn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_41/sim/bd_b08f_m03wn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_42/sim/bd_b08f_m03bn_0.sv" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/ip/ip_43/sim/bd_b08f_m03e_0.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/bd_0/sim/bd_b08f.v" \

vlog -work axi_register_slice_v2_1_27 -64 -incr -mfcu  "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/fpga/ip/fpga_smartconnect_0_0/sim/fpga_smartconnect_0_0.v" \

vcom -work axi_bram_ctrl_v4_1_7 -64 -93  \
"../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f80b/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/fpga/ip/fpga_axi_bram_ctrl_0_0/sim/fpga_axi_bram_ctrl_0_0.vhd" \
"../../../bd/fpga/ip/fpga_axi_bram_ctrl_1_0/sim/fpga_axi_bram_ctrl_1_0.vhd" \
"../../../bd/fpga/ip/fpga_axi_bram_ctrl_2_0/sim/fpga_axi_bram_ctrl_2_0.vhd" \
"../../../bd/fpga/ip/fpga_axi_bram_ctrl_3_0/sim/fpga_axi_bram_ctrl_3_0.vhd" \

vlog -work blk_mem_gen_v8_4_5 -64 -incr -mfcu  "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/25a8/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ec67/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/ee60/hdl" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/f0b6/hdl/verilog" "+incdir+../../../../vivado_step4_team4.gen/sources_1/bd/fpga/ipshared/66be/hdl/verilog" "+incdir+/home/user/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/fpga/ip/fpga_axi_bram_ctrl_0_bram_0/sim/fpga_axi_bram_ctrl_0_bram_0.v" \
"../../../bd/fpga/ip/fpga_axi_bram_ctrl_1_bram_0/sim/fpga_axi_bram_ctrl_1_bram_0.v" \
"../../../bd/fpga/ip/fpga_axi_bram_ctrl_2_bram_0/sim/fpga_axi_bram_ctrl_2_bram_0.v" \
"../../../bd/fpga/ip/fpga_axi_bram_ctrl_3_bram_0/sim/fpga_axi_bram_ctrl_3_bram_0.v" \
"../../../bd/fpga/ip/fpga_xlconstant_0_0/sim/fpga_xlconstant_0_0.v" \
"../../../bd/fpga/ip/fpga_mat_mul_system_0_0/sim/fpga_mat_mul_system_0_0.v" \
"../../../bd/fpga/sim/fpga.v" \

vlog -work xil_defaultlib \
"glbl.v"

