`timescale 100ns/1ns
module a_ram_address_generator
#(
  parameter integer INTEGER_BIT       = 7,
  parameter integer A_RAM_ADDR_WIDTH  = 7
)
(
  input  wire                         enable,
  output wire                         finish,
  input  wire                         clk,
  input  wire                         ws_os, //ws: 0
  input  wire [INTEGER_BIT-1:0]       col_size,
  input  wire [INTEGER_BIT-1:0]       row_size,
  input  wire [INTEGER_BIT-1:0]       bram_col_size,
  input  wire [INTEGER_BIT-1:0]       bram_row_size,
  input  wire [INTEGER_BIT-1:0]       bram_col_start_index,
  input  wire [INTEGER_BIT-1:0]       bram_row_start_index,
  

  output wire [32-1:0]                addr_a_bram,
  output wire                         enable_a_bram,

  output wire                         a_ram_write_req,
  output wire [A_RAM_ADDR_WIDTH-1:0]  a_ram_write_addr,
  output wire [INTEGER_BIT-1:0]       a_ram_index_addr,
  input wire [A_RAM_ADDR_WIDTH-1:0]   a_ram_start_addr
);

  reg finish_reg;
  reg [INTEGER_BIT - 1 : 0] counter;

  always @(posedge clk) begin
    if (enable) begin
      if (!finish && counter < (col_size * row_size + 1))
        counter = counter + 1;
      else begin
        counter <= 0;
        finish_reg <= 1'b1;
      end
    end else begin
      finish_reg <= 1'b0;
      counter <= 0;
    end
  end
  assign finish = finish_reg;
  // a_bram
  assign enable_a_bram = !finish && enable && (counter < (col_size * row_size));
  /*)
  WS
  row_index = bram_row_start_index + counter % row_size
  col_index = bram_col_start_index + counter / row_size
  OS
  row_index = bram_row_start_index + counter / col_size
  col_index = bram_col_start_index + counter % col_size

  addr_a_bram = col_index * bram_row_size + row_index
  */
  assign addr_a_bram = enable_a_bram ? (ws_os == 0 ? ((bram_col_start_index + counter / row_size) * bram_row_size + (bram_row_start_index + counter % row_size)) 
                                                   : ((bram_col_start_index + counter % col_size) * bram_row_size + (bram_row_start_index + counter / col_size))
                                       ) 
                                     : 0;


  // a_ram
  assign a_ram_write_addr = a_ram_start_addr + (counter > 1 ? (counter - 2) / (ws_os == 0 ? row_size : col_size) : 0);
  assign a_ram_index_addr = counter > 1 ? (counter - 2) % (ws_os == 0 ? row_size : col_size) : 0;
  assign a_ram_write_req = counter > 1 && counter < col_size * row_size + 2;
endmodule

