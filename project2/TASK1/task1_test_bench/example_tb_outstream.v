`timescale 100ns/1ns
/*  This is the example code. 
    You may need to check your module's functionality via test_bench 
    This will help you write tb. */
module tb_outstream #(
    parameter integer   SYS_ARR_SIZE    = 8,
    parameter integer   ACT_WIDTH       = 8,
    parameter integer   WGT_WIDTH       = 8, 
    parameter integer   MULT_OUT_WIDTH  = ACT_WIDTH + WGT_WIDTH,
    parameter integer   PE_OUT_WIDTH    = 32 
);
    reg clk;
    reg reset;
    reg [2:0] operation_signal_in;
    reg [PE_OUT_WIDTH * SYS_ARR_SIZE - 1 : 0] result_in;
    
    wire [SYS_ARR_SIZE * SYS_ARR_SIZE * PE_OUT_WIDTH - 1 : 0] result_out;
    wire outstream_done;

    outstream #(
        .SYS_ARR_SIZE(SYS_ARR_SIZE),
        .ACT_WIDTH(ACT_WIDTH),
        .WGT_WIDTH(WGT_WIDTH),
        .MULT_OUT_WIDTH(MULT_OUT_WIDTH),
        .PE_OUT_WIDTH(PE_OUT_WIDTH),
        .OP_SIG_WIDTH(3)
    ) outstream_ (
        .clk(clk),
        .reset(reset),
        .M(3),
        .N(5),
        .K(4),
        .operation_signal_in(operation_signal_in),
        .result_in(result_in),
        .result_out(result_out),
        .outstream_done(outstream_done)
    );

    /*
    activation:
    4 1 6 3
    8 5 2 4
    3 7 9 2

    weight:
    1 6 2 4 3
    9 3 8 7 9
    5 4 0 3 1
    2 7 9 4 2

    result(os):
	49	72	43	53	33
	71	99	92	89	79
	115	89	80	96	85

    ws
                    85
                96  79
            80  89  33
        89  92  53  
    115 99  43 
    71  72
    49 


    {8{32'd666}}
    {7{32'd666}, 32'd49}
    {6{32'd666}, 32'd72, 32'd71}
    {5{32'd666}, 32'd43, 32'd99, 32'd115}
    {4{32'd666}, 32'd53, 32'd92, 32'd89, 32'd666}
    {3{32'd666}, 32'd33, 32'd89, 32'd80, 2{32'd666}}
    {3{32'd666}, 32'd79, 32'd96, 3{32'd666}}
    {3{32'd666}, 32'd85, 4{32'd666}}

    result_out : ws
    {32'd85, 32'd96, 32'd80, 32'd89, 32'd115, 32'd79, 32'd89, 32'd92, 32'd99, 32'd71, 32'd33, 32'd53, 32'd43, 32'd72, 32'd49}

    os
    {32'd33, 32'd53, 32'd43, 32'd72, 32'd49}
    {32'd79, 32'd89, 32'd92, 32'd99, 32'd71}
    {32'd85, 32'd96, 32'd80, 32'd89, 32'd115}

    */

    initial begin
        clk = 0;
        reset = 1;
        operation_signal_in=0;
        result_in =0;
        #1

        reset = 0;
        operation_signal_in='b001;
        result_in =0;
        #1
        $display("----WS flow start----");
        //clk_counter = 1
        operation_signal_in='b000;
        result_in = {64{32'd666}};   //fake_value
        #1
        //clk_counter = 2
        result_in = {64{32'd666}};   //fake_value
        #1
        //clk_counter = 3
        result_in = {64{32'd666}};   //fake_value
        #1
        //clk_counter = 4
        result_in = {64{32'd666}};   //fake_value
        #1
        //clk_counter = 5
        result_in = {64{32'd666}};   //fake_value
        #1
        //clk_counter = 6
        result_in = {64{32'd666}};   //fake_value
        #1
        //clk_counter = 7
        result_in = {64{32'd666}};   //fake_value
        #1
        //clk_counter = 8
        result_in = {64{32'd666}};   //fake_value
        #1
        //clk_counter = 9, clk_index = 0
        result_in = {{63{32'd666}}, 32'd49}; //first_row
        #1
        if(result_out == {{63{32'd0}}, 32'd49}) begin
            $display("  PASS  ");
            $display("You've got : %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
        end else begin
            $display("  FAIL  ");
            $display("You've got : %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
        end
        //clk_counter = 10, clk_index = 1
        result_in = {{62{32'd666}}, 32'd72, 32'd71}; //second_row
        #1
        if(result_out == {{58{32'd0}}, 32'd71, {3{32'd0}}, 32'd72, 32'd49}) begin
            $display("  PASS  ");
            $display("You've got : %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
        end else begin
            $display("  FAIL  ");
            $display("You've got : %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
        end        
        //clk_counter = 11, clk_index = 2
        result_in = {{61{32'd666}}, 32'd43, 32'd99, 32'd115}; //third_row
        #1
        if(result_out == {{53{32'd0}}, 32'd115, {3{32'd0}}, 32'd99, 32'd71, {2{32'd0}}, 32'd43, 32'd72, 32'd49}) begin
            $display("  PASS  ");
            $display("You've got : %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
        end else begin
            $display("  FAIL  ");
            $display("You've got : %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
        end 
        //clk_counter = 12, clk_index = 3
        result_in = {{60{32'd666}}, 32'd53, 32'd92, 32'd89, {1{32'd666}}}; //fourth_row
        #1
        if(result_out == {{48{32'd0}}, 32'd89 ,32'd115, {2{32'd0}}, 32'd92, 32'd99, 32'd71, 32'd0, 32'd53, 32'd43, 32'd72, 32'd49}) begin
            $display("  PASS  ");
            $display("You've got : %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
        end else begin
            $display("  FAIL  ");
            $display("You've got : %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
        end        
        //clk_counter = 13, clk_index = 4
        result_in = {{59{32'd666}}, 32'd33, 32'd89, 32'd80, {2{32'd666}}}; //fifth_row
        #1
        if(result_out == {{43{32'd0}}, 32'd80, 32'd89 ,32'd115, 32'd0, 32'd89, 32'd92, 32'd99, 32'd71, 32'd33, 32'd53, 32'd43, 32'd72, 32'd49}) begin
            $display("  PASS  ");
            $display("You've got : %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
        end else begin
            $display("  FAIL  ");
            $display("You've got : %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
        end 
        //clk_counter = 14, clk_index = 5
        result_in = {{59{32'd666}}, 32'd79, 32'd96, {3{32'd666}}}; //sixth_row
        #1
        if(result_out == {{38{32'd0}}, 32'd96, 32'd80, 32'd89 ,32'd115, 32'd79, 32'd89, 32'd92, 32'd99, 32'd71, 32'd33, 32'd53, 32'd43, 32'd72, 32'd49}) begin
            $display("  PASS  ");
            $display("You've got : %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
        end else begin
            $display("  FAIL  ");
            $display("You've got : %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
        end 
        //clk_counter = 15, clk_index = 6
        result_in = {{59{32'd666}}, 32'd85, {4{32'd666}}}; //seventh_row
        
        #1
        //clk_counter = 16, clk_index = 7, finish
        result_in = {64{32'd666}}; // fake_value

        if(result_out == {{33{32'd0}}, 32'd85, 32'd96, 32'd80, 32'd89 ,32'd115, 32'd79, 32'd89, 32'd92, 32'd99, 32'd71, 32'd33, 32'd53, 32'd43, 32'd72, 32'd49}) begin
            $display("  PASS  ");
            $display("You've got : %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
        end else begin
            $display("  FAIL  ");
            $display("You've got : %d, %d, %d, %d, %d, %d, %d, %d", result_out[255:224], result_out[223:192], result_out[191:160], result_out[159:128], result_out[127:96], result_out[95:64], result_out[63:32], result_out[31:0]);
        end 

        if(outstream_done == 1) begin
            $display("outstream  PASS  ");
        end else begin
            $display("outstream  FAIL  ");
        end
        #1
        result_in = {64{32'd666}}; // fake_value
        if(result_out == {{33{32'd0}}, 32'd85, 32'd96, 32'd80, 32'd89 ,32'd115, 32'd79, 32'd89, 32'd92, 32'd99, 32'd71, 32'd33, 32'd53, 32'd43, 32'd72, 32'd49}) begin
            $display("  PASS  ");
        end else begin
            $display("  FAIL  ");
        end
        if(outstream_done == 1) begin
            $display("  PASS  ");
        end else begin
            $display("  FAIL  ");
        end
        #1
        result_in = {64{32'd666}}; // fake_value
        if(result_out == {{33{32'd0}}, 32'd85, 32'd96, 32'd80, 32'd89 ,32'd115, 32'd79, 32'd89, 32'd92, 32'd99, 32'd71, 32'd33, 32'd53, 32'd43, 32'd72, 32'd49}) begin
            $display("  PASS  ");
        end else begin
            $display("  FAIL  ");
        end
        if(outstream_done == 1) begin
            $display("  PASS  ");
        end else begin
            $display("  FAIL  ");
        end

        #1
        reset = 1;
        #1
        reset=0;
        operation_signal_in='b100;
        result_in = {64{32'd666}}; //fake_value
        #1
        $display("----OS flow start----");
        //clk_counter = 1
        operation_signal_in='b110;
        result_in = {64{32'd666}}; //fake_value
        #1
        //clk_counter = 2
        result_in = {64{32'd666}}; //fake_value
        #1
        //clk_counter = 3
        result_in = {64{32'd666}}; //fake_value
        #1
        //clk_counter = 4
        result_in = {64{32'd666}}; //fake_value
        #1
        //clk_counter = 5
        result_in = {64{32'd666}}; //fake_value
        #1
        //clk_counter = 6, clk_index = 0
        result_in = {32'd85, 32'd96, 32'd80, 32'd89, 32'd115}; 
        #1
        if(result_out == {{33{32'd0}}, 32'd85, 32'd96, 32'd80, 32'd89 ,32'd115, {10{32'd0}}}) begin
            $display("  PASS  ");
        end else begin
            $display("  FAIL  ");
        end
        //clk_counter = 7, clk_index = 1
        result_in = {32'd79, 32'd89, 32'd92, 32'd99, 32'd71}; 
        #1
        if(result_out == {{33{32'd0}}, 32'd85, 32'd96, 32'd80, 32'd89 ,32'd115, 32'd79, 32'd89, 32'd92, 32'd99, 32'd71, {5{32'd0}}}) begin
            $display("  PASS  ");
        end else begin
            $display("  FAIL  ");
        end
        //clk_counter = 8, clk_index = 2
        result_in = {32'd33, 32'd53, 32'd43, 32'd72, 32'd49};
        #1
        if(result_out == {{33{32'd0}}, 32'd85, 32'd96, 32'd80, 32'd89 ,32'd115, 32'd79, 32'd89, 32'd92, 32'd99, 32'd71, 32'd33, 32'd53, 32'd43, 32'd72, 32'd49}) begin
            $display("  PASS  ");
        end else begin
            $display("  FAIL  ");
        end
        if(outstream_done == 1) begin
            $display("  PASS  ");
        end else begin
            $display("  FAIL  ");
        end




    end
    always #0.5 clk = !clk;

endmodule
