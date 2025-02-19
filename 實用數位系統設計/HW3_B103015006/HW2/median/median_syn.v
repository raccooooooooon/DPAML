/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Sun Nov 26 04:03:54 2023
/////////////////////////////////////////////////////////////

`timescale 1ns/10ps

module half_adder_0 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_47 ( x, y, s, c );
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
  half_adder_47 HA2 ( .x(hs), .y(z), .s(s), .c(tc) );
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


module eight_bits_adder_0 ( A, B, mode, sum );
  input [7:0] A;
  input [7:0] B;
  output [7:0] sum;
  input mode;
  wire   B0, B1, B2, B3, B4, B5, B6, B7;
  wire   [7:0] carry;

  full_adder_0 Bit0 ( .x(A[0]), .y(B0), .z(mode), .s(sum[0]), .c(carry[0]) );
  full_adder_23 Bit1 ( .x(A[1]), .y(B1), .z(carry[0]), .s(sum[1]), .c(carry[1]) );
  full_adder_22 Bit2 ( .x(A[2]), .y(B2), .z(carry[1]), .s(sum[2]), .c(carry[2]) );
  full_adder_21 Bit3 ( .x(A[3]), .y(B3), .z(carry[2]), .s(sum[3]), .c(carry[3]) );
  full_adder_20 Bit4 ( .x(A[4]), .y(B4), .z(carry[3]), .s(sum[4]), .c(carry[4]) );
  full_adder_19 Bit5 ( .x(A[5]), .y(B5), .z(carry[4]), .s(sum[5]), .c(carry[5]) );
  full_adder_18 Bit6 ( .x(A[6]), .y(B6), .z(carry[5]), .s(sum[6]), .c(carry[6]) );
  full_adder_17 Bit7 ( .x(A[7]), .y(B7), .z(carry[6]), .s(sum[7]) );
  XOR2X1 U1 ( .A(mode), .B(B[7]), .Y(B7) );
  XOR2X1 U2 ( .A(mode), .B(B[6]), .Y(B6) );
  XOR2X1 U3 ( .A(mode), .B(B[5]), .Y(B5) );
  XOR2X1 U4 ( .A(mode), .B(B[4]), .Y(B4) );
  XOR2X1 U5 ( .A(mode), .B(B[3]), .Y(B3) );
  XOR2X1 U6 ( .A(mode), .B(B[2]), .Y(B2) );
  XOR2X1 U7 ( .A(mode), .B(B[1]), .Y(B1) );
  XOR2X1 U8 ( .A(mode), .B(B[0]), .Y(B0) );
endmodule


module mux2_1_0 ( x, y, sel, z );
  input x, y, sel;
  output z;


  CLKMX2X2 U1 ( .A(x), .B(y), .S0(sel), .Y(z) );
endmodule


module mux2_1_15 ( x, y, sel, z );
  input x, y, sel;
  output z;


  CLKMX2X2 U1 ( .A(x), .B(y), .S0(sel), .Y(z) );
endmodule


module output_sel_0 ( x, y, z, a, b, out );
  input x, y, z, a, b;
  output out;
  wire   w;

  mux2_1_0 m1 ( .x(x), .y(y), .sel(a), .z(w) );
  mux2_1_15 m2 ( .x(w), .y(z), .sel(b), .z(out) );
endmodule


module mux2_1_1 ( x, y, sel, z );
  input x, y, sel;
  output z;


  CLKMX2X2 U1 ( .A(x), .B(y), .S0(sel), .Y(z) );
endmodule


module mux2_1_2 ( x, y, sel, z );
  input x, y, sel;
  output z;


  CLKMX2X2 U1 ( .A(x), .B(y), .S0(sel), .Y(z) );
endmodule


module output_sel_1 ( x, y, z, a, b, out );
  input x, y, z, a, b;
  output out;
  wire   w;

  mux2_1_2 m1 ( .x(x), .y(y), .sel(a), .z(w) );
  mux2_1_1 m2 ( .x(w), .y(z), .sel(b), .z(out) );
endmodule


module mux2_1_3 ( x, y, sel, z );
  input x, y, sel;
  output z;


  CLKMX2X2 U1 ( .A(x), .B(y), .S0(sel), .Y(z) );
endmodule


module mux2_1_4 ( x, y, sel, z );
  input x, y, sel;
  output z;


  CLKMX2X2 U1 ( .A(x), .B(y), .S0(sel), .Y(z) );
endmodule


module output_sel_2 ( x, y, z, a, b, out );
  input x, y, z, a, b;
  output out;
  wire   w;

  mux2_1_4 m1 ( .x(x), .y(y), .sel(a), .z(w) );
  mux2_1_3 m2 ( .x(w), .y(z), .sel(b), .z(out) );
endmodule


module mux2_1_5 ( x, y, sel, z );
  input x, y, sel;
  output z;


  CLKMX2X2 U1 ( .A(x), .B(y), .S0(sel), .Y(z) );
endmodule


module mux2_1_6 ( x, y, sel, z );
  input x, y, sel;
  output z;


  CLKMX2X2 U1 ( .A(x), .B(y), .S0(sel), .Y(z) );
endmodule


module output_sel_3 ( x, y, z, a, b, out );
  input x, y, z, a, b;
  output out;
  wire   w;

  mux2_1_6 m1 ( .x(x), .y(y), .sel(a), .z(w) );
  mux2_1_5 m2 ( .x(w), .y(z), .sel(b), .z(out) );
endmodule


module mux2_1_7 ( x, y, sel, z );
  input x, y, sel;
  output z;


  CLKMX2X2 U1 ( .A(x), .B(y), .S0(sel), .Y(z) );
endmodule


module mux2_1_8 ( x, y, sel, z );
  input x, y, sel;
  output z;


  CLKMX2X2 U1 ( .A(x), .B(y), .S0(sel), .Y(z) );
endmodule


module output_sel_4 ( x, y, z, a, b, out );
  input x, y, z, a, b;
  output out;
  wire   w;

  mux2_1_8 m1 ( .x(x), .y(y), .sel(a), .z(w) );
  mux2_1_7 m2 ( .x(w), .y(z), .sel(b), .z(out) );
endmodule


module mux2_1_9 ( x, y, sel, z );
  input x, y, sel;
  output z;


  CLKMX2X2 U1 ( .A(x), .B(y), .S0(sel), .Y(z) );
endmodule


module mux2_1_10 ( x, y, sel, z );
  input x, y, sel;
  output z;


  CLKMX2X2 U1 ( .A(x), .B(y), .S0(sel), .Y(z) );
endmodule


module output_sel_5 ( x, y, z, a, b, out );
  input x, y, z, a, b;
  output out;
  wire   w;

  mux2_1_10 m1 ( .x(x), .y(y), .sel(a), .z(w) );
  mux2_1_9 m2 ( .x(w), .y(z), .sel(b), .z(out) );
endmodule


module mux2_1_11 ( x, y, sel, z );
  input x, y, sel;
  output z;


  CLKMX2X2 U1 ( .A(x), .B(y), .S0(sel), .Y(z) );
endmodule


module mux2_1_12 ( x, y, sel, z );
  input x, y, sel;
  output z;


  CLKMX2X2 U1 ( .A(x), .B(y), .S0(sel), .Y(z) );
endmodule


module output_sel_6 ( x, y, z, a, b, out );
  input x, y, z, a, b;
  output out;
  wire   w;

  mux2_1_12 m1 ( .x(x), .y(y), .sel(a), .z(w) );
  mux2_1_11 m2 ( .x(w), .y(z), .sel(b), .z(out) );
endmodule


module mux2_1_13 ( x, y, sel, z );
  input x, y, sel;
  output z;


  CLKMX2X2 U1 ( .A(x), .B(y), .S0(sel), .Y(z) );
endmodule


module mux2_1_14 ( x, y, sel, z );
  input x, y, sel;
  output z;


  CLKMX2X2 U1 ( .A(x), .B(y), .S0(sel), .Y(z) );
endmodule


module output_sel_7 ( x, y, z, a, b, out );
  input x, y, z, a, b;
  output out;
  wire   w;

  mux2_1_14 m1 ( .x(x), .y(y), .sel(a), .z(w) );
  mux2_1_13 m2 ( .x(w), .y(z), .sel(b), .z(out) );
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


module eight_bits_adder_1 ( A, B, mode, sum );
  input [7:0] A;
  input [7:0] B;
  output [7:0] sum;
  input mode;
  wire   B0, B1, B2, B3, B4, B5, B6, B7;
  wire   [7:0] carry;

  full_adder_8 Bit0 ( .x(A[0]), .y(B0), .z(mode), .s(sum[0]), .c(carry[0]) );
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
  full_adder_1 Bit7 ( .x(A[7]), .y(B7), .z(carry[6]), .s(sum[7]) );
  XOR2X1 U1 ( .A(mode), .B(B[7]), .Y(B7) );
  XOR2X1 U2 ( .A(mode), .B(B[6]), .Y(B6) );
  XOR2X1 U3 ( .A(mode), .B(B[5]), .Y(B5) );
  XOR2X1 U4 ( .A(mode), .B(B[4]), .Y(B4) );
  XOR2X1 U5 ( .A(mode), .B(B[3]), .Y(B3) );
  XOR2X1 U6 ( .A(mode), .B(B[2]), .Y(B2) );
  XOR2X1 U7 ( .A(mode), .B(B[1]), .Y(B1) );
  XOR2X1 U8 ( .A(mode), .B(B[0]), .Y(B0) );
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


module eight_bits_adder_2 ( A, B, mode, sum );
  input [7:0] A;
  input [7:0] B;
  output [7:0] sum;
  input mode;
  wire   B0, B1, B2, B3, B4, B5, B6, B7;
  wire   [7:0] carry;

  full_adder_16 Bit0 ( .x(A[0]), .y(B0), .z(mode), .s(sum[0]), .c(carry[0]) );
  full_adder_15 Bit1 ( .x(A[1]), .y(B1), .z(carry[0]), .s(sum[1]), .c(carry[1]) );
  full_adder_14 Bit2 ( .x(A[2]), .y(B2), .z(carry[1]), .s(sum[2]), .c(carry[2]) );
  full_adder_13 Bit3 ( .x(A[3]), .y(B3), .z(carry[2]), .s(sum[3]), .c(carry[3]) );
  full_adder_12 Bit4 ( .x(A[4]), .y(B4), .z(carry[3]), .s(sum[4]), .c(carry[4]) );
  full_adder_11 Bit5 ( .x(A[5]), .y(B5), .z(carry[4]), .s(sum[5]), .c(carry[5]) );
  full_adder_10 Bit6 ( .x(A[6]), .y(B6), .z(carry[5]), .s(sum[6]), .c(carry[6]) );
  full_adder_9 Bit7 ( .x(A[7]), .y(B7), .z(carry[6]), .s(sum[7]) );
  XOR2X1 U1 ( .A(mode), .B(B[7]), .Y(B7) );
  XOR2X1 U2 ( .A(mode), .B(B[6]), .Y(B6) );
  XOR2X1 U3 ( .A(mode), .B(B[5]), .Y(B5) );
  XOR2X1 U4 ( .A(mode), .B(B[4]), .Y(B4) );
  XOR2X1 U5 ( .A(mode), .B(B[3]), .Y(B3) );
  XOR2X1 U6 ( .A(mode), .B(B[2]), .Y(B2) );
  XOR2X1 U7 ( .A(mode), .B(B[1]), .Y(B1) );
  XOR2X1 U8 ( .A(mode), .B(B[0]), .Y(B0) );
endmodule


module median ( a0, a1, a2, out );
  input [7:0] a0;
  input [7:0] a1;
  input [7:0] a2;
  output [7:0] out;
  wire   \SUM0[7] , \SUM1[7] , \SUM2[7] , _a1, _a2, n4, n5, n6, n7;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20;

  eight_bits_adder_0 a0_vs_a1 ( .A(a0), .B(a1), .mode(1'b1), .sum({\SUM0[7] , 
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6}) );
  eight_bits_adder_2 a1_vs_a2 ( .A(a1), .B(a2), .mode(1'b1), .sum({\SUM1[7] , 
        SYNOPSYS_UNCONNECTED__7, SYNOPSYS_UNCONNECTED__8, 
        SYNOPSYS_UNCONNECTED__9, SYNOPSYS_UNCONNECTED__10, 
        SYNOPSYS_UNCONNECTED__11, SYNOPSYS_UNCONNECTED__12, 
        SYNOPSYS_UNCONNECTED__13}) );
  eight_bits_adder_1 a2_vs_a0 ( .A(a2), .B(a0), .mode(1'b1), .sum({\SUM2[7] , 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20}) );
  output_sel_0 bit0 ( .x(a0[0]), .y(a1[0]), .z(a2[0]), .a(_a1), .b(_a2), .out(
        out[0]) );
  output_sel_7 bit1 ( .x(a0[1]), .y(a1[1]), .z(a2[1]), .a(_a1), .b(_a2), .out(
        out[1]) );
  output_sel_6 bit2 ( .x(a0[2]), .y(a1[2]), .z(a2[2]), .a(_a1), .b(_a2), .out(
        out[2]) );
  output_sel_5 bit3 ( .x(a0[3]), .y(a1[3]), .z(a2[3]), .a(_a1), .b(_a2), .out(
        out[3]) );
  output_sel_4 bit4 ( .x(a0[4]), .y(a1[4]), .z(a2[4]), .a(_a1), .b(_a2), .out(
        out[4]) );
  output_sel_3 bit5 ( .x(a0[5]), .y(a1[5]), .z(a2[5]), .a(_a1), .b(_a2), .out(
        out[5]) );
  output_sel_2 bit6 ( .x(a0[6]), .y(a1[6]), .z(a2[6]), .a(_a1), .b(_a2), .out(
        out[6]) );
  output_sel_1 bit7 ( .x(a0[7]), .y(a1[7]), .z(a2[7]), .a(_a1), .b(_a2), .out(
        out[7]) );
  MXI2X1 U7 ( .A(n4), .B(n5), .S0(\SUM0[7] ), .Y(_a2) );
  OR2X1 U8 ( .A(\SUM1[7] ), .B(\SUM2[7] ), .Y(n5) );
  NAND2X1 U9 ( .A(\SUM2[7] ), .B(\SUM1[7] ), .Y(n4) );
  MXI2X1 U10 ( .A(n6), .B(n7), .S0(\SUM1[7] ), .Y(_a1) );
  NAND2BX1 U11 ( .AN(\SUM2[7] ), .B(\SUM0[7] ), .Y(n7) );
  NAND2BX1 U12 ( .AN(\SUM0[7] ), .B(\SUM2[7] ), .Y(n6) );
endmodule

