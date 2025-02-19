//===================================================================================================//
//                                            Important Note                                            // 
//                                  1. DO NOT modify basic I/O names!                                 // 
//      2. If you have implemented overflow detection, please use Template 2; otherwise, use Template 1    //
//===================================================================================================//



//============== Template 1 ==============

module adder (A, B, mode, sum, c_out);

input	[7:0]	A, B;
input			mode;

output	[7:0]	sum;	
output			c_out;

wire	[7:0]	carry;

	   xor #(1)(B0, B[0], mode);
	   xor #(1)(B1, B[1], mode);
	   xor #(1)(B2, B[2], mode);
	   xor #(1)(B3, B[3], mode);
	   xor #(1)(B4, B[4], mode);
	   xor #(1)(B5, B[5], mode);
	   xor #(1)(B6, B[6], mode);
	   xor #(1)(B7, B[7], mode);
	
	   buf #(1)(c_out, carry[7]); 
	
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


//============== Template 2 ==============
/*
module adder (A, B, mode, sum, c_out, overflow);

input	[7:0]	A, B;
input			mode;

output	[7:0]	sum;
output			c_out;
output			overflow;

endmodule*/