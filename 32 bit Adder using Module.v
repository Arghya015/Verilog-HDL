module top_module(
    input [31:0] a,
    input [31:0] b,
    input cin,
    output [31:0] sum
); 
    wire carry;
    wire [15:0] sum_low, sum_high;

    add16 inst1 (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum_low),
        .cout(carry)
    );

    add16 inst2 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(carry),
        .sum(sum_high),
        .cout()
    );

    assign sum = {sum_high, sum_low};  

endmodule
