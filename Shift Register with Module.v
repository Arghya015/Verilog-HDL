module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
); 

    wire [7:0] e1, e2, e3;
    
    my_dff8 instance1(clk, d, e1);
    my_dff8 instance2(clk, e1, e2);
    my_dff8 instance3(clk, e2, e3);

    assign q = (sel==2'b00) ? d :
               (sel==2'b01) ? e1 :
               (sel==2'b10) ? e2 :
                              e3;

endmodule
