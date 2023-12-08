/* MULTIPLIER.v */ 

module multiplier #(
    parameter integer   DATA_WIDTH     = 32
) (
    input wire [ DATA_WIDTH   -1 : 0]           a,
    input wire [ DATA_WIDTH   -1 : 0]           b,
    output wire [ DATA_WIDTH   -1 : 0]          out
    
);
    assign out = a * b;
endmodule