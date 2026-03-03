module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    wire e;
    xnor (e,in1,in2);
    xor (out,e,in3);
    

endmodule
