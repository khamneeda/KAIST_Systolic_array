`timescale 100ns/1ns
module sys_control
#(
    parameter integer   SYS_ARR_SIZE        = 8,
    parameter integer   INTEGER_BIT         = 8,
    parameter integer   W_RAM_ADDR_WIDTH    = 7,
    parameter integer   A_RAM_ADDR_WIDTH    = 7,
    parameter integer   O_RAM_ADDR_WIDTH    = 7
)(
    // systolic control bits
    input wire                                                  enable,
    output wire                                                 finish,
    input wire                                                  clk,
    input wire  [INTEGER_BIT-1:0]                               m,
    input wire  [INTEGER_BIT-1:0]                               k,
    input wire  [INTEGER_BIT-1:0]                               n,
    input wire                                                  ws_os,

    output wire [2:0]                                           operation_signal_in,
    output wire                                                 sys_reset,

    // o_ram
    output wire                                                 o_ram_write_req,
    output wire [O_RAM_ADDR_WIDTH - 1 : 0]                      o_ram_write_addr,
    output wire                                                 o_ram_addr_bias,

    // w_ram
    output wire                                                 w_ram_read_req,
    output wire [W_RAM_ADDR_WIDTH - 1 : 0]                      w_ram_read_addr,
    output wire [INTEGER_BIT - 1 : 0]                           w_ram_max_addr_size,
    output wire [INTEGER_BIT - 1 : 0]                           w_ram_max_size,
    output wire                                                 w_ram_addr_bias,

    // a_ram
    output wire                                                 a_ram_read_req,
    output wire [A_RAM_ADDR_WIDTH - 1 : 0]                      a_ram_read_addr,
    output wire [INTEGER_BIT - 1 : 0]                           a_ram_max_addr_size,
    output wire [INTEGER_BIT - 1 : 0]                           a_ram_max_size,
    output wire                                                 a_ram_addr_bias
);
    reg [INTEGER_BIT -1 : 0] counter;
    reg finish_reg;

    // systolic control bits
    wire sys_exec_finish, sys_exec_finish_ws, sys_exec_finish_os;
    wire ws_load_flow;
    wire os_flow_drain;
    assign sys_exec_finish = ws_os == 1'b0 ? sys_exec_finish_ws : sys_exec_finish_os;
    assign sys_reset = !enable || finish;
    assign operation_signal_in = {ws_os, ws_os ? os_flow_drain : 1'b0, !ws_os ? ws_load_flow : 1'b0};

    assign sys_exec_finish_ws = counter < m + n + k + SYS_ARR_SIZE + 5;
    assign ws_load_flow = enable && !finish && !(counter >= k + 2);
    assign sys_exec_finish_os =  counter <= m + n + k + SYS_ARR_SIZE;
    assign os_flow_drain = counter >= m + n + k;


    // w_ram_control_bits
    assign w_ram_max_addr_size = k;
    assign w_ram_max_size = n;
    assign w_ram_addr_bias = ws_os;
    wire [W_RAM_ADDR_WIDTH -1 : 0] w_ram_read_addr_ws, w_ram_read_addr_os;
    assign w_ram_read_addr = ws_os == 1'b0 ? w_ram_read_addr_ws : w_ram_read_addr_os;
    wire w_ram_read_req_ws, w_ram_read_req_os;
    assign w_ram_read_req = ws_os == 1'b0 ? w_ram_read_req_ws : w_ram_read_req_os;

    assign w_ram_read_addr_ws = w_ram_read_req_ws ? counter : 0;
    assign w_ram_read_req_ws = enable && !finish && counter < k;
    assign w_ram_read_addr_os = w_ram_read_req_os ? counter : 0;
    assign w_ram_read_req_os = enable && !finish && counter + 1 < k + n;


    // a_ram_control_bits
    assign a_ram_max_addr_size = ws_os == 1'b0 ? m : k;
    assign a_ram_max_size = ws_os == 1'b0 ? k : m;
    assign a_ram_addr_bias = 1'b1;
    wire [A_RAM_ADDR_WIDTH -1 : 0] a_ram_read_addr_ws, a_ram_read_addr_os;
    assign a_ram_read_addr = ws_os == 1'b0 ? a_ram_read_addr_ws : a_ram_read_addr_os;
    wire a_ram_read_req_ws, a_ram_read_req_os;
    assign a_ram_read_req = ws_os == 1'b0 ? a_ram_read_req_ws : a_ram_read_req_os;

    assign a_ram_read_addr_ws = a_ram_read_req_ws ? counter - (k + 1) : 0;
    assign a_ram_read_req_ws = counter >= k + 1 && counter < 2 * k + m;
    assign a_ram_read_addr_os = a_ram_read_req_os ? counter : 0;
    assign a_ram_read_req_os = enable && !finish && counter + 1 < m + k;


    // o_ram_control_bits
    assign o_ram_addr_bias = !ws_os;
    wire [O_RAM_ADDR_WIDTH -1 : 0] o_ram_write_addr_ws, o_ram_write_addr_os;
    assign o_ram_write_addr = ws_os == 1'b0 ? o_ram_write_addr_ws : o_ram_write_addr_os;
    wire o_ram_write_req_ws, o_ram_write_req_os;
    assign o_ram_write_req = ws_os == 1'b0 ? o_ram_write_req_ws : o_ram_write_req_os;

    assign o_ram_write_addr_ws = o_ram_write_req_ws ? counter - (k + SYS_ARR_SIZE + 4) : 0;
    assign o_ram_write_req_ws = enable && !finish && counter >= k + SYS_ARR_SIZE + 4 && counter < m + n + k + SYS_ARR_SIZE + 4;
    assign o_ram_write_addr_os = o_ram_write_req_os ? m + n + k + SYS_ARR_SIZE - counter : 0;
    assign o_ram_write_req_os = enable && !finish && counter > n + k + SYS_ARR_SIZE && counter <= m + n + k + SYS_ARR_SIZE;


    always @(posedge clk) begin
        if (enable) begin
            if (!finish && sys_exec_finish)
                counter = counter + 1;
            else begin
                finish_reg <= 1'b1;
                counter <= 0;
            end
        end else begin
            finish_reg <= 1'b0;
            counter <= 0;
        end
    end
    assign finish = finish_reg;

endmodule