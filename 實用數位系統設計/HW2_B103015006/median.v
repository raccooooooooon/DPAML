//===============================================================================//
//            PLEASE DO NOT modify basic I/O name or top module name!            // 
//===============================================================================//

module median (a0, a1, a2, out);

input    [7:0]   a0, a1, a2;

output   [7:0]   out;

//====================================================================
//======================= enter your code here =======================
wire	 [7:0]	SUM0, SUM1, SUM2;
wire			_a1, _a2, w0, w1, w2, w3, A, B, C, _A, _B, _C;

	eight_bits_adder a0_vs_a1 (a0, a1, 1'b1, SUM0);
	eight_bits_adder a1_vs_a2 (a1, a2, 1'b1, SUM1);
	eight_bits_adder a2_vs_a0 (a2, a0, 1'b1, SUM2);
	
	buf #(1) (A, SUM0[7]);
	buf #(1) (B, SUM1[7]);
	buf #(1) (C, SUM2[7]);
	
	not #(1) (_A, A);
	not #(1) (_B, B);
	not #(1) (_C, C);	
	
	and #(1) ( w0,  A,  B, _C);
	and #(1) ( w1, _A, _B,  C);
	and #(1) ( w3, _A,  B,  C);
	and #(1) ( w4,  A, _B, _C);

	or  #(1) (_a1, w0, w1);
	or  #(1) (_a2, w3, w4);

	output_sel	bit0(a0[0], a1[0], a2[0], _a1, _a2, out[0]);
	output_sel	bit1(a0[1], a1[1], a2[1], _a1, _a2, out[1]);
	output_sel	bit2(a0[2], a1[2], a2[2], _a1, _a2, out[2]);
	output_sel	bit3(a0[3], a1[3], a2[3], _a1, _a2, out[3]);
	output_sel	bit4(a0[4], a1[4], a2[4], _a1, _a2, out[4]);
	output_sel	bit5(a0[5], a1[5], a2[5], _a1, _a2, out[5]);
	output_sel	bit6(a0[6], a1[6], a2[6], _a1, _a2, out[6]);
	output_sel	bit7(a0[7], a1[7], a2[7], _a1, _a2, out[7]);

endmodule


module output_sel (x, y, z, a, b, out);

input	x, y, z, a, b;
output	out;
wire	w;

	mux2_1	m1(x, y, a, w);
	mux2_1	m2(w, z, b, out);
	
endmodule


module mux2_1 (x, y, sel, z);

input			x, y, sel;
output			z;
wire	[1:0]	w;

	not #(1) (_sel, sel);
	and #(1) (w[0], x, _sel);
	
	and #(1) (w[1], y, sel);
	
	or  #(1) (z, w[0], w[1]);
	
endmodule


module eight_bits_adder (A, B, mode, sum);

input	[7:0]	A, B;
input			mode;
output	[7:0]	sum;	
wire	[7:0]	carry;

	   xor #(1)(B0, B[0], mode);
	   xor #(1)(B1, B[1], mode);
	   xor #(1)(B2, B[2], mode);
	   xor #(1)(B3, B[3], mode);
	   xor #(1)(B4, B[4], mode);
	   xor #(1)(B5, B[5], mode);
	   xor #(1)(B6, B[6], mode);
	   xor #(1)(B7, B[7], mode);
	
	full_adder	Bit0( A[0], B0, mode, sum[0], carry[0] );
	full_adder	Bit1( A[1], B1, carry[0], sum[1], carry[1] );
	full_adder	Bit2( A[2], B2, carry[1], sum[2], carry[2] );
	full_adder	Bit3( A[3], B3, carry[2], sum[3], carry[3] );
	full_adder	Bit4( A[4], B4, carry[3], sum[4], carry[4] );
	full_adder	Bit5( A[5], B5, carry[4], sum[5], carry[5] );
	full_adder	Bit6( A[6], B6, carry[5], sum[6], carry[6] );
	full_adder	Bit7( A[7], B7, carry[6], sum[7], carry[7] );
	
endmodule


module full_adder ( x, y, z, s, c );

	input			x, y, z;
	output			s, c;
	
		half_adder	HA1( x, y, hs, hc );
		half_adder	HA2( hs, z, s, tc );
		
		or	#(1)			(c, tc, hc);
	
endmodule


module half_adder ( x, y, s, c );

	input 			x, y;
	output 			s, c;
	
		xor #(1)		( s, x, y );
		and #(1)		( c, x, y );
	
endmodule

//====================================================================


