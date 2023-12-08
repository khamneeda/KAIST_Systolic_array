/*
OUTPUT_REG = 1
    register exist and read takes 1 cycle
OUTPUT_REG = 0
    feed read_addr and get data immediately
*/
`timescale 100ns/1ns
module ram_array_read_bias
#(
  parameter integer DATA_WIDTH    = 16,      
  parameter integer ADDR_WIDTH    = 12,     /* determine size of ram */
  parameter integer ARRAY_SIZE    = 8,     /* RAM의 Array Size */
  parameter integer RAM_INDEX_ADDR_SIZE = 8,
  parameter integer OUTPUT_REG    = 1
)
(
  input  wire                         clk,
  input  wire                         reset,
  input  wire                         addr_bias, // 1이면 address_bias를 적용, 0이면 적용하지 않음
  input  wire [RAM_INDEX_ADDR_SIZE - 1 : 0 ]       max_addr_size,
  input  wire [RAM_INDEX_ADDR_SIZE - 1 : 0 ]       max_ram_size,

  input  wire                         read_req,
  input  wire [ ADDR_WIDTH - 1 : 0 ]  read_addr,
  input  wire [ ADDR_WIDTH - 1 : 0 ]  read_start_addr,
  output wire [ DATA_WIDTH * ARRAY_SIZE - 1 : 0 ]  read_data,

  input  wire                         write_req,
  input  wire [ ADDR_WIDTH - 1 : 0 ]  write_addr,
  input  wire [ RAM_INDEX_ADDR_SIZE - 1 : 0 ]   write_ram_addr,
  input  wire [ DATA_WIDTH - 1 : 0 ]  write_data
);
  genvar i;
  wire [ ARRAY_SIZE - 1 : 0 ] critical_conditon_array;
  reg [ ARRAY_SIZE - 1 : 0 ] critical_conditon_array_reg;
  wire [ ADDR_WIDTH -1 : 0] read_addr_array [ 0 : ARRAY_SIZE - 1 ];
  wire [ DATA_WIDTH  * ARRAY_SIZE - 1 : 0 ]  ram_read_data;
  reg [ARRAY_SIZE - 1 : 0] write_req_array;
  reg [ADDR_WIDTH - 1 : 0] write_addr_reg;
  reg [DATA_WIDTH -1 : 0] write_data_reg;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      write_req_array <= 0;
      write_addr_reg <= 0;
      write_data_reg <= 0;
    end else begin
      write_req_array <= write_req << write_ram_addr;
      write_addr_reg <= write_addr;
      write_data_reg <= write_data;
    end
  end
  
  generate
    // read address bias
    if (OUTPUT_REG != 0) begin
      always @(posedge clk or posedge reset) begin
        if (reset) begin
          critical_conditon_array_reg <= 0;
        end else begin
          critical_conditon_array_reg <= critical_conditon_array;
        end
      end
    end
    for (i = 0; i < ARRAY_SIZE; i = i + 1) begin
      assign read_addr_array[i] = read_start_addr + read_addr - (addr_bias ? i : 0);
      assign critical_conditon_array[i : i] = read_req && (i < max_ram_size) && (read_addr < max_addr_size + (addr_bias ? i : 0)) && (read_addr >= (addr_bias ? i : 0));
      ram #(
          .DATA_WIDTH(DATA_WIDTH),
          .ADDR_WIDTH(ADDR_WIDTH),
          .OUTPUT_REG(OUTPUT_REG)
      ) ram_ (
          .clk(clk),
          .reset(reset),
          .read_req(read_req),
          .add_req(1'b0),
          .read_addr(critical_conditon_array[i : i] ? read_addr_array[i] : {ADDR_WIDTH {1'b0}}),
          .read_data(ram_read_data[DATA_WIDTH * (i + 1) - 1 : DATA_WIDTH * i]),
          .write_req(write_req_array[i : i]),
          .write_addr(write_addr_reg),
          .write_data(write_data_reg)
      );
      assign read_data[DATA_WIDTH * (i + 1) - 1 : DATA_WIDTH * i] = (OUTPUT_REG == 0 ? critical_conditon_array[i : i] : critical_conditon_array_reg[i : i]) ? ram_read_data[DATA_WIDTH * (i + 1) - 1 : DATA_WIDTH * i] : {DATA_WIDTH {1'b0}};
    end
  endgenerate
endmodule

