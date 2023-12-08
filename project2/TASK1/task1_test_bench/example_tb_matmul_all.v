`timescale 100ns/1ns

module tb_mat_mul_all #(
    parameter integer SYS_ARR_SIZE      = 8,
    parameter integer ACT_DATA_WIDTH    = 8,
    parameter integer WGT_DATA_WIDTH    = 8,
    parameter integer PE_OUT_WIDTH      = 32,
    parameter integer DATA = 1, // 0은 1, 1이면 11, 12, ..., 1N, 2, 21, 22, ..., 2N, ..., M, M1, M2, ..., MN
    parameter integer MAXIMUM_DELAY = 200
);
    reg clk, reset;
    
    /*Connection with SP_BRAM*/
    wire [32-1:0]         addr_sp_bram;
    wire                  enable_sp_bram;
    reg [32-1:0]          data_out_sp_bram;
    reg [32-1:0]          data_out_sp_bram_reg;
    wire [4-1 :0]         w_enable_sp_bram;
    wire [32-1:0]         data_in_sp_bram;
    /* Connection with A_BRAM */
    wire [32-1:0]        addr_a_bram;
    wire                  enable_a_bram;
    reg [32-1:0]         data_out_a_bram;
    reg [32-1:0]         data_out_a_bram_reg;
    /* Connection with W_BRAM */
    wire [32-1:0]         addr_w_bram;
    wire                  enable_w_bram;
    reg [32-1:0]         data_out_w_bram;
    reg [32-1:0]         data_out_w_bram_reg;
    /* Connection with O_BRAM */
    wire [32-1:0]         addr_o_bram;
    wire                  enable_o_bram;
    wire [4-1 :0]         w_enable_o_bram;
    wire [32-1:0]         data_in_o_bram;

    reg [32 -1 : 0] o_bram [0 : (2<<12) -1];
    reg [32-1:0]         tmp;
    reg [SYS_ARR_SIZE * SYS_ARR_SIZE - 1 : 0] result_check;

    mat_mul_system #(
        .SYS_ARR_SIZE       (SYS_ARR_SIZE),
        .ACT_DATA_WIDTH     (ACT_DATA_WIDTH),
        .WGT_DATA_WIDTH     (WGT_DATA_WIDTH),
        .PE_OUT_WIDTH       (PE_OUT_WIDTH)
    ) mat_mul_system_ (
        .clk                (clk),
        .reset              (reset),
        .addr_sp_bram       (addr_sp_bram),
        .enable_sp_bram     (enable_sp_bram),
        .data_out_sp_bram   (data_out_sp_bram),
        .w_enable_sp_bram   (w_enable_sp_bram),
        .data_in_sp_bram    (data_in_sp_bram),
        /* Connection with A_BRAM */
        .addr_a_bram        (addr_a_bram),
        .enable_a_bram      (enable_a_bram),
        .data_out_a_bram    (data_out_a_bram),
        /* Connection with W_BRAM */
        .addr_w_bram        (addr_w_bram),
        .enable_w_bram      (enable_w_bram),
        .data_out_w_bram    (data_out_w_bram),
        /* Connection with O_BRAM */
        .addr_o_bram        (addr_o_bram),
        .enable_o_bram      (enable_o_bram),
        .w_enable_o_bram    (w_enable_o_bram),
        .data_in_o_bram     (data_in_o_bram)
    );
    integer i, j, k_prime;
    integer m, k, n, ws_os;

    initial begin
        clk = 1;
        reset = 1;
        #1
        reset = 0;
        #4
        for (m = 1; m <= SYS_ARR_SIZE; m = m + 1) begin
            for (k = 1; k <= SYS_ARR_SIZE; k = k + 1) begin
                for (n =1; n <= SYS_ARR_SIZE; n = n + 1) begin
                    for (ws_os = 0; ws_os < 2; ws_os = ws_os + 1) begin
                        result_check = 0;
                        for (i = 0; i < m * n; i=i+1) begin
                            result_check[i] = 1'b1;
                        end
                        #10;
                        // 대기 상태일 때는 sp_bram의 enable을 켜두어야 함.
                        if(enable_sp_bram == 1) begin
                        end else begin
                            $display("enable_sp_bram: FAIL");
                            $display("It should be 1");
                        end
                        // sp_bram을 통해 start signal을 준 경우. 이 때 다음 클락에서 addr_sp_bram이 4가 되어야 함.
                        data_out_sp_bram_reg = 1; // sp_bram start signal
                        #2
                        if(addr_sp_bram == 4) begin
                        end else begin
                            $display("addr_sp_bram: FAIL");
                            $display("It should be 4");
                        end
                        data_out_sp_bram_reg = ws_os;
                        #1
                        if(addr_sp_bram == 8) begin
                        end else begin
                            $display("addr_sp_bram: FAIL");
                            $display("It should be 8");
                        end
                        data_out_sp_bram_reg = m; // M
                        #1
                        if(addr_sp_bram == 12) begin
                        end else begin
                            $display("addr_sp_bram: FAIL");
                            $display("It should be 12");
                        end
                        data_out_sp_bram_reg = k; // K
                        #1
                        if(addr_sp_bram == 16) begin
                        end else begin
                            $display("addr_sp_bram: FAIL");
                            $display("It should be 16");
                        end
                        data_out_sp_bram_reg = n; // N
                        #1
                        data_out_sp_bram <= 0;
                        data_out_sp_bram_reg <= 0;
                        for (i = 0; i < (m * k > n * k ? m * k : n * k); i = i + 1) begin
                            #1
                            // 이제 a,w bram에서 값을 읽어오는 것이므로 enable_a_bram, enable_w_bram의 값이 1이 되어야 함.
                            data_out_w_bram_reg = DATA == 0 ? 1 : ((addr_w_bram / 4) / n + ws_os) * 10 + ((addr_w_bram / 4) % n + ws_os);
                            data_out_a_bram_reg = DATA == 0 ? 1 : ((addr_a_bram / 4) / k + ws_os) * 10 + ((addr_a_bram / 4) % k + ws_os);
                            // data_out_w_bram = 1;
                            // data_out_a_bram = 1;
                            if(enable_a_bram == 1) begin
                                if (i == 0) begin
                                end
                            end else begin
                                if (i < m * k) begin
                                    $display("enable_a_bram: FAIL");
                                    $display("It should be 1");
                                end
                            end
                            if(enable_w_bram == 1) begin
                                if (i == 0) begin
                                end
                            end else begin
                                if (i < k * n) begin
                                    $display("enable_w_bram: FAIL");
                                    $display("It should be 1");
                                end
                            end
                        end
                        #1
                        for (i = 0; i< MAXIMUM_DELAY; i = i+1) begin
                            if (enable_o_bram == 1 && w_enable_o_bram == 4'b1111) begin
                                tmp = 0;
                                for (k_prime = 0; k_prime < k; k_prime = k_prime + 1) begin
                                    tmp = tmp + ((((addr_o_bram / 4) / n) + ws_os) * 10 + (k_prime + ws_os)) * ((k_prime + ws_os) * 10 + (((addr_o_bram / 4) % n) + ws_os));
                                end
                                if (data_in_o_bram == (DATA == 0 ? k : tmp)) begin
                                    result_check[addr_o_bram / 4] = 1'b0;
                                end else begin
                                    if (result_check[addr_o_bram / 4] == 1'b0)
                                        result_check[addr_o_bram / 4] = 1'b1;
                                end
                            end
                            if (enable_sp_bram == 1 && addr_sp_bram == 100 && data_in_sp_bram == 1) begin
                                data_out_a_bram <= 0;
                                data_out_a_bram_reg <= 0;
                                data_out_w_bram <= 0;
                                data_out_w_bram_reg <= 0;
                                i = 1 << 15;
                            end
                            #1;
                        end
                        if (result_check != 0 || i < (1 << 15)) begin
                            $display("FAIL: m = %d, n = %d, k = %d, ws_os = %d", m, n, k, ws_os);
                        end
                    end
                end
            end
        end
        $display("Finished");
    end
    initial begin
        $dumpfile("testbench.vcd") ;
        $dumpvars(0, tb_mat_mul_all);
    end
    always #0.5 clk = !clk;
    always @(posedge clk) begin
        data_out_sp_bram <= data_out_sp_bram_reg;
        data_out_a_bram <= data_out_a_bram_reg;
        data_out_w_bram <= data_out_w_bram_reg;

    end
endmodule