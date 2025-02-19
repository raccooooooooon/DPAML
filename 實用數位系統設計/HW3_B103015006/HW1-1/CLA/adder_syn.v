/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Sun Nov 26 02:00:54 2023
/////////////////////////////////////////////////////////////

`timescale 1ns/10ps

module pg_generator_0 ( x, y, p, g );
  input x, y;
  output p, g;


  XOR2X1 U1 ( .A(y), .B(x), .Y(p) );
  AND2X1 U2 ( .A(y), .B(x), .Y(g) );
endmodule


module pg_generator_1 ( x, y, p, g );
  input x, y;
  output p, g;


  XOR2X1 U1 ( .A(y), .B(x), .Y(p) );
  AND2X1 U2 ( .A(y), .B(x), .Y(g) );
endmodule


module pg_generator_2 ( x, y, p, g );
  input x, y;
  output p, g;


  XOR2X1 U1 ( .A(y), .B(x), .Y(p) );
  AND2X1 U2 ( .A(y), .B(x), .Y(g) );
endmodule


module pg_generator_3 ( x, y, p, g );
  input x, y;
  output p, g;


  XOR2X1 U1 ( .A(y), .B(x), .Y(p) );
  AND2X1 U2 ( .A(y), .B(x), .Y(g) );
endmodule


module pg_generator_4 ( x, y, p, g );
  input x, y;
  output p, g;


  XOR2X1 U1 ( .A(y), .B(x), .Y(p) );
  AND2X1 U2 ( .A(y), .B(x), .Y(g) );
endmodule


module pg_generator_5 ( x, y, p, g );
  input x, y;
  output p, g;


  XOR2X1 U1 ( .A(y), .B(x), .Y(p) );
  AND2X1 U2 ( .A(y), .B(x), .Y(g) );
endmodule


module pg_generator_6 ( x, y, p, g );
  input x, y;
  output p, g;


  XOR2X1 U1 ( .A(y), .B(x), .Y(p) );
  AND2X1 U2 ( .A(y), .B(x), .Y(g) );
endmodule


module pg_generator_7 ( x, y, p, g );
  input x, y;
  output p, g;


  XOR2X1 U1 ( .A(y), .B(x), .Y(p) );
  AND2X1 U2 ( .A(y), .B(x), .Y(g) );
endmodule


module adder ( A, B, mode, sum, c_out );
  input [7:0] A;
  input [7:0] B;
  output [7:0] sum;
  input mode;
  output c_out;
  wire   B0, B1, B2, B3, B4, B5, B6, B7, \C[8] , n9, n10, n11, n12, n13, n14,
         n15, n16;
  wire   [7:0] P;
  wire   [7:0] G;
  assign c_out = \C[8] ;

  pg_generator_0 PG0 ( .x(A[0]), .y(B0), .p(P[0]), .g(G[0]) );
  pg_generator_7 PG1 ( .x(A[1]), .y(B1), .p(P[1]), .g(G[1]) );
  pg_generator_6 PG2 ( .x(A[2]), .y(B2), .p(P[2]), .g(G[2]) );
  pg_generator_5 PG3 ( .x(A[3]), .y(B3), .p(P[3]), .g(G[3]) );
  pg_generator_4 PG4 ( .x(A[4]), .y(B4), .p(P[4]), .g(G[4]) );
  pg_generator_3 PG5 ( .x(A[5]), .y(B5), .p(P[5]), .g(G[5]) );
  pg_generator_2 PG6 ( .x(A[6]), .y(B6), .p(P[6]), .g(G[6]) );
  pg_generator_1 PG7 ( .x(A[7]), .y(B7), .p(P[7]), .g(G[7]) );
  XOR2X1 U26 ( .A(P[7]), .B(n9), .Y(sum[7]) );
  XOR2X1 U27 ( .A(P[6]), .B(n10), .Y(sum[6]) );
  XOR2X1 U28 ( .A(P[5]), .B(n11), .Y(sum[5]) );
  XOR2X1 U29 ( .A(P[4]), .B(n12), .Y(sum[4]) );
  XOR2X1 U30 ( .A(P[3]), .B(n13), .Y(sum[3]) );
  XOR2X1 U31 ( .A(P[2]), .B(n14), .Y(sum[2]) );
  XOR2X1 U32 ( .A(P[1]), .B(n15), .Y(sum[1]) );
  XNOR2X1 U33 ( .A(P[0]), .B(mode), .Y(sum[0]) );
  AO21X1 U34 ( .A0(P[7]), .A1(n9), .B0(G[7]), .Y(\C[8] ) );
  AO21X1 U35 ( .A0(P[6]), .A1(n10), .B0(G[6]), .Y(n9) );
  AO21X1 U36 ( .A0(P[5]), .A1(n11), .B0(G[5]), .Y(n10) );
  AO21X1 U37 ( .A0(P[4]), .A1(n12), .B0(G[4]), .Y(n11) );
  AO21X1 U38 ( .A0(P[3]), .A1(n13), .B0(G[3]), .Y(n12) );
  AO21X1 U39 ( .A0(P[2]), .A1(n14), .B0(G[2]), .Y(n13) );
  AO21X1 U40 ( .A0(P[1]), .A1(n15), .B0(G[1]), .Y(n14) );
  AO21X1 U41 ( .A0(P[0]), .A1(n16), .B0(G[0]), .Y(n15) );
  CLKINVX1 U42 ( .A(mode), .Y(n16) );
  XNOR2X1 U43 ( .A(mode), .B(B[7]), .Y(B7) );
  XNOR2X1 U44 ( .A(mode), .B(B[6]), .Y(B6) );
  XNOR2X1 U45 ( .A(mode), .B(B[5]), .Y(B5) );
  XNOR2X1 U46 ( .A(mode), .B(B[4]), .Y(B4) );
  XNOR2X1 U47 ( .A(mode), .B(B[3]), .Y(B3) );
  XNOR2X1 U48 ( .A(mode), .B(B[2]), .Y(B2) );
  XNOR2X1 U49 ( .A(mode), .B(B[1]), .Y(B1) );
  XNOR2X1 U50 ( .A(mode), .B(B[0]), .Y(B0) );
endmodule

