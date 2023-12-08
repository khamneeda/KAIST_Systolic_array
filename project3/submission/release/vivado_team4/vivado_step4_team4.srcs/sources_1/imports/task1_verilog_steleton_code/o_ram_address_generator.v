`timescale 100ns/1ns
module o_ram_address_generator
#(
  parameter integer INTEGER_BIT       = 7,
  parameter integer O_RAM_ADDR_WIDTH  = 7
)
(
  input  wire                         enable,
  output wire                         finish,
  input  wire                         clk,
  input  wire [INTEGER_BIT-1:0]       bram_col_size,
  input  wire [INTEGER_BIT-1:0]       bram_row_size,
  input  wire [INTEGER_BIT-1:0]       bram_col_start_index,
  input  wire [INTEGER_BIT-1:0]       bram_row_start_index,
  input  wire [INTEGER_BIT-1:0]       col_size,
  input  wire [INTEGER_BIT-1:0]       row_size,
  

  output wire [32-1:0]                addr_o_bram,
  output wire                         enable_o_bram,

  output wire                         o_ram_read_req,
  output wire [O_RAM_ADDR_WIDTH-1:0]  o_ram_read_addr,
  output wire [INTEGER_BIT-1:0]       o_ram_index_addr,
  input wire [O_RAM_ADDR_WIDTH-1:0]   o_ram_start_addr
);

  reg finish_reg;
  reg [INTEGER_BIT - 1 : 0] counter;

  always @(posedge clk) begin
    if (enable) begin
      if (!finish && counter < col_size * row_size)
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
  // o_bram
  assign enable_o_bram = counter > 0 && counter < col_size * row_size + 1;
  assign addr_o_bram = counter > 0 ? (bram_col_start_index + (counter - 1) / row_size) * bram_row_size + (bram_row_start_index + (counter - 1) % row_size) : 0;

  // o_ram
  assign o_ram_read_addr =  o_ram_start_addr + (o_ram_read_req ? counter / row_size : 0);
  assign o_ram_index_addr = o_ram_read_req ? counter % row_size : 0;
  assign o_ram_read_req = !finish && enable && counter < col_size * row_size;
endmodule

