module comp(input [1:0] a, input [1:0] b, output g,e,l);
  wire w1,w2,w3,w4,w5,w6,w7,w8;
  assign w3= ~(a[1]^b[1]);
  assign w6= ~(a[0]^b[0]);
  assign e= w3&w6;
  
  assign w1=a[1] & ~b[1];
  assign w2=a[0] & ~b[0];
  assign w4=w2&w3;
  assign g=w1|w4;
  
  assign w5=~a[1] & b[1];
  assign w7=~a[0] & b[0];
  assign w8=w7&w3;
  assign l=w5|w8;
  
endmodule
  
