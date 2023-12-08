`timescale 100ns/1ns

module tb_mat_mul #(
    parameter integer SYS_ARR_SIZE      = 8,
    parameter integer ACT_DATA_WIDTH    = 8,
    parameter integer WGT_DATA_WIDTH    = 8,
    parameter integer PE_OUT_WIDTH      = 32,
    parameter integer M       = 6,
    parameter integer K       = 5,
    parameter integer N       = 4,
    parameter integer WS_OS   = 1, // 0은 ws, 1은 os
    parameter integer DATA = 1 // 0은 1, 1이면 11, 12, ..., 1N, 2, 21, 22, ..., 2N, ..., M, M1, M2, ..., MN
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
    reg [M * N - 1 : 0] result_check;
    wire [2: 0] state;
    wire [10:0] counter;

    mat_mul_system #(
        .SYS_ARR_SIZE       (SYS_ARR_SIZE),
        .ACT_DATA_WIDTH     (ACT_DATA_WIDTH),
        .WGT_DATA_WIDTH     (WGT_DATA_WIDTH),
        .PE_OUT_WIDTH       (PE_OUT_WIDTH)
    ) mat_mul_system_ (
        .clk                (clk),
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
    integer i, j, k;

    initial begin
        clk = 1;
        result_check = {M * N {1'b1}};
        reset =1;
        #1
        reset = 0;
        #4;
        // 대기 상태일 때는 sp_bram의 enable을 켜두어야 함.
        if(enable_sp_bram == 1) begin
            $display("enable_sp_bram: PASS");
        end else begin
            $display("enable_sp_bram: FAIL");
            $display("It should be 1");
        end
        // sp_bram을 통해 start signal을 준 경우. 이 때 다음 클락에서 addr_sp_bram이 4가 되어야 함.
        data_out_sp_bram_reg = 1; // sp_bram start signal
        #2
        if(addr_sp_bram == 4) begin
            $display("addr_sp_bram: PASS");
        end else begin
            $display("addr_sp_bram: FAIL");
            $display("It should be 4");
        end
        data_out_sp_bram_reg = WS_OS;
        #1
        if(addr_sp_bram == 8) begin
            $display("addr_sp_bram: PASS");
        end else begin
            $display("addr_sp_bram: FAIL");
            $display("It should be 8");
        end
        data_out_sp_bram_reg = M; // M
        #1
        if(addr_sp_bram == 12) begin
            $display("addr_sp_bram: PASS");
        end else begin
            $display("addr_sp_bram: FAIL");
            $display("It should be 12");
        end
        data_out_sp_bram_reg = K; // K
        #1
        if(addr_sp_bram == 16) begin
            $display("addr_sp_bram: PASS");
        end else begin
            $display("addr_sp_bram: FAIL");
            $display("It should be 16");
        end
        data_out_sp_bram_reg = N; // N
        #1
        for (i = 0; i < (M * K > N * K ? M * K : N * K); i = i + 1) begin
            #1
            // 이제 a,w bram에서 값을 읽어오는 것이므로 enable_a_bram, enable_w_bram의 값이 1이 되어야 함.
            data_out_w_bram_reg = DATA == 0 ? 1 : ((addr_w_bram / 4) / N + 1) * 10 + ((addr_w_bram / 4) % N + 1);
            data_out_a_bram_reg = DATA == 0 ? 1 : ((addr_a_bram / 4) / K + 1) * 10 + ((addr_a_bram / 4) % K + 1);
            // data_out_w_bram = 1;
            // data_out_a_bram = 1;
            if(enable_a_bram == 1) begin
                if (i == 0) begin
                    $display("enable_a_bram: PASS");
                end
            end else begin
                if (i < M * K) begin
                    $display("enable_a_bram: FAIL");
                    $display("It should be 1");
                end
            end
            if(enable_w_bram == 1) begin
                if (i == 0) begin
                    $display("enable_w_bram: PASS");
                end
            end else begin
                if (i < K * N) begin
                    $display("enable_w_bram: FAIL");
                    $display("It should be 1");
                end
            end
            if (i < M * K)
                $display("a_bram[%d]=%d", addr_a_bram, DATA == 0 ? 1 : ((addr_a_bram / 4) / K + 1) * 10 + ((addr_a_bram / 4) % K + 1));
            if (i < K * N)
                $display("w_bram[%d]=%d", addr_w_bram, DATA == 0 ? 1 : ((addr_w_bram / 4) / N + 1) * 10 + ((addr_w_bram / 4) % N + 1));
        end
        #1
        for (i = 0; i< 200; i = i+1) begin
            if (enable_o_bram == 1 && w_enable_o_bram == 4'b1111) begin
                tmp = 0;
                for (k = 0; k < K; k = k + 1) begin
                    tmp = tmp + ((((addr_o_bram / 4) / N) + 1) * 10 + (k + 1)) * ((k + 1) * 10 + (((addr_o_bram / 4) % N) + 1));
                end
                if (data_in_o_bram == (DATA == 0 ? K : tmp)) begin
                    $display("o_bram[%d][%d]=%d: PASS", (addr_o_bram / 4) / N, (addr_o_bram / 4) % N, (DATA == 0 ? K : tmp));
                end else begin
                    $display("o_bram[%d][%d]=%d: FAIL", (addr_o_bram / 4) / N, (addr_o_bram / 4) % N, data_in_o_bram);
                    $display("It should be %d", DATA == 0 ? K : tmp);
                end
                result_check[addr_o_bram / 4] = 1'b0;
            end
            if (enable_sp_bram == 1 && addr_sp_bram == 100 && data_in_sp_bram == 1) begin
                $display("End signal detected");
                i = 1000;
            end
            #1;
        end
        if (result_check != 0) begin
            for (i = 0; i< M * N; i=i+1) begin
                if (result_check[i] == 1'b1) begin
                    $display("FAIL: o_bram[%d][%d] is not updated", i / N, i % N);
                end
            end
        end

    end
    initial begin
        $dumpfile("testbench.vcd") ;
        $dumpvars(0, tb_mat_mul);
    end
    always #0.5 clk = !clk;
    always @(posedge clk) begin
        data_out_sp_bram <= data_out_sp_bram_reg;
        data_out_a_bram <= data_out_a_bram_reg;
        data_out_w_bram <= data_out_w_bram_reg;

    end
endmodule