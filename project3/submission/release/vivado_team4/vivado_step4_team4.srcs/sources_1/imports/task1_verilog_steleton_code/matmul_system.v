`timescale 100ns/1ns
module mat_mul_system #(
    /* You can freely add some parameters */
    /* Example:
        ARRAY_SIZE
        ACT_DATA_WIDTH (activation data width)
        WGT_DATA_WIDTH (weight data width)
        PE_OUT_WIDTH   (DP result width)
        RAM_SIZE    
    */    
    parameter integer SYS_ARR_SIZE     = 8,
    parameter integer ACT_DATA_WIDTH   = 16,
    parameter integer WGT_DATA_WIDTH   = 16,
    parameter integer PE_OUT_WIDTH     = 32,
    parameter integer W_RAM_ADDR_WIDTH = 10,
    parameter integer A_RAM_ADDR_WIDTH = 10,
    parameter integer O_RAM_ADDR_WIDTH = 10,
    parameter integer INTEGER_BIT      = 10

) (
    /* optional, you can use reset or not */
    //input wire reset,
    /* Below IO is fixed */
    input wire clk,
    
    /*Connection with SP_BRAM*/
    output wire [32-1:0]         addr_sp_bram,
    output wire                  enable_sp_bram,
    input wire [32-1:0]          data_out_sp_bram,  
    output wire [4-1 :0]         w_enable_sp_bram,
    output wire [32-1:0]         data_in_sp_bram,
    /* Connection with A_BRAM */
    output wire [32-1:0]        addr_a_bram,
    output wire                  enable_a_bram,
    input wire [32-1:0]         data_out_a_bram,
    /* Connection with W_BRAM */
    output wire [32-1:0]         addr_w_bram,
    output wire                  enable_w_bram,
    input wire [32-1:0]         data_out_w_bram,
    /* Connection with O_BRAM */
    output wire [32-1:0]         addr_o_bram,
    output wire                  enable_o_bram,
    output wire [4-1 :0]         w_enable_o_bram,
    output wire [32-1:0]         data_in_o_bram
);
    reg [2: 0] state;
    reg [10:0] counter;

    reg start_bit;
    reg internal_reset;
    reg ws_os;
    wire [2:0] operation_signal_in;

    // parameters for a_ram_address_generator
    reg a_ram_address_generator_enable;
    wire a_ram_address_generator_finish;

    // parameters for w_ram_address_generator
    reg w_ram_address_generator_enable;
    wire w_ram_address_generator_finish;

    // parameters for o_ram_address_generator
    reg o_ram_address_generator_enable;
    wire o_ram_address_generator_finish;

    // parameters for sys_control
    reg sys_exec_enable;
    wire sys_exec_finish;
    wire sys_reset;
    reg [INTEGER_BIT - 1: 0] a_x_index, a_y_index, w_x_index;
    reg add_req_reg;

    // BRAMs
    reg [32-1:0] addr_sp_bram_reg;
    wire [32 -1:0] _addr_a_bram, _addr_w_bram, _addr_o_bram;
    reg [32-1:0] data_in_sp_bram_reg;
    reg enable_sp_bram_reg;
    reg [4-1:0] w_enable_sp_bram_reg;

    reg [INTEGER_BIT-1:0] M, K, N;
    wire [INTEGER_BIT-1:0] tile_m, tile_k, tile_n;

    reg [INTEGER_BIT - 1 : 0] a_ram_moving_col_size, a_ram_moving_row_size, a_ram_moving_col_start_index, a_ram_moving_row_start_index, a_ram_moving_start_index;
    reg [INTEGER_BIT - 1 : 0] w_ram_moving_col_size, w_ram_moving_row_size, w_ram_moving_col_start_index, w_ram_moving_row_start_index, w_ram_moving_start_index;
    reg [INTEGER_BIT - 1 : 0] o_ram_moving_row_start_index;
    reg [O_RAM_ADDR_WIDTH - 1 : 0] o_ram_start_addr;

    // A ram array
    wire a_ram_read_req;
    wire [A_RAM_ADDR_WIDTH -1 : 0] a_ram_read_addr;
    reg [A_RAM_ADDR_WIDTH -1 : 0] a_ram_read_start_addr;
    wire [ACT_DATA_WIDTH * SYS_ARR_SIZE -1 : 0] a_ram_output_wire;
    wire [INTEGER_BIT -1 : 0] a_ram_max_addr_size;
    wire [INTEGER_BIT -1 : 0] a_ram_max_size;
    wire a_ram_addr_bias;
    wire a_ram_write_req;
    wire [A_RAM_ADDR_WIDTH -1 : 0] a_ram_write_addr;
    wire [INTEGER_BIT -1 : 0] a_ram_index;
    reg [ACT_DATA_WIDTH -1 : 0] a_ram_input_reg;

    // W ram array
    wire w_ram_read_req;
    wire [W_RAM_ADDR_WIDTH -1 : 0] w_ram_read_addr;
    reg [W_RAM_ADDR_WIDTH -1 : 0] w_ram_read_start_addr;
    wire [WGT_DATA_WIDTH * SYS_ARR_SIZE -1 : 0] w_ram_output_wire;
    wire [INTEGER_BIT -1 : 0] w_ram_max_addr_size;
    wire [INTEGER_BIT -1 : 0] w_ram_max_size;
    wire w_ram_addr_bias;
    wire w_ram_write_req;
    wire [W_RAM_ADDR_WIDTH -1 : 0] w_ram_write_addr;
    wire [INTEGER_BIT -1 : 0] w_ram_index;
    reg [WGT_DATA_WIDTH -1 : 0] w_ram_input_reg;

    //Systolic array
    wire [PE_OUT_WIDTH * SYS_ARR_SIZE -1 : 0] sys_output_wire;

    //O ram array
    wire o_ram_write_req;
    wire [O_RAM_ADDR_WIDTH - 1 : 0] o_ram_write_addr;
    reg [O_RAM_ADDR_WIDTH - 1 : 0] o_ram_write_start_addr;
    wire o_ram_addr_bias;
    wire o_ram_read_req;
    wire [INTEGER_BIT -1 : 0] o_ram_index;
    wire [O_RAM_ADDR_WIDTH - 1 : 0] o_ram_read_addr;

    always @(posedge clk) begin
        if (start_bit) begin
            case (state)
                3'b000: begin
                    // detect start bit and load M, K, N
                    if (data_out_sp_bram == 32'b1 || counter > 0) begin
                        case (counter)
                            0: begin // start signal padding
                                counter = counter + 1;
                            end
                            1: begin // start signal padding
                                counter = counter + 1;
                            end
                            2: begin // start signal padding
                                if (data_out_sp_bram == 32'b1)
                                    counter = counter + 1;
                                else
                                    counter = 0;
                            end
                            3: begin
                                w_enable_sp_bram_reg <= 0;
                                addr_sp_bram_reg <= 4;
                                counter = counter + 1;
                            end
                            4: begin
                                addr_sp_bram_reg <= 8;
                                counter = counter + 1;
                            end
                            5: begin
                                ws_os <= data_out_sp_bram[0];
                                addr_sp_bram_reg <= 12;
                                counter = counter + 1;
                            end
                            6: begin
                                M <= data_out_sp_bram[INTEGER_BIT -1 : 0];
                                addr_sp_bram_reg <= 16;
                                counter = counter + 1;
                            end
                            7: begin
                                K <= data_out_sp_bram[INTEGER_BIT -1 : 0];
                                counter = counter + 1;
                            end
                            8: begin
                                N <= data_out_sp_bram[INTEGER_BIT -1 : 0];
                                counter <= 0;
                                if(ws_os) begin//os 
                                    a_ram_moving_row_size <= K;
                                    a_ram_moving_col_size <= 8;
                                    w_ram_moving_row_size <= 8;
                                    w_ram_moving_col_size <= K;
                                    a_y_index <= 1;
                                end else begin
                                    a_ram_moving_row_size <= 8;
                                    a_ram_moving_col_size <= 8;
                                    w_ram_moving_row_size <= 8;
                                    w_ram_moving_col_size <= 8;
                                    a_x_index <= 1;
                                end
                                state <= 3'b001;
                            end
                        endcase
                    end
                end
                3'b001: begin
                    // read data from a_bram and w_bram to a_ram, w_ram
                    a_ram_address_generator_enable <= 1;
                    w_ram_address_generator_enable <= 1;
                    if ((w_ram_address_generator_enable && w_ram_address_generator_finish) && (a_ram_address_generator_enable && a_ram_address_generator_finish)) begin
                        w_ram_address_generator_enable <= 0;
                        a_ram_address_generator_enable <= 0;

                        if(ws_os) begin
                            if(a_ram_moving_col_start_index == (M - 8) && w_ram_moving_row_start_index == (N - 8))
                                state <= 3'b010;
                            else begin
                                if(a_ram_moving_col_start_index < (M - 8)) begin
                                    a_ram_moving_col_start_index = a_ram_moving_col_start_index + 8;
                                    a_ram_moving_start_index = a_ram_moving_start_index + K;
                                end

                                if(w_ram_moving_row_start_index < (N - 8)) begin
                                    w_ram_moving_row_start_index = w_ram_moving_row_start_index + 8;
                                    w_ram_moving_start_index = w_ram_moving_start_index + K;
                                end
                            end
                        end else begin
                            if(a_ram_moving_col_start_index == (M - 8) && a_ram_moving_row_start_index == (K - 8)
                                && w_ram_moving_col_start_index == (K - 8) && w_ram_moving_row_start_index == (N - 8))
                                state <= 3'b010;
                            else begin
                                if(a_ram_moving_col_start_index < (M - 8) || a_ram_moving_row_start_index < (K - 8)) begin
                                    if(a_ram_moving_row_start_index == (K - 8)) begin
                                        a_ram_moving_row_start_index = 0;
                                        a_ram_moving_col_start_index = a_ram_moving_col_start_index + 8;
                                    end else begin
                                        a_ram_moving_row_start_index = a_ram_moving_row_start_index + 8;
                                    end
                                    a_ram_moving_start_index = a_ram_moving_start_index + 8;
                                end

                                if(w_ram_moving_col_start_index < (K - 8) || w_ram_moving_row_start_index < (N - 8)) begin
                                    if(w_ram_moving_col_start_index == (K - 8)) begin
                                        w_ram_moving_col_start_index = 0;
                                        w_ram_moving_row_start_index = w_ram_moving_row_start_index + 8;
                                    end else begin
                                        w_ram_moving_col_start_index = w_ram_moving_col_start_index + 8;
                                    end
                                    w_ram_moving_start_index = w_ram_moving_start_index + 8;
                                end
                            end
                        end
                    end
                end
                3'b010: begin
                    // execute systolic arrays
                    sys_exec_enable <= 1;
                    if (sys_exec_enable && sys_exec_finish) begin
                        sys_exec_enable <= 0;

                        //ws
                        if (!ws_os) begin
                            if (a_x_index >= tile_k) begin
                                add_req_reg = 0;
                                if (a_y_index == tile_m -1) begin
                                    a_x_index = 0;
                                    a_y_index = 0;
                                    w_x_index = w_x_index + 1;
                                end else begin
                                    a_x_index = 0;
                                    a_y_index = a_y_index + 1;
                                end
                            end else begin
                                add_req_reg = 1;
                            end
                            if(w_x_index >= tile_n) begin
                                state <= 3'b011;
                            end
                            else begin
                                a_ram_read_start_addr = 8*(tile_k * a_y_index + a_x_index);
                                w_ram_read_start_addr = 8*(tile_k * w_x_index + a_x_index);
                                o_ram_write_start_addr = 8*(tile_m * w_x_index + a_y_index);
                                a_x_index = a_x_index + 1;
                            end
                        end
                        //os
                        else begin
                            if (a_y_index >= tile_m) begin
                                a_y_index = 0;
                                w_x_index = w_x_index + 1;
                                
                            end
                            if(w_x_index >= tile_n) begin
                                state <= 3'b011;
                            end
                            else begin
                                a_ram_read_start_addr = 8 *tile_k * a_y_index;
                                w_ram_read_start_addr = 8 *tile_k * w_x_index;
                                o_ram_write_start_addr = 8 *(tile_m * w_x_index + a_y_index);     
                                a_y_index = a_y_index + 1;
                            end
                        end
                        
                    end   
                end
                3'b011: begin
                    // o_ram to o_bram
                    o_ram_address_generator_enable <= 1;
                    if (o_ram_address_generator_enable && o_ram_address_generator_finish) begin
                        o_ram_address_generator_enable <= 0;

                        if(o_ram_moving_row_start_index == (N - 8))
                            state <= 3'b100;
                        else begin
                            o_ram_moving_row_start_index = o_ram_moving_row_start_index + 8;
                            o_ram_start_addr = o_ram_start_addr + M;
                        end
                    end
                end
                3'b100: begin
                    // finish o_bram write and prepare for end
                    enable_sp_bram_reg <= 1;
                    w_enable_sp_bram_reg <= 4'b1111;
                    case (counter)
                        0: begin
                            // turn off start signal for executing multiple times
                            addr_sp_bram_reg <= 0;
                            data_in_sp_bram_reg <= 0;
                            counter = counter + 1;
                        end
                        1: begin
                            // turn on start signal
                            addr_sp_bram_reg <= 100;
                            data_in_sp_bram_reg <= 1;
                            state <= 3'b101;
                        end
                    endcase
                end
                3'b101: begin
                    // reset
                    data_in_sp_bram_reg <= 0;
                    internal_reset <= 1;
                    state <= 3'b110;
                    counter <= 0;
                    addr_sp_bram_reg <= 0;
                    enable_sp_bram_reg <= 1;
                    w_enable_sp_bram_reg <= 4'b0000;
                    w_ram_address_generator_enable <= 0;
                    a_ram_address_generator_enable <= 0;
                    o_ram_address_generator_enable <= 0;
                    a_x_index <= 0;
                    a_y_index <= 0;
                    w_x_index <= 0;
                    a_ram_read_start_addr <= 0;
                    w_ram_read_start_addr <= 0;
                    o_ram_write_start_addr <= 0; 
                    add_req_reg <= 0;
                    sys_exec_enable <= 0;
                    o_ram_moving_row_start_index <= 0;
                    o_ram_start_addr <= 0;
                    a_ram_moving_row_start_index <= 0;
                    a_ram_moving_col_start_index <= 0;
                    a_ram_moving_start_index <= 0;
                    w_ram_moving_row_start_index <= 0;
                    w_ram_moving_col_start_index <= 0;
                    w_ram_moving_start_index <= 0;
                end
                3'b110: begin
                    internal_reset <= 0;
                    state <= 3'b000;
                end
            endcase
        end else begin
            // reset state
            data_in_sp_bram_reg <= 0;
            start_bit <= 1;
            state <= 3'b101;
            enable_sp_bram_reg <= 0;
            w_enable_sp_bram_reg <= 4'b0000;
        end
    end

    always @(posedge clk) begin
        a_ram_input_reg <= data_out_a_bram[ACT_DATA_WIDTH - 1 : 0];
        w_ram_input_reg <= data_out_w_bram[WGT_DATA_WIDTH - 1 : 0];
    end

    assign addr_sp_bram = addr_sp_bram_reg;
    assign addr_a_bram = _addr_a_bram * 4;
    assign addr_w_bram = _addr_w_bram * 4;
    assign addr_o_bram = _addr_o_bram * 4;

    assign tile_m = (M-1)/8 +1;
    assign tile_k = (K-1)/8 +1;
    assign tile_n = (N-1)/8 +1;
    
    assign enable_sp_bram = enable_sp_bram_reg;

    assign w_enable_sp_bram = w_enable_sp_bram_reg;
    assign w_enable_o_bram = {4 {enable_o_bram}};

    assign data_in_sp_bram = data_in_sp_bram_reg;

    ram_array_read_bias #(
        .DATA_WIDTH(WGT_DATA_WIDTH),
        .ADDR_WIDTH(W_RAM_ADDR_WIDTH),
        .ARRAY_SIZE(SYS_ARR_SIZE),
        .RAM_INDEX_ADDR_SIZE(INTEGER_BIT),
        .OUTPUT_REG(1)
    ) w_ram (
        .clk(clk),
        .reset(internal_reset),
        .addr_bias(w_ram_addr_bias),
        .max_addr_size(w_ram_max_addr_size),
        .max_ram_size(w_ram_max_size),
        .read_req(w_ram_read_req),
        .read_addr(w_ram_read_addr),
        .read_start_addr(w_ram_read_start_addr),
        .read_data(w_ram_output_wire),
        .write_req(w_ram_write_req),
        .write_addr(w_ram_write_addr),
        .write_ram_addr(w_ram_index),
        .write_data(w_ram_input_reg)
    );
    w_ram_address_generator #(
        .INTEGER_BIT(INTEGER_BIT),
        .W_RAM_ADDR_WIDTH(W_RAM_ADDR_WIDTH)
    ) w_ram_address_generator_ (
        .enable(w_ram_address_generator_enable),
        .finish(w_ram_address_generator_finish),
        .clk(clk),
        .ws_os(ws_os),
        .col_size(w_ram_moving_col_size),
        .row_size(w_ram_moving_row_size),
        .bram_col_size(K),
        .bram_row_size(N),
        .bram_col_start_index(w_ram_moving_col_start_index),
        .bram_row_start_index(w_ram_moving_row_start_index),
        .addr_w_bram(_addr_w_bram),
        .enable_w_bram(enable_w_bram),
        .w_ram_write_req(w_ram_write_req),
        .w_ram_write_addr(w_ram_write_addr),
        .w_ram_index_addr(w_ram_index),
        .w_ram_start_addr(w_ram_moving_start_index)
    );
    ram_array_read_bias #(
        .DATA_WIDTH(ACT_DATA_WIDTH),
        .ADDR_WIDTH(A_RAM_ADDR_WIDTH),
        .ARRAY_SIZE(SYS_ARR_SIZE),
        .RAM_INDEX_ADDR_SIZE(INTEGER_BIT),
        .OUTPUT_REG(1)
    ) a_ram (
        .clk(clk),
        .reset(internal_reset),
        .addr_bias(a_ram_addr_bias),
        .max_addr_size(a_ram_max_addr_size),
        .max_ram_size(a_ram_max_size),
        .read_req(a_ram_read_req),
        .read_addr(a_ram_read_addr),
        .read_start_addr(a_ram_read_start_addr),
        .write_ram_addr(a_ram_index),
        .read_data(a_ram_output_wire),
        .write_req(a_ram_write_req),
        .write_addr(a_ram_write_addr),
        .write_data(a_ram_input_reg)
    );
    a_ram_address_generator #(
        .INTEGER_BIT(INTEGER_BIT),
        .A_RAM_ADDR_WIDTH(A_RAM_ADDR_WIDTH)
    ) a_ram_address_generator_ (
        .enable(a_ram_address_generator_enable),
        .finish(a_ram_address_generator_finish),
        .clk(clk),
        .ws_os(ws_os),
        .col_size(a_ram_moving_col_size),
        .row_size(a_ram_moving_row_size),
        .bram_col_size(M),
        .bram_row_size(K),
        .bram_col_start_index(a_ram_moving_col_start_index),
        .bram_row_start_index(a_ram_moving_row_start_index),
        .addr_a_bram(_addr_a_bram),
        .enable_a_bram(enable_a_bram),
        .a_ram_write_req(a_ram_write_req),
        .a_ram_write_addr(a_ram_write_addr),
        .a_ram_index_addr(a_ram_index),
        .a_ram_start_addr(a_ram_moving_start_index)
    );
    sys_arr #(
        .SYS_ARR_SIZE(SYS_ARR_SIZE),
        .ACT_WIDTH(ACT_DATA_WIDTH),
        .WGT_WIDTH(WGT_DATA_WIDTH), 
        .MULT_OUT_WIDTH(ACT_DATA_WIDTH + WGT_DATA_WIDTH),
        .PE_OUT_WIDTH(PE_OUT_WIDTH),
        .OP_SIG_WIDTH(3)
    ) sys_arr_(
        .clk(clk),
        .reset(sys_reset),
        .operation_signal_in(operation_signal_in),
        .act_data_in(a_ram_output_wire),
        .wgt_data_in(w_ram_output_wire),
        .initial_result_in({PE_OUT_WIDTH * SYS_ARR_SIZE {1'b0}}),
        .final_result_out(sys_output_wire)
    );
    sys_control #(
        .SYS_ARR_SIZE(SYS_ARR_SIZE),
        .INTEGER_BIT(INTEGER_BIT),
        .W_RAM_ADDR_WIDTH(W_RAM_ADDR_WIDTH),
        .A_RAM_ADDR_WIDTH(A_RAM_ADDR_WIDTH),
        .O_RAM_ADDR_WIDTH(O_RAM_ADDR_WIDTH)
    ) sys_control_ (
        .enable(sys_exec_enable),
        .finish(sys_exec_finish),
        .clk(clk),
        .m(12'd8),
        .k(a_ram_moving_row_size),
        .n(12'd8),
        .ws_os(ws_os),
        .operation_signal_in(operation_signal_in),
        .sys_reset(sys_reset),
        .o_ram_write_req(o_ram_write_req),
        .o_ram_write_addr(o_ram_write_addr),
        .o_ram_addr_bias(o_ram_addr_bias),
        .w_ram_read_req(w_ram_read_req),
        .w_ram_read_addr(w_ram_read_addr),
        .w_ram_max_addr_size(w_ram_max_addr_size),
        .w_ram_max_size(w_ram_max_size),
        .w_ram_addr_bias(w_ram_addr_bias),
        .a_ram_read_req(a_ram_read_req),
        .a_ram_read_addr(a_ram_read_addr),
        .a_ram_max_addr_size(a_ram_max_addr_size),
        .a_ram_max_size(a_ram_max_size),
        .a_ram_addr_bias(a_ram_addr_bias)
    );
    ram_array_write_bias #(
        .DATA_WIDTH(PE_OUT_WIDTH),
        .ADDR_WIDTH(O_RAM_ADDR_WIDTH),
        .ARRAY_SIZE(SYS_ARR_SIZE),
        .RAM_INDEX_ADDR_SIZE(INTEGER_BIT),
        .OUTPUT_REG(1)
    ) o_ram (
        .clk(clk),
        .reset(internal_reset),
        .addr_bias(o_ram_addr_bias),
        .read_req(o_ram_read_req),
        .read_addr(o_ram_read_addr),
        .read_ram_addr(o_ram_index),
        .read_data(data_in_o_bram),
        .write_req(o_ram_write_req),
        .add_req(add_req_reg),
        .write_addr(o_ram_write_addr),
        .write_start_addr(o_ram_write_start_addr),
        .write_data(sys_output_wire)
    );
    o_ram_address_generator #(
        .INTEGER_BIT(INTEGER_BIT),
        .O_RAM_ADDR_WIDTH(O_RAM_ADDR_WIDTH)
    ) o_ram_address_generator_ (
        .enable(o_ram_address_generator_enable),
        .finish(o_ram_address_generator_finish),
        .clk(clk),
        .bram_col_size(M),
        .bram_row_size(N),
        .bram_col_start_index(12'd0),
        .bram_row_start_index(o_ram_moving_row_start_index),
        .col_size(M),
        .row_size(12'd8),
        .addr_o_bram(_addr_o_bram),
        .enable_o_bram(enable_o_bram),
        .o_ram_read_req(o_ram_read_req),
        .o_ram_read_addr(o_ram_read_addr),
        .o_ram_index_addr(o_ram_index),
        .o_ram_start_addr(o_ram_start_addr)
    );

endmodule
