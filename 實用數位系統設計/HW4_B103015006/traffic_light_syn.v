/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Sun Dec 10 03:05:56 2023
/////////////////////////////////////////////////////////////


module counter ( reset, enable, clk, ST );
  output [2:0] ST;
  input reset, enable, clk;
  wire   N26, N27, N28, N29, n2, n3, n4, n5, n6, n1, n7;
  wire   [4:0] count;
  wire   [4:2] add_53_carry;

  DFFTRX1 count_reg_4_ ( .D(N29), .RN(n7), .CK(clk), .Q(count[4]) );
  DFFTRX1 count_reg_0_ ( .D(n1), .RN(n7), .CK(clk), .Q(count[0]), .QN(n1) );
  DFFTRX1 count_reg_1_ ( .D(N26), .RN(n7), .CK(clk), .Q(count[1]) );
  DFFTRX1 count_reg_2_ ( .D(N27), .RN(n7), .CK(clk), .Q(count[2]), .QN(n2) );
  DFFTRX1 count_reg_3_ ( .D(N28), .RN(n7), .CK(clk), .Q(count[3]) );
  AOI21X1 U3 ( .A0(n3), .A1(n5), .B0(count[4]), .Y(ST[0]) );
  NAND2X1 U4 ( .A(count[0]), .B(n2), .Y(n5) );
  AOI21X1 U5 ( .A0(n3), .A1(n4), .B0(count[4]), .Y(ST[1]) );
  NAND2X1 U6 ( .A(count[1]), .B(n2), .Y(n4) );
  AOI2BB1X1 U7 ( .A0N(count[3]), .A1N(count[2]), .B0(count[4]), .Y(ST[2]) );
  NAND2X1 U8 ( .A(count[3]), .B(count[2]), .Y(n3) );
  ADDHXL U9 ( .A(count[2]), .B(add_53_carry[2]), .CO(add_53_carry[3]), .S(N27)
         );
  ADDHXL U10 ( .A(count[1]), .B(count[0]), .CO(add_53_carry[2]), .S(N26) );
  ADDHXL U11 ( .A(count[3]), .B(add_53_carry[3]), .CO(add_53_carry[4]), .S(N28) );
  CLKINVX1 U12 ( .A(n6), .Y(n7) );
  NAND2BX1 U13 ( .AN(reset), .B(enable), .Y(n6) );
  XOR2X1 U14 ( .A(add_53_carry[4]), .B(count[4]), .Y(N29) );
endmodule


module traffic_light ( HG, HY, HR, FG, FY, FR, ST, enable, clk, reset );
  output [2:0] ST;
  input enable, clk, reset;
  output HG, HY, HR, FG, FY, FR;
  wire   n3, n4, n5, n6, n7, n8;

  counter count ( .reset(reset), .enable(enable), .clk(clk), .ST(ST) );
  NOR2X1 U15 ( .A(n3), .B(n7), .Y(FY) );
  AND2X2 U16 ( .A(n4), .B(n7), .Y(HY) );
  OAI22XL U17 ( .A0(n7), .A1(n5), .B0(n6), .B1(n8), .Y(n4) );
  AND2X2 U18 ( .A(ST[2]), .B(ST[0]), .Y(n6) );
  OAI22XL U19 ( .A0(n7), .A1(n4), .B0(ST[0]), .B1(FG), .Y(FR) );
  CLKINVX1 U20 ( .A(ST[0]), .Y(n7) );
  OA21XL U21 ( .A0(ST[2]), .A1(n8), .B0(n5), .Y(n3) );
  NOR2X1 U22 ( .A(n5), .B(ST[0]), .Y(FG) );
  NAND2X1 U23 ( .A(ST[2]), .B(n8), .Y(n5) );
  CLKINVX1 U24 ( .A(ST[1]), .Y(n8) );
  OA21XL U25 ( .A0(ST[0]), .A1(n8), .B0(n3), .Y(HG) );
  AO21X1 U26 ( .A0(n4), .A1(ST[0]), .B0(FG), .Y(HR) );
endmodule

