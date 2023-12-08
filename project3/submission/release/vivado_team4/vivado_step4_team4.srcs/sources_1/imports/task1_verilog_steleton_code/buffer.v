/* BUFFER.v */ 

module buffer #(
    parameter integer   DATA_WIDTH     = 32
) (
    input wire                                  reset,
    input wire                                  clk,
    input wire [ DATA_WIDTH   -1 : 0]           in,
    output wire [ DATA_WIDTH   -1 : 0]          out
    
);
    reg [ DATA_WIDTH -1 : 0] in_reg;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            in_reg <= 0;
        end else begin
            in_reg <= in;
        end
    end
    assign out = in_reg;
endmodule