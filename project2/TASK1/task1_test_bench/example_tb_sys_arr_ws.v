`timescale 100ns/1ns
/*  This is the example code. 
    You may need to check your module's functionality via test_bench 
    This will help you write tb. */
module tb_sys_arr_ws #(
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
    activation:
    4 1 2 3 8 9 7 7
    8 1 2 3 1 4 2 5
    8 9 2 1 5 5 2 1
    7 0 1 5 3 2 5 0
    9 2 5 3 2 6 1 4
    8 6 5 9 5 9 1 3
    4 1 5 1 3 1 2 5
    8 6 6 0 6 8 7 9

    weight:
    1 6 2 4 8 4 2 6
    1 6 8 3 6 3 2 4
    5 4 5 2 5 3 1 2
    1 4 2 7 3 4 2 3
    9 6 2 2 3 4 1 2
    5 2 3 5 7 1 5 2
    4 3 2 4 1 2 3 5
    4 5 6 1 3 4 2 1

    result:
    [191 172 131 140 172 120 106 117]
    [ 79 119  88  95 137  85  63  90]
    [110 165 135 114 186 102  76 122]
    [ 74 103  51 101 104  75  53  94]
    [107 145 113 115 179 101  76 106]
    [154 206 164 185 240 144 110 145]
    [ 91 105  86  60  99  75  41  64]
    [202 226 198 151 238 150 119 156]

    */

    initial begin
        clk = 1;
        reset = 1;
        sys_reset = 1;
        operation_signal_in=0;
        act_data_in = 0;
        wgt_data_in =0;
        result_in =0;
        #1
        reset = 0;
        #4

        // weight preload
        $display("----w_load----");
        act_data_in ={ACT_WIDTH * SYS_ARR_SIZE{1'b0}};
        result_in ={(PE_OUT_WIDTH * SYS_ARR_SIZE){1'b0}};
    
        // 8th row
        wgt_data_in ={8'd4, 8'd5, 8'd6, 8'd1, 8'd3, 8'd4, 8'd2, 8'd1};
        #1
        // 7th row
        wgt_data_in ={8'd4, 8'd3, 8'd2, 8'd4, 8'd1, 8'd2, 8'd3, 8'd5};
        #1
        // 6th row
        wgt_data_in ={8'd5, 8'd2, 8'd3, 8'd5, 8'd7, 8'd1, 8'd5, 8'd2};
        #1
        // 5th row
        wgt_data_in ={8'd9, 8'd6, 8'd2, 8'd2, 8'd3, 8'd4, 8'd1, 8'd2};
        #1
        // 4th row
        wgt_data_in ={8'd1, 8'd4, 8'd2, 8'd7, 8'd3, 8'd4, 8'd2, 8'd3};
        #1
        // 3rd row
        wgt_data_in ={8'd5, 8'd4, 8'd5, 8'd2, 8'd5, 8'd3, 8'd1, 8'd2};
        #1
        // 2nd row
        wgt_data_in ={8'd1, 8'd6, 8'd8, 8'd3, 8'd6, 8'd3, 8'd2, 8'd4};
        #1
        // 1st row
        wgt_data_in ={8'd1, 8'd6, 8'd2, 8'd4, 8'd8, 8'd4, 8'd2, 8'd6};
        #1
        sys_reset = 0;
        operation_signal_in= 3'b001;
        #1

        //activation flow
        $display("----a_flow----");
        operation_signal_in=3'b000;

        // 1st input
        act_data_in = {8'd4, 56'b0};
        #1

        // 2nd input
        act_data_in = {8'd8, 8'd1, 48'b0};
        #1

        // 3rd input
        act_data_in = {8'd8, 8'd1, 8'd2, 40'b0};
        #1

        // 4th input
        act_data_in = {8'd7, 8'd9, 8'd2, 8'd3, 32'b0};
        #1

        // 5th input
        act_data_in = {8'd9, 8'd0, 8'd2, 8'd3, 8'd8, 24'b0};
        #1

        // 6th input
        act_data_in = {8'd8, 8'd2, 8'd1, 8'd1, 8'd1, 8'd9, 16'b0};
        #1

        // 7th input
        act_data_in = {8'd4, 8'd6, 8'd5, 8'd5, 8'd5, 8'd4, 8'd7, 8'b0};
        #1

        // 8th input, 1st output
        act_data_in = {8'd8, 8'd1, 8'd5, 8'd3, 8'd3, 8'd5, 8'd2, 8'd7};
        #1

        // 9th input, 2nd output
        act_data_in = {8'b0, 8'd6, 8'd5, 8'd9, 8'd2, 8'd2, 8'd2, 8'd5};

        #1

        // 10th input, 3rd output
        act_data_in = {16'b0, 8'd6, 8'd1, 8'd5, 8'd6, 8'd5, 8'd1};
        #1

        // 11th input, 4th output
        act_data_in = {24'b0, 8'd0, 8'd3, 8'd9, 8'd1, 8'd0};
        $display("result_out: %d", result_out);
        if(result_out[255:224] == {32'd191})
            $display("  PASS  ");
        else begin
            $display("  FAIL  ");
            $display("You've got : %d", result_out[255:224]);
            $display("Actual result is : %d", 191);
        end
            
        #1

        // 12th input, 5th output
        act_data_in = {32'b0, 8'd6, 8'd1, 8'd1, 8'd4};
        if(result_out[255:192] == {32'd79, 32'd172})
            $display("  PASS  ");
        else begin
            $display("  FAIL  ");
            $display("You've got : %d, %d", result_out[255:224], result_out[223:192]);
            $display("Actual result is : %d, %d", 79, 172);
        end
        #1

        // 13th input, 6th output
        act_data_in = {40'b0, 8'd8, 8'd2, 8'd3};
        if(result_out[255:160] == {32'd110, 32'd119, 32'd131})
            $display("  PASS  ");
        else begin
            $display("  FAIL  ");
            $display("You've got : %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160]);
            $display("Actual result is : %d, %d, %d", 110, 119, 131);
        end
            // $display("Actual result is : %d", 191);
        #1

        // 14th input, 7th output
        act_data_in = {48'b0, 8'd7, 8'd5};
        if(result_out[255:128] == {32'd74, 32'd165, 32'd88, 32'd140})
            $display("  PASS  ");
        else begin
            $display("  FAIL  ");
            $display("You've got : %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128]);
            $display("Actual result is : %d, %d, %d, %d", 74, 165, 88, 140);
        end
            // $display("Actual result is : %d", 191);
        #1


        // 15th input, 8th output
        act_data_in = {56'b0, 8'd9};
        if(result_out[255:96] == {32'd107, 32'd103, 32'd135, 32'd95, 32'd172})
            $display("  PASS  ");
        else begin
            $display("  FAIL  ");
            $display("You've got : %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96]);
            $display("Actual result is : %d, %d, %d, %d, %d", 107, 103, 135, 95, 172);
        end
            // $display("Actual result is : %d", 191);
        #1
        if(result_out[255:64] == {32'd154, 32'd145, 32'd51, 32'd114, 32'd137, 32'd120})
            $display("  PASS  ");
        else begin
            $display("  FAIL  "); 
            $display("You've got : %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64]);
            $display("Actual result is : %d, %d, %d, %d, %d, %d", 154, 145, 51, 114, 137, 120);    
        end
        // 9th output

            // $display("Actual result is : %d", 191);
        #1
        if(result_out[255:32] == {32'd91, 32'd206, 32'd113, 32'd101, 32'd186, 32'd85, 32'd106})
            $display("  PASS  ");
        else begin
            $display("  FAIL  "); 
            $display("You've got : %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32]);
            $display("Actual result is : %d, %d, %d, %d, %d, %d, %d", 91, 206, 113, 101, 186, 85, 106);        
        end
        // 10th output

            // $display("Actual result is : %d", 191);
        #1
        if(result_out == {32'd202, 32'd105, 32'd164, 32'd115, 32'd104, 32'd102, 32'd63, 32'd117})
            $display("  PASS  ");
        else begin
            $display("  FAIL  "); 
            $display("You've got : %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
            $display("Actual result is : %d, %d, %d, %d, %d, %d, %d, %d", 202, 105, 164, 115, 104, 102, 63, 117);   
        end
        // 11th output

            // $display("Actual result is : %d", 191);
        #1
        if(result_out[223:0] == {32'd226, 32'd86, 32'd185, 32'd179, 32'd75, 32'd76, 32'd90})
            $display("  PASS  ");
        else begin
            $display("  FAIL  "); 
            $display("You've got : %d, %d, %d, %d, %d, %d, %d", result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
            $display("Actual result is : %d, %d, %d, %d, %d, %d, %d", 226, 86, 185, 179, 75, 76, 90);   
        end
        // 12th output

            // $display("Actual result is : %d", 191);
        #1
        if(result_out[191:0] == {32'd198, 32'd60, 32'd240, 32'd101, 32'd53, 32'd122})
            $display("  PASS  ");
        else begin
            $display("  FAIL  "); 
            $display("You've got : %d, %d, %d, %d, %d, %d", result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
            $display("Actual result is : %d, %d, %d, %d, %d, %d", 198, 60, 240, 101, 53, 122);   
        end
        // 13th output

            // $display("Actual result is : %d", 191);
        #1
        if(result_out[159:0] == {32'd151, 32'd99, 32'd144, 32'd76, 32'd94})
            $display("  PASS  ");
        else begin
            $display("  FAIL  "); 
            $display("You've got : %d, %d, %d, %d, %d", result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
            $display("Actual result is : %d, %d, %d, %d, %d", 151, 99, 144, 76, 94);  
        end
        // 14th output

            // $display("Actual result is : %d", 191);
        #1
        if(result_out[127:0] == {32'd238, 32'd75, 32'd110, 32'd106})
            $display("  PASS  ");
        else begin
            $display("  FAIL  "); 
            $display("You've got : %d, %d, %d, %d", result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
            $display("Actual result is : %d, %d, %d, %d", 238, 75, 110, 106);  
        end
        // 15th output

            // $display("Actual result is : %d", 191);
        #1
        if(result_out[95:0] == {32'd150, 32'd41, 32'd145})
            $display("  PASS  ");
        else begin
            $display("  FAIL  "); 
            $display("You've got : %d, %d, %d", result_out[95:64], result_out[63:32], result_out[31:0]);
            $display("Actual result is : %d, %d, %d", 150, 41, 145);  
        end
        #1
        if(result_out[63:0] == {32'd119, 32'd64})
            $display("  PASS  ");
        else begin
            $display("  FAIL  "); 
            $display("You've got : %d, %d", result_out[63:32], result_out[31:0]);
            $display("Actual result is : %d, %d", 119, 64);  
        end
        #1;
        
        if(result_out[31:0] == {32'd156})
            $display("  PASS  ");
        else begin
            $display("  FAIL  "); 
            $display("You've got : %d", result_out[31:0]);
            $display("Actual result is : %d", 156);  
        end

    end
    always #0.5 clk = !clk;
    initial begin
        $dumpfile("testbench.vcd") ;
        $dumpvars(0, tb_sys_arr_ws);
    end
endmodule