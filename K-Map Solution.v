module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    wire e1;
    assign e1 = c^d;
    assign out = (~a&(b^e1)) | (a&~(b^e1));

endmodule
