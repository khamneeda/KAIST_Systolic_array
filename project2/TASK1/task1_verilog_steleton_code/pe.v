/* PE.v */
`timescale 100ns/1ns
module pe #(
    parameter integer   ACT_WIDTH       = 16,
    parameter integer   WGT_WIDTH       = 16, 
    parameter integer   MULT_OUT_WIDTH  = ACT_WIDTH + WGT_WIDTH,
    parameter integer   PE_OUT_WIDTH    = 32,
    parameter integer   OP_SIG_WIDTH    = 3
) (
    input wire                                  clk, //clock
    input wire                                  reset, // reset bit
    input wire [ OP_SIG_WIDTH   -1 : 0]         operation_signal_in, // format: xyz,  x: ws-0/os-1, y: (os) flow-0/drain-1, z: (ws) load-1/flow-0
    input wire [ ACT_WIDTH      -1 : 0]         act_data_in, // A data
    input wire [ WGT_WIDTH      -1 : 0]         wgt_data_in,  // weight
    input wire [ PE_OUT_WIDTH   -1 : 0]         result_in, // result from previous PE
    output wire [ PE_OUT_WIDTH   -1 : 0]        result_out // result to next PE
    
);

    wire [PE_OUT_WIDTH -1 : 0] add_in, add_out, buffer_in, mul_out_cast;
    wire [MULT_OUT_WIDTH -1 : 0] w_in, a_in, mul_out;
    wire [WGT_WIDTH -1 : 0] w_load, w_mux;
    assign w_in = {{ACT_WIDTH {w_mux[WGT_WIDTH -1]}}, w_mux};
    assign a_in = {{WGT_WIDTH {act_data_in[ACT_WIDTH -1]}}, act_data_in};
    assign mul_out_cast = {{PE_OUT_WIDTH - MULT_OUT_WIDTH {mul_out[MULT_OUT_WIDTH -1]}}, mul_out};

    buffer #(
        .DATA_WIDTH(WGT_WIDTH)
    ) buffer_w (
        .reset(reset),
        .clk(clk),
        .in(operation_signal_in[0] ? wgt_data_in : w_load),
        .out(w_load)
    );

    mux #(
        .DATA_WIDTH(WGT_WIDTH)
    ) mux_w (
        .select_bit(operation_signal_in[2]),
        .input_a(w_load),
        .input_b(wgt_data_in),
        .result(w_mux)
    );

    multiplier #(
        .DATA_WIDTH(MULT_OUT_WIDTH)
    ) mul_ (
        .a(a_in),
        .b(w_in),
        .out(mul_out)
    );

    mux #(
        .DATA_WIDTH(PE_OUT_WIDTH)
    ) mux_add (
        .select_bit(operation_signal_in[2]),
        .input_a(result_in),
        .input_b(result_out),
        .result(add_in)
    );

    adder #(
        .DATA_WIDTH(PE_OUT_WIDTH)
    ) add_ (
        .a(mul_out_cast),
        .b(add_in),
        .out(add_out)
    );

    mux #(
        .DATA_WIDTH(PE_OUT_WIDTH)
    ) mux_buf (
        .select_bit(operation_signal_in[2] & operation_signal_in[1]),
        .input_a(add_out),
        .input_b(result_in),
        .result(buffer_in)
    );

    buffer #(
        .DATA_WIDTH(PE_OUT_WIDTH)
    ) buffer_ (
        .reset(reset),
        .clk(clk),
        .in(buffer_in),
        .out(result_out)
    );


endmodule

