module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   );
    
    assign out_assign = a^b;
    always @(*) begin:comb
        out_always_comb = a^b;
    end
    always @(posedge clk)begin:ff
        out_always_ff <= a^b;
    end
    

endmodule
