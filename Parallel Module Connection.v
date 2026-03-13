module top_module ( input clk, input d, output q );

    wire e1, e2;

    my_dff instance1 (clk, d, e1);
    my_dff instance2 (clk, e1, e2);
    my_dff instance3 (clk, e2, q);

endmodule
