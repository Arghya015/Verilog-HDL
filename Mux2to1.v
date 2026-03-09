module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );
genvar i;
    generate 
        for (i=0;i<100;i=i+1)begin:mux_bus
            assign out[i]= ~sel&a[i] | sel&b[i];
        end
    endgenerate
endmodule
