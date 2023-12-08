`timescale 100ns/1ns

module tb_bram_combine_custom_all ();
    reg clk;
    reg reset;
    
    reg [31:0]sp_addr;
    reg [31:0]sp_data_in;
    wire [31:0] sp_data_out;
    reg [3:0]sp_web;
    
    reg [31:0]a_addr;
    reg [31:0]a_data_in;
    reg [3:0]a_web;

    reg [31:0]w_addr;
    reg [31:0]w_data_in;
    reg [3:0]w_web;
    
    reg [31:0]O_addr;
    wire [31:0]O_data;
    reg [31:0] m, k, n, tmp, sp_end;
    reg [31:0] ws_os;
    reg padding;

    wire [31:0] padded_m, padded_k, padded_n;
    assign padded_m =  ((m - 1) / 8 + 1) * 8;
    assign padded_k = ((k - 1) / 8 + 1) * 8;
    assign padded_n = ((n - 1) / 8 + 1) * 8;

    /* Check the name of your module 'CS411_task1_wrapper'. */
    /* If your module name differ form 'CS411_task1_wrapper', you have to change below name. */ 
    CS411_task1_wrapper aaa (
        .clk(clk),
        .reset(reset),
        .sp_addr(sp_addr),
        .sp_data_in(sp_data_in),
        .sp_data_out(sp_data_out),
        .sp_web(sp_web),
        .a_addr(a_addr),
        .a_data_in(a_data_in),
        .a_web(a_web),
        .w_addr(w_addr),
        .w_data_in(w_data_in),
        .w_web(w_web),
        .O_data(O_data),
        .O_addr(O_addr)
    );
  
    reg [32-1:0] i, j, k_prime;
    reg pass;
    initial begin
        clk = 1;
        padding = 1;
        reset = 1;
        #10
        reset = 0;
        #1
        for (m = 1; m <= 8; m = m + 1) begin
            for (n = 1; n <= 8; n = n + 1) begin
                for (k = 1; k <= 8; k = k + 1) begin
                    for (ws_os = 0; ws_os <= 1; ws_os = ws_os + 1) begin
                        pass = 1;

                        sp_addr = 0;
                        sp_data_in = 0;
                        sp_web = 0;
                        a_addr = 0;
                        a_data_in = 0;
                        a_web = 0;
                        w_addr = 0;
                        w_data_in = 0;
                        w_web = 0;
                        O_addr = 0;
                        sp_end = 0;
                        #10
                        /* set SP BRAM */
                        
                        /* We will do 4 tests with this variables 
                        Also, this step is necessary for checking functionality of yoiur design. 
                        Do the simulation with various cases

                        TEST x : (mode, M, K, N) 
                        TEST 1 : (0 and 1, 8, 8, 8)
                        TEST 2 : (0 and 1, 7, 8, 3)
                        TEST 3 : (0 and 1, 3, 4, 2)
                        TEST 4 : (0 and 1, 6, 7, 3)
                        */
                        /* EXAMPLE Following testbench code is for TEST 2 OS (1, 7, 8, 3) */
                        sp_web=4'b1111;
                        #1
                        sp_addr=4; 
                        sp_data_in=ws_os; //MODE
                        #1
                        sp_addr=8; 
                        sp_data_in = padding == 1'b1 ? padded_m : m; //M
                        #1
                        sp_addr=12; 
                        sp_data_in = padding == 1'b1 ? padded_k : k; //K
                        #1
                        sp_addr=16; 
                        sp_data_in = padding == 1'b1 ? padded_n : n; //N
                        #1

                        /* set inputs in A, W BRAM */
                        sp_web = 4'b0000;
                        a_web=4'b1111;
                        w_web=4'b1111;

                        #1
                        /* (import) input value may be random values */
                        if (padding == 1) begin
                            for (i=1; i<=padded_m; i=i+1) begin
                                for (j=1;j<=padded_k; j=j+1) begin
                                    a_addr = (i-1)*padded_k*4 + (j-1)*4;
                                    a_data_in = i <= m && j <= k ? (i - ws_os) * 10 + (j - ws_os) : 0;
                                    #1;
                                end
                            end
                            for (i=1; i<=padded_k; i=i+1) begin
                                for (j=1;j<=padded_n; j=j+1) begin
                                    w_addr = (i-1)*padded_n*4 + (j-1)*4;
                                    w_data_in = i <= k && j <= n ? (i - ws_os) * 10 + (j - ws_os) : 0;
                                    #1;
                                end
                            end
                        end else begin
                            for (i=1; i<=m; i=i+1) begin
                                for (j=1;j<=k; j=j+1) begin
                                    a_addr = (i-1)*k*4 + (j-1)*4;
                                    a_data_in = (i - ws_os) * 10 + (j - ws_os);
                                    #1;
                                end
                            end
                            for (i=1; i<=k; i=i+1) begin
                                for (j=1;j<=n; j=j+1) begin
                                    w_addr = (i-1)*n*4 + (j-1)*4;
                                    w_data_in = (i - ws_os) * 10 + (j - ws_os);
                                    #1;
                                end
                            end
                        end

                        /* Set start SIGNAL */
                        a_web=4'b0000;
                        w_web=4'b0000;
                        #10
                        sp_web=4'b1111;
                        sp_addr=0; 
                        sp_data_in=1;
                        #5 
                        /*
                            END value setting on BRAM
                            After you generate bitstream and make FPGA work, 
                            previous process is done by Jupyter notebook python code.
                        */

                        /* Wait to finish systolic array operation */
                        sp_web=4'b0000;
                        #5
                        sp_addr = 100;
                        a_web=4'b0000;
                        w_web=4'b0000;
                        #5

                        for (;sp_end < 5;) begin
                            if (sp_data_out == 1) begin
                                sp_end = sp_end + 1;
                            end
                            #1;
                        end
                        #5;
                        sp_web=4'b1111;
                        sp_data_in=0;
                        #5;
                        sp_web=4'b0000;
                        #10;
                        /* Check the contents of O_BRAM, you have to use memory (O_BEAM) minimally */
                        /* Inserting one element (1 byte) into each 4-byte space of O_BRAM is the default rule. 
                        (It does not require inserting 4 elements into the 4-byte space.) 
                        Refer to the code below to verify the results. */
                        if (padding == 1) begin
                            for (i=0; i < m; i = i + 1) begin
                                for (j=0;j < n; j = j + 1) begin
                                    O_addr = (i * padded_n + j) * 4;
                                    #0.5;
                                    tmp = 0;
                                    for (k_prime = 0; k_prime < k; k_prime = k_prime + 1) begin
                                        tmp = tmp + ((i + 1 - ws_os) * 10 + (k_prime + 1 - ws_os)) * ((k_prime + 1 - ws_os) * 10 + (j + 1 - ws_os));
                                    end
                                    if (O_data != tmp) begin
                                        pass = 0;
                                    end
                                    #0.5;
                                end
                            end
                        end else begin
                            for (i=0; i < m; i = i + 1) begin
                                for (j=0;j< n; j = j + 1) begin
                                    O_addr = (i * n + j) * 4;
                                    #0.5;
                                    tmp = 0;
                                    for (k_prime = 0; k_prime < k; k_prime = k_prime + 1) begin
                                        tmp = tmp + ((i + 1 - ws_os) * 10 + (k_prime + 1 - ws_os)) * ((k_prime + 1 - ws_os) * 10 + (j + 1 - ws_os));
                                    end
                                    if (O_data != tmp) begin
                                        pass = 0;
                                    end
                                    #0.5;
                                end
                            end
                        end
                        if (pass == 1) begin
                            $display("PASS: m = %d, k = %d, n = %d, ws_os = %d", m, k, n, ws_os);
                        end else begin
                            $display("FAIL: m = %d, k = %d, n = %d, ws_os = %d", m, k, n, ws_os);
                        end
                    end
                end
            end
        end
      
      
    end
  
  always #0.5 clk = !clk;
endmodule
