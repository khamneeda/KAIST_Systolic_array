/*
OUTPUT_REG = 1
    register exist and read takes 1 cycle
OUTPUT_REG = 0
    feed read_addr and get data immediately
*/
`timescale 100ns/1ns
module ram_array_write_bias
#(
  parameter integer DATA_WIDTH    = 16,      
  parameter integer ADDR_WIDTH    = 12,     /* determine size of ram */
  parameter integer ARRAY_SIZE    = 8,     /* RAM의 Array Size */
  parameter integer RAM_INDEX_ADDR_SIZE = 32,
  parameter integer OUTPUT_REG    = 1
)
(
  input  wire                         clk,
  input  wire                         reset,
  input  wire                         addr_bias, // 1이면 address_bias를 적용, 0이면 적용하지 않음

  input  wire                         read_req,
  input  wire [ ADDR_WIDTH - 1 : 0 ]  read_addr,
  input  wire [ RAM_INDEX_ADDR_SIZE - 1 : 0 ]   read_ram_addr,
  output wire [ DATA_WIDTH - 1 : 0 ]  read_data,

  input  wire                         write_req,
  input  wire                         add_req,
  input  wire [ ADDR_WIDTH - 1 : 0 ]  write_addr,
  input  wire [ ADDR_WIDTH - 1 : 0 ]  write_start_addr,
  input  wire [ DATA_WIDTH * ARRAY_SIZE - 1 : 0 ]  write_data
);
  genvar i;
  wire [ ARRAY_SIZE - 1 : 0 ] critical_conditon_array;
  wire [DATA_WIDTH -1 : 0] read_data_array[ARRAY_SIZE - 1 : 0];
  reg [ADDR_WIDTH - 1 : 0] read_addr_reg;
  reg [RAM_INDEX_ADDR_SIZE - 1 : 0] read_ram_addr_reg;
  reg add_req_reg;
  
  generate
    // write address bias
    always @(posedge clk or posedge reset) begin
      if (reset) begin
        read_addr_reg <= 0;
        read_ram_addr_reg <= 0;
        add_req_reg <= 0;
      end else begin
        read_addr_reg <= read_addr;
        read_ram_addr_reg <= read_ram_addr;
        add_req_reg <= add_req;
      end
    end
    wire [ ADDR_WIDTH -1 : 0] write_addr_array [ 0 : ARRAY_SIZE - 1 ];
    for (i = 0; i < ARRAY_SIZE; i = i + 1) begin
      assign write_addr_array[i] = write_start_addr + write_addr - (addr_bias ? i : 0);
      assign critical_conditon_array[i : i] = write_addr >= (addr_bias ? i : 0);
      ram #(
          .DATA_WIDTH(DATA_WIDTH),
          .ADDR_WIDTH(ADDR_WIDTH),
          .OUTPUT_REG(OUTPUT_REG)
      ) ram_ (
          .clk(clk),
          .reset(reset),
          .read_req(read_req),
          .read_addr(read_addr),
          .read_data(read_data_array[i]),
          .write_req(critical_conditon_array[i : i] ? write_req : 1'b0),
          .add_req(critical_conditon_array[i : i] ? add_req_reg : 1'b0),
          .write_addr(critical_conditon_array[i : i] ? write_addr_array[i] : {ADDR_WIDTH {1'b0}}),
          .write_data(write_data[DATA_WIDTH * (i + 1) - 1 : DATA_WIDTH * i])
      );
    end
    assign read_data = read_data_array[read_ram_addr_reg];
  endgenerate
endmodule

