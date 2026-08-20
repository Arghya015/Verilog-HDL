module half_adder(
    input A,
    input B,
    output Sum,
    output Carry
);

    assign Sum   = A ^ B;
    assign Carry = A & B;

endmodule


module full_adder(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);

    wire S1, C1, C2;

    // First Half Adder
    half_adder HA1(
        .A(A),
        .B(B),
        .Sum(S1),
        .Carry(C1)
    );

    // Second Half Adder
    half_adder HA2(
        .A(S1),
        .B(Cin),
        .Sum(Sum),
        .Carry(C2)
    );

    // OR gate for final carry
    assign Cout = C1 | C2;

endmodule

module rca(input [3:0]a_rca, input [3:0] b_rca, input cin, output [3:0] sum_out, output c_out);
  wire w1,w2,w3;
  full_adder fa1(a_rca[0], b_rca[0], cin, sum_out[0], w1);
  full_adder fa2(a_rca[1], b_rca[1], w1, sum_out[1], w2);
  full_adder fa3(a_rca[2], b_rca[2], w2, sum_out[2], w3);
  full_adder fa4(a_rca[3], b_rca[3], w3, sum_out[3], c_out); 
endmodule

module bcd_adder(input [3:0] a_bcd, input [3:0] b_bcd, input cin, output [3:0] sum_out, output cout);
wire [3:0] sum_temp;
wire cout_temp;
wire a1,a2,o1;
wire [3:0] b_rca_2;
wire unused_cout;

  rca rca1(a_bcd,b_bcd,cin,sum_temp,cout_temp);

assign a1= sum_temp[3]&sum_temp[2];
assign a2= sum_temp[3]&sum_temp[1];
  assign o1= cout_temp|a1|a2;

  assign b_rca_2[0]= 1'b0;
assign b_rca_2[1]= o1;
assign b_rca_2[2]= o1;
  assign b_rca_2[3]= 1'b0;

  rca rca2(sum_temp,b_rca_2,1'b0,sum_out,unused_cout);
  assign cout=o1;

endmodule
