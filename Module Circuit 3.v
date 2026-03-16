module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire carry1;
    wire [15:0] sum4;
    wire [15:0] sum1, sum2;
    wire [15:0] sum3;

    add16 instance1(.a(a[15:0]),.b(b[15:0]),.cin(1'b0),.sum(sum4),.cout(carry1) );

    add16 instance2(.a(a[31:16]),.b(b[31:16]),.cin(1'b0),.sum(sum1),.cout());

    add16 instance3(.a(a[31:16]),.b(b[31:16]),.cin(1'b1),.sum(sum2),.cout() );

    assign sum3 = carry1? sum2:sum1;

    assign sum = {sum3, sum4};

endmodule
