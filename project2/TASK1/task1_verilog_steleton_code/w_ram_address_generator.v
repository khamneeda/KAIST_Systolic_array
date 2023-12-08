`timescale 100ns/1ns
module w_ram_address_generator
#(
  parameter integer INTEGER_BIT       = 7,
  parameter integer W_RAM_ADDR_WIDTH  = 7
)
(
  input  wire                         enable,
  output wire                         finish,
  input  wire                         clk,
  input  wire                         ws_os,
  input  wire [INTEGER_BIT-1:0]       col_size,
  input  wire [INTEGER_BIT-1:0]       row_size,
  input  wire [INTEGER_BIT-1:0]       bram_col_size,
  input  wire [INTEGER_BIT-1:0]       bram_row_size,
  input  wire [INTEGER_BIT-1:0]       bram_col_start_index,
  input  wire [INTEGER_BIT-1:0]       bram_row_start_index,

  output wire [32-1:0]                addr_w_bram,
  output wire                         enable_w_bram,

  output wire                         w_ram_write_req,
  output wire [W_RAM_ADDR_WIDTH-1:0]  w_ram_write_addr,
  output wire [INTEGER_BIT-1:0]       w_ram_index_addr,
  input wire [W_RAM_ADDR_WIDTH-1:0]   w_ram_start_addr
);

  reg finish_reg;
  reg [INTEGER_BIT - 1 : 0] counter;

  always @(posedge clk) begin
    if (enable) begin
      if (!finish && counter < col_size * row_size + 1)
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
  // w_bram
  assign enable_w_bram = !finish && enable && counter < col_size * row_size;
  assign addr_w_bram = enable_w_bram ? (bram_col_start_index + counter / row_size) * bram_row_size + (bram_row_start_index + counter % row_size) : 0;

  // w_ram
  assign w_ram_write_addr = w_ram_start_addr + (counter > 1 ? (ws_os == 0 ? col_size - ((counter - 2) / row_size) - 1 : (counter - 2) / row_size) : 0);
  assign w_ram_index_addr = counter > 1 ? (counter - 2) % row_size : 0;
  assign w_ram_write_req = counter > 1 && counter < col_size * row_size + 2;
endmodule

