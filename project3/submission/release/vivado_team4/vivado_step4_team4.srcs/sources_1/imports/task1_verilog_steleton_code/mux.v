/* MUX.v */ 

module mux #(
    parameter integer   DATA_WIDTH     = 32
) (
    input wire                                  select_bit,
    input wire [ DATA_WIDTH   -1 : 0]           input_a,
    input wire [ DATA_WIDTH   -1 : 0]           input_b,
    output wire [ DATA_WIDTH   -1 : 0]          result
    
);
    assign result = select_bit ? input_b : input_a;
endmodule