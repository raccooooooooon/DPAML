/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Sun Nov 26 02:17:48 2023
/////////////////////////////////////////////////////////////


module half_adder_0 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_15 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_0 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_0 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_15 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_1 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_2 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_1 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_2 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_1 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_3 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_4 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_2 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_4 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_3 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_5 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_6 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_3 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_6 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_5 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_7 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_8 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_4 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_8 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_7 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_9 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_10 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_5 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_10 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_9 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_11 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_12 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_6 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_12 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_11 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_13 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_14 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_7 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_14 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_13 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module adder ( A, B, mode, sum, c_out );
  input [7:0] A;
  input [7:0] B;
  output [7:0] sum;
  input mode;
  output c_out;
  wire   B0, B1, B2, B3, B4, B5, B6, B7, n1;
  wire   [7:0] carry;
  assign c_out = carry[7];

  full_adder_0 Bit0 ( .x(A[0]), .y(B0), .z(n1), .s(sum[0]), .c(carry[0]) );
  full_adder_7 Bit1 ( .x(A[1]), .y(B1), .z(carry[0]), .s(sum[1]), .c(carry[1])
         );
  full_adder_6 Bit2 ( .x(A[2]), .y(B2), .z(carry[1]), .s(sum[2]), .c(carry[2])
         );
  full_adder_5 Bit3 ( .x(A[3]), .y(B3), .z(carry[2]), .s(sum[3]), .c(carry[3])
         );
  full_adder_4 Bit4 ( .x(A[4]), .y(B4), .z(carry[3]), .s(sum[4]), .c(carry[4])
         );
  full_adder_3 Bit5 ( .x(A[5]), .y(B5), .z(carry[4]), .s(sum[5]), .c(carry[5])
         );
  full_adder_2 Bit6 ( .x(A[6]), .y(B6), .z(carry[5]), .s(sum[6]), .c(carry[6])
         );
  full_adder_1 Bit7 ( .x(A[7]), .y(B7), .z(carry[6]), .s(sum[7]), .c(carry[7])
         );
  XOR2X1 U10 ( .A(n1), .B(B[7]), .Y(B7) );
  XOR2X1 U11 ( .A(n1), .B(B[6]), .Y(B6) );
  XOR2X1 U12 ( .A(n1), .B(B[5]), .Y(B5) );
  XOR2X1 U13 ( .A(n1), .B(B[4]), .Y(B4) );
  XOR2X1 U14 ( .A(n1), .B(B[3]), .Y(B3) );
  XOR2X1 U15 ( .A(n1), .B(B[2]), .Y(B2) );
  XOR2X1 U16 ( .A(n1), .B(B[1]), .Y(B1) );
  XOR2X1 U17 ( .A(n1), .B(B[0]), .Y(B0) );
  CLKINVX1 U18 ( .A(mode), .Y(n1) );
endmodule

