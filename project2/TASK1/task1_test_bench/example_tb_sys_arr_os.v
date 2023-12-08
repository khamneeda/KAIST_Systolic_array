`timescale 100ns/1ns
/*  This is the example code. 
    You may need to check your module's functionality via test_bench 
    This will help you write tb. */
module tb_sys_arr_os #(
    parameter integer   ACT_WIDTH       = 8,
    parameter integer   WGT_WIDTH       = 8, 
    parameter integer   MULT_OUT_WIDTH  = ACT_WIDTH + WGT_WIDTH,
    parameter integer   PE_OUT_WIDTH    = 32,
    parameter integer   SYS_ARR_SIZE    = 8
);
    reg clk;
    reg reset, sys_reset;
    reg [2:0] operation_signal_in;

    reg [ ACT_WIDTH * SYS_ARR_SIZE - 1 : 0]     act_data_in;
    reg [ WGT_WIDTH * SYS_ARR_SIZE - 1 : 0]     wgt_data_in;
    reg [ PE_OUT_WIDTH * SYS_ARR_SIZE - 1 : 0]  result_in;

    wire [ PE_OUT_WIDTH * SYS_ARR_SIZE - 1 : 0] result_out;

    wire [ ACT_WIDTH * SYS_ARR_SIZE - 1 : 0]     act_data_in_sys;
    wire [ WGT_WIDTH * SYS_ARR_SIZE - 1 : 0]     wgt_data_in_sys;
    wire [ PE_OUT_WIDTH * SYS_ARR_SIZE - 1 : 0] result_out_sys;

    genvar i;
    generate
        for (i = 0; i < SYS_ARR_SIZE; i = i + 1) begin
            assign act_data_in_sys[ACT_WIDTH * (SYS_ARR_SIZE - i - 1) + ACT_WIDTH - 1 : ACT_WIDTH * (SYS_ARR_SIZE - i - 1)] = act_data_in[ACT_WIDTH * i + ACT_WIDTH - 1 : ACT_WIDTH * i];
            assign wgt_data_in_sys[WGT_WIDTH * (SYS_ARR_SIZE - i - 1) + WGT_WIDTH - 1 : WGT_WIDTH * (SYS_ARR_SIZE - i - 1)] = wgt_data_in[WGT_WIDTH * i + WGT_WIDTH - 1 : WGT_WIDTH * i];
            assign result_out[PE_OUT_WIDTH * (SYS_ARR_SIZE - i - 1) + PE_OUT_WIDTH - 1 : PE_OUT_WIDTH * (SYS_ARR_SIZE - i - 1)] = result_out_sys[PE_OUT_WIDTH * i + PE_OUT_WIDTH - 1 : PE_OUT_WIDTH * i];
        end
    endgenerate

    sys_arr sys_arr_(
        .clk(clk),
        .reset(reset),
        .sys_reset(sys_reset),
        .operation_signal_in(operation_signal_in),
        .act_data_in(act_data_in_sys),
        .wgt_data_in(wgt_data_in_sys),
        .initial_result_in(result_in),
        .final_result_out(result_out_sys)
    );

    /*

    6*7  *  7*8

# activation 행렬
activation = [
    [4, 1, 2, 3, 8, 9, 7],
    [8, 1, 2, 3, 1, 4, 5],
    [8, 9, 2, 1, 5, 5, 1],
    [7, 0, 1, 5, 3, 2, 0],
    [9, 2, 5, 3, 2, 6, 4],
    [8, 6, 5, 9, 5, 9, 3]
]

# weight 행렬
weight = [
    [1, 6, 2, 4, 8, 4, 2, 6],
    [1, 6, 8, 3, 6, 3, 2, 4],
    [5, 4, 5, 2, 5, 3, 1, 2],
    [1, 4, 2, 7, 3, 4, 2, 3],
    [9, 6, 2, 2, 3, 4, 1, 2],
    [5, 2, 3, 5, 7, 1, 5, 2],
    [4, 3, 2, 4, 1, 2, 3, 5],
]

    result:
    [[163 137  89 133 151  92  92 110]
    [ 71 103  64 102 125  71  62 100]
    [102 157 127 109 182  96  71 116]
    [ 54  88  41  81  99  65  38  69]
    [103 134  95 123 170  91  77 117]
    [150 197 150 190 233 136 110 152]]

// format: xyz,  x: ws-0/os-1, y: os flow-0/drain-1, z: ws flow-0/load-1
    */

    initial begin
        clk = 0;
        reset = 1;
        sys_reset = 1;
        operation_signal_in=3'b100; // os flow
        act_data_in =0;
        wgt_data_in =0;
        result_in =0;
        #1
        reset=0;
        sys_reset = 0;
        #4
        reset = 0;
        
        
        // os
        // outstream 없어서 순서대로 안나옴
        //   M,K,N 지정 안해줘서 나오는 타이밍 맞춰서 봐야함
        //각 6 7 8
        /*
        activation = [
            [4, 1, 2, 3, 8, 9, 7],
            [8, 1, 2, 3, 1, 4, 5],
            [8, 9, 2, 1, 5, 5, 1],
            [7, 0, 1, 5, 3, 2, 0],
            [9, 2, 5, 3, 2, 6, 4],
            [8, 6, 5, 9, 5, 9, 3]
        ]
        weight = [
            [1, 6, 2, 4, 8, 4, 2, 6],
            [1, 6, 8, 3, 6, 3, 2, 4],
            [5, 4, 5, 2, 5, 3, 1, 2],
            [1, 4, 2, 7, 3, 4, 2, 3],
            [9, 6, 2, 2, 3, 4, 1, 2],
            [5, 2, 3, 5, 7, 1, 5, 2],
            [4, 3, 2, 4, 1, 2, 3, 5],
        ]
        wgt_data_in = {8'd1, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0};
        wgt_data_in = {8'd1, 8'd6, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0};
        wgt_data_in = {8'd5, 8'd6, 8'd2, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0};
        wgt_data_in = {8'd1, 8'd4, 8'd8, 8'd4, 8'b0, 8'b0, 8'b0, 8'b0};
        wgt_data_in = {8'd9, 8'd4, 8'd5, 8'd3, 8'd8, 8'b0, 8'b0, 8'b0};
        wgt_data_in = {8'd5, 8'd6, 8'd2, 8'd2, 8'd6, 8'd4, 8'b0, 8'b0};
        wgt_data_in = {8'd4, 8'd2, 8'd2, 8'd7, 8'd5, 8'd3, 8'd2, 8'b0};
        wgt_data_in = {8'b0, 8'd3, 8'd3, 8'd2, 8'd3, 8'd3, 8'd2, 8'd6};
        wgt_data_in = {8'b0, 8'b0, 8'd2, 8'd5, 8'd3, 8'd4, 8'd1, 8'd4};
        wgt_data_in = {8'b0, 8'b0, 8'b0, 8'd4, 8'd7, 8'd4, 8'd2, 8'd2};
        wgt_data_in = {8'b0, 8'b0, 8'b0, 8'b0, 8'd1, 8'd1, 8'd1, 8'd3};
        wgt_data_in = {8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'd2, 8'd5, 8'd2};
        wgt_data_in = {8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'd3, 8'd2};
        wgt_data_in = {8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'd5};

        act_data_in = {8'd4, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0};
        act_data_in = {8'd1, 8'd8, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0};
        act_data_in = {8'd2, 8'd1, 8'd8, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0};
        act_data_in = {8'd3, 8'd2, 8'd9, 8'd7, 8'b0, 8'b0, 8'b0, 8'b0};
        act_data_in = {8'd8, 8'd3, 8'd2, 8'd0, 8'd9, 8'b0, 8'b0, 8'b0};
        act_data_in = {8'd9, 8'd1, 8'd1, 8'd1, 8'd2, 8'd8, 8'b0, 8'b0};
        act_data_in = {8'd7, 8'd4, 8'd5, 8'd5, 8'd5, 8'd6, 8'b0, 8'b0};
        act_data_in = {8'b0, 8'd5, 8'd5, 8'd3, 8'd3, 8'd5, 8'b0, 8'b0};
        act_data_in = {8'b0, 8'b0, 8'd1, 8'd2, 8'd2, 8'd9, 8'b0, 8'b0};
        act_data_in = {8'b0, 8'b0, 8'd0, 8'b0, 8'd6, 8'd5, 8'b0, 8'b0};
        act_data_in = {8'b0, 8'b0, 8'b0, 8'b0, 8'd4, 8'd9, 8'b0, 8'b0};
        act_data_in = {8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'd3, 8'b0, 8'b0};
        */

        //flow
        $display("----os flow----");
        //1st input
        act_data_in = {8'd4, 56'b0};
        wgt_data_in = {8'd1, 56'b0};
        #1
        //2nd input
        act_data_in = {8'd1, 8'd8, 48'b0};
        wgt_data_in = {8'd1, 8'd6, 48'b0};
        #1
        //3rd input
        act_data_in = {8'd2, 8'd1, 8'd8, 40'b0};
        wgt_data_in = {8'd5, 8'd6, 8'd2, 40'b0};
        #1
        //4th input
        act_data_in = {8'd3, 8'd2, 8'd9, 8'd7, 32'b0};
        wgt_data_in = {8'd1, 8'd4, 8'd8, 8'd4, 32'b0};
        #1
        //5th input
        act_data_in = {8'd8, 8'd3, 8'd2, 8'd0, 8'd9, 24'b0};
        wgt_data_in = {8'd9, 8'd4, 8'd5, 8'd3, 8'd8, 24'b0};
        #1
        //6th input
        act_data_in = {8'd9, 8'd1, 8'd1, 8'd1, 8'd2, 8'd8, 16'b0};
        wgt_data_in = {8'd5, 8'd6, 8'd2, 8'd2, 8'd6, 8'd4, 16'b0};
        #1
        //7th input
        act_data_in = {8'd7, 8'd4, 8'd5, 8'd5, 8'd5, 8'd6, 16'b0};
        wgt_data_in = {8'd4, 8'd2, 8'd2, 8'd7, 8'd5, 8'd3, 8'd2, 8'b0};
        #1
        //8th input
        act_data_in = {8'b0, 8'd5, 8'd5, 8'd3, 8'd3, 8'd5, 16'b0};
        wgt_data_in = {8'b0, 8'd3, 8'd3, 8'd2, 8'd3, 8'd3, 8'd2, 8'd6};
        #1
        //9th input
        act_data_in = {16'b0, 8'd1, 8'd2, 8'd2, 8'd9, 16'b0};
        wgt_data_in = {16'b0, 8'd2, 8'd5, 8'd3, 8'd4, 8'd1, 8'd4};
        #1
        //10th input
        act_data_in = {24'b0, 8'd0, 8'd6, 8'd5, 16'b0};
        wgt_data_in = {24'b0, 8'd4, 8'd7, 8'd4, 8'd2, 8'd2};
        #1
        //11th input
        act_data_in = {32'b0, 8'd4, 8'd9, 16'b0};
        wgt_data_in = {32'b0, 8'd1, 8'd1, 8'd1, 8'd3};
        #1
        //12th input
        act_data_in = {40'b0, 8'd3, 16'b0};
        wgt_data_in = {40'b0, 8'd2, 8'd5, 8'd2};
        #1
        //13th input
        wgt_data_in = {48'b0, 8'd3, 8'd2};
        act_data_in =0;
        #1
        //14th input
        wgt_data_in = {56'b0, 8'd5};
        #1
        wgt_data_in =0;
        /* Wait appropriate time to finish systolic array operation */
        #6
        $display("----os drain----");
        operation_signal_in=3'b110;
        #2
        
        // 1st output row
        if (result_out == {8'd150, 8'd197, 8'd150, 8'd190, 8'd233, 8'd136, 8'd110, 8'd152})
            $display("----PASS----");
        else begin
            $display("----FAIL____");
            $display("Result_out: %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
            $display("Correct result: %d, %d, %d, %d, %d, %d, %d, %d", 150,197,150,190,233,136,110,152);
        end

        // 2nd output row
        #1
        if (result_out == {8'd103, 8'd134, 8'd95, 8'd123, 8'd170, 8'd91, 8'd77, 8'd117})
            $display("----PASS----");
        else begin
            $display("----FAIL____");
            $display("Result_out: %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
            $display("Correct result: %d, %d, %d, %d, %d, %d, %d, %d", 103,134,95,123,170,91,77,117);
        end

        // 3rd output row
        #1
        if (result_out == {8'd54, 8'd88, 8'd41, 8'd81, 8'd99, 8'd65, 8'd38, 8'd69})
            $display("----PASS----");
        else begin
            $display("----FAIL____");
            $display("Result_out: %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
            $display("Correct result: %d, %d, %d, %d, %d, %d, %d, %d", 54,88,41,81,99,65,38,69);
        end

        // 4th output row
        #1
        if (result_out == {8'd102, 8'd157, 8'd127, 8'd109, 8'd182, 8'd96, 8'd71, 8'd116})
            $display("----PASS----");
        else begin
            $display("----FAIL____");
            $display("Result_out: %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
            $display("Correct result: %d, %d, %d, %d, %d, %d, %d, %d", 102,157,127,109,182,96,71,116);
        end

        // 5th output row
        #1
        if (result_out == {8'd71, 8'd103, 8'd64, 8'd102, 8'd125, 8'd71, 8'd62, 8'd100})
            $display("----PASS----");
        else begin
            $display("----FAIL____");
            $display("Result_out: %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
            $display("Correct result: %d, %d, %d, %d, %d, %d, %d, %d", 71,103,64,102,125,71,62, 100);
        end

        // 6th output row
        #1
        if (result_out == {8'd163, 8'd137, 8'd89, 8'd133, 8'd151, 8'd92, 8'd92, 8'd110})
            $display("----PASS----");
        else begin
            $display("----FAIL____");
            $display("Result_out: %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
            $display("Correct result: %d, %d, %d, %d, %d, %d, %d, %d", 163,137,89,133,151,92,92,110);
        end


    end
    always #0.5 clk = !clk;

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0, tb_sys_arr_os);
    end

endmodule