/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Sun Nov 26 03:19:27 2023
/////////////////////////////////////////////////////////////

`timescale 1ns/10ps

module half_adder_0 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_53 ( x, y, s, c );
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
  half_adder_53 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_37 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_38 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_19 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_38 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_37 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_39 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_40 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_20 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_40 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_39 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_41 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_42 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_21 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_42 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_41 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_43 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_44 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_22 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_44 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_43 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_45 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_46 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_23 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_46 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_45 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_47 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_48 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_24 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_48 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_47 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_49 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_50 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_25 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_50 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_49 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_51 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_52 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_26 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_52 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_51 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module three_bits_RCA_0 ( a0, a1, a2, a3, a4, cout );
  output [2:0] cout;
  input a0, a1, a2, a3, a4;

  wire   [8:0] S;
  wire   [8:0] C;
  assign cout[2] = S[8];
  assign cout[1] = S[6];
  assign cout[0] = S[3];

  full_adder_0 adder0 ( .x(a0), .y(a1), .z(1'b0), .s(S[0]), .c(C[0]) );
  full_adder_26 adder1 ( .x(a2), .y(S[0]), .z(1'b0), .s(S[1]), .c(C[1]) );
  full_adder_25 adder2 ( .x(a3), .y(S[1]), .z(1'b0), .s(S[2]), .c(C[2]) );
  full_adder_24 adder3 ( .x(a4), .y(S[2]), .z(1'b0), .s(S[3]), .c(C[3]) );
  full_adder_23 adder4 ( .x(C[0]), .y(C[1]), .z(1'b0), .s(S[4]), .c(C[4]) );
  full_adder_22 adder5 ( .x(C[2]), .y(S[4]), .z(1'b0), .s(S[5]), .c(C[5]) );
  full_adder_21 adder6 ( .x(C[3]), .y(S[5]), .z(1'b0), .s(S[6]), .c(C[6]) );
  full_adder_20 adder7 ( .x(C[4]), .y(C[5]), .z(1'b0), .s(S[7]) );
  full_adder_19 adder8 ( .x(C[6]), .y(S[7]), .z(1'b0), .s(S[8]) );
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


module half_adder_15 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_16 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_8 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_16 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_15 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_17 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_18 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_9 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_18 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_17 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module three_bits_RCA_1 ( a0, a1, a2, a3, a4, cout );
  output [2:0] cout;
  input a0, a1, a2, a3, a4;

  wire   [8:0] S;
  wire   [8:0] C;
  assign cout[2] = S[8];
  assign cout[1] = S[6];
  assign cout[0] = S[3];

  full_adder_9 adder0 ( .x(a0), .y(a1), .z(1'b0), .s(S[0]), .c(C[0]) );
  full_adder_8 adder1 ( .x(a2), .y(S[0]), .z(1'b0), .s(S[1]), .c(C[1]) );
  full_adder_7 adder2 ( .x(a3), .y(S[1]), .z(1'b0), .s(S[2]), .c(C[2]) );
  full_adder_6 adder3 ( .x(a4), .y(S[2]), .z(1'b0), .s(S[3]), .c(C[3]) );
  full_adder_5 adder4 ( .x(C[0]), .y(C[1]), .z(1'b0), .s(S[4]), .c(C[4]) );
  full_adder_4 adder5 ( .x(C[2]), .y(S[4]), .z(1'b0), .s(S[5]), .c(C[5]) );
  full_adder_3 adder6 ( .x(C[3]), .y(S[5]), .z(1'b0), .s(S[6]), .c(C[6]) );
  full_adder_2 adder7 ( .x(C[4]), .y(C[5]), .z(1'b0), .s(S[7]) );
  full_adder_1 adder8 ( .x(C[6]), .y(S[7]), .z(1'b0), .s(S[8]) );
endmodule


module half_adder_19 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_20 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_10 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_20 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_19 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_21 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_22 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_11 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_22 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_21 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_23 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_24 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_12 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_24 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_23 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_25 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_26 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_13 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_26 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_25 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_27 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_28 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_14 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_28 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_27 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_29 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_30 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_15 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_30 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_29 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_31 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_32 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_16 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_32 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_31 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_33 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_34 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_17 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_34 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_33 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module half_adder_35 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_36 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_18 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   hs, hc, tc;

  half_adder_36 HA1 ( .x(x), .y(y), .s(hs), .c(hc) );
  half_adder_35 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
  OR2X1 U1 ( .A(hc), .B(tc), .Y(c) );
endmodule


module three_bits_RCA_2 ( a0, a1, a2, a3, a4, cout );
  output [2:0] cout;
  input a0, a1, a2, a3, a4;

  wire   [8:0] S;
  wire   [8:0] C;
  assign cout[2] = S[8];
  assign cout[1] = S[6];
  assign cout[0] = S[3];

  full_adder_18 adder0 ( .x(a0), .y(a1), .z(1'b0), .s(S[0]), .c(C[0]) );
  full_adder_17 adder1 ( .x(a2), .y(S[0]), .z(1'b0), .s(S[1]), .c(C[1]) );
  full_adder_16 adder2 ( .x(a3), .y(S[1]), .z(1'b0), .s(S[2]), .c(C[2]) );
  full_adder_15 adder3 ( .x(a4), .y(S[2]), .z(1'b0), .s(S[3]), .c(C[3]) );
  full_adder_14 adder4 ( .x(C[0]), .y(C[1]), .z(1'b0), .s(S[4]), .c(C[4]) );
  full_adder_13 adder5 ( .x(C[2]), .y(S[4]), .z(1'b0), .s(S[5]), .c(C[5]) );
  full_adder_12 adder6 ( .x(C[3]), .y(S[5]), .z(1'b0), .s(S[6]), .c(C[6]) );
  full_adder_11 adder7 ( .x(C[4]), .y(C[5]), .z(1'b0), .s(S[7]) );
  full_adder_10 adder8 ( .x(C[6]), .y(S[7]), .z(1'b0), .s(S[8]) );
endmodule


module voting ( a0, a1, a2, a3, a4, out );
  input [2:0] a0;
  input [2:0] a1;
  input [2:0] a2;
  input [2:0] a3;
  input [2:0] a4;
  output [2:0] out;
  wire   n4, n5;
  wire   [2:0] X;
  wire   [2:0] Y;
  wire   [2:0] Z;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;

  three_bits_RCA_0 RCA0 ( .a0(a0[0]), .a1(a1[0]), .a2(a2[0]), .a3(a3[0]), .a4(
        a4[0]), .cout(X) );
  three_bits_RCA_2 RCA1 ( .a0(a0[1]), .a1(a1[1]), .a2(a2[1]), .a3(a3[1]), .a4(
        a4[1]), .cout({SYNOPSYS_UNCONNECTED__0, Y[1:0]}) );
  three_bits_RCA_1 RCA2 ( .a0(a0[2]), .a1(a1[2]), .a2(a2[2]), .a3(a3[2]), .a4(
        a4[2]), .cout({Z[2:1], SYNOPSYS_UNCONNECTED__1}) );
  AND2X2 U7 ( .A(X[1]), .B(X[0]), .Y(n4) );
  NOR2X1 U8 ( .A(out[2]), .B(out[0]), .Y(out[1]) );
  AO21X1 U9 ( .A0(n5), .A1(Z[1]), .B0(Z[2]), .Y(out[2]) );
  AOI21X1 U10 ( .A0(Y[1]), .A1(Y[0]), .B0(n4), .Y(n5) );
  OR2X1 U11 ( .A(X[2]), .B(n4), .Y(out[0]) );
endmodule

