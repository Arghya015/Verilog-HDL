module top_module( 
    input a, b, cin,
    output cout, sum );
    wire e,e1,e2;
    xor (e,a,b);
    xor (sum,e,cin);
    and (e1,e,cin);
    and (e2,a,b);
    or(cout,e1,e2);

endmodule
