`timescale 100ns/1ns
module sys_arr
#(
    parameter integer   SYS_ARR_SIZE    = 8,
    parameter integer   ACT_WIDTH       = 16,
    parameter integer   WGT_WIDTH       = 16, 
    parameter integer   MULT_OUT_WIDTH  = ACT_WIDTH + WGT_WIDTH,
    parameter integer   PE_OUT_WIDTH    = 32,
    parameter integer   OP_SIG_WIDTH    = 3
)
(
    input  wire                         clk,
    input  wire                         reset,

    input wire  [ OP_SIG_WIDTH   -1 : 0]                operation_signal_in, // format: xyz,  x: ws-0/os-1, y: os flow-0/drain-1, z: ws flow-0/load-1
    input wire  [ ACT_WIDTH * SYS_ARR_SIZE - 1 : 0]     act_data_in, // A data
    input wire  [ WGT_WIDTH * SYS_ARR_SIZE - 1 : 0]     wgt_data_in,  // weight
    input wire  [ PE_OUT_WIDTH * SYS_ARR_SIZE - 1 : 0]  initial_result_in,
    output wire [ PE_OUT_WIDTH * SYS_ARR_SIZE - 1 : 0]  final_result_out
);
wire [PE_OUT_WIDTH -1 : 0] result_wire [0 : SYS_ARR_SIZE + 1][0: SYS_ARR_SIZE - 1];
wire [WGT_WIDTH -1 : 0] wgt_wire [0 : SYS_ARR_SIZE][0: SYS_ARR_SIZE - 1];
wire [ACT_WIDTH -1 : 0] act_wire [0 : SYS_ARR_SIZE - 1][0: SYS_ARR_SIZE];

genvar i, j;
generate
    for (i = 0; i < SYS_ARR_SIZE; i = i + 1) begin
        for (j = 0; j < SYS_ARR_SIZE; j = j + 1) begin
            pe #(
                .ACT_WIDTH(ACT_WIDTH),
                .WGT_WIDTH(WGT_WIDTH),
                .MULT_OUT_WIDTH(MULT_OUT_WIDTH),
                .PE_OUT_WIDTH(PE_OUT_WIDTH),
                .OP_SIG_WIDTH(OP_SIG_WIDTH)
            ) pe_ (
                .clk(clk),
                .reset(reset),
                .operation_signal_in(operation_signal_in),
                .act_data_in(act_wire[i][j+1]),
                .wgt_data_in(wgt_wire[i+1][j]),
                .result_in(result_wire[i][j]),
                .result_out(result_wire[i+1][j])
            );
            buffer #(
                .DATA_WIDTH(ACT_WIDTH)
            ) buffer_a (
                .reset(reset),
                .clk(clk),
                .in(act_wire[i][j]),
                .out(act_wire[i][j+1])
            );
            buffer #(
                .DATA_WIDTH(WGT_WIDTH)
            ) buffer_w (
                .reset(reset),
                .clk(clk),
                .in(wgt_wire[i][j]),
                .out(wgt_wire[i+1][j])
            );
        end
    end
    for (j=0; j < SYS_ARR_SIZE; j = j + 1) begin
        assign final_result_out[(j + 1) * PE_OUT_WIDTH - 1: j * PE_OUT_WIDTH] = result_wire[SYS_ARR_SIZE + 1][j];
        assign wgt_wire[0][j] = wgt_data_in[(j + 1) * WGT_WIDTH - 1: j * WGT_WIDTH];
        assign result_wire[0][j] = initial_result_in[(j + 1) * PE_OUT_WIDTH - 1: j * PE_OUT_WIDTH];
        buffer #(
            .DATA_WIDTH(PE_OUT_WIDTH)
        ) buffer_res (
            .reset(reset),
            .clk(clk),
            .in(result_wire[SYS_ARR_SIZE][j]),
            .out(result_wire[SYS_ARR_SIZE+1][j])
        );
    end
    for (i=0; i < SYS_ARR_SIZE; i = i + 1) begin
        assign act_wire[i][0] = act_data_in[(i + 1) * ACT_WIDTH - 1: i * ACT_WIDTH];
    end
endgenerate
  
endmodule