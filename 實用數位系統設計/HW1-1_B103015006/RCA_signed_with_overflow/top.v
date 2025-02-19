//===================================================================================================//
//                                            Important Note                                            // 
//                                  1. DO NOT modify basic I/O names!                                 // 
//      2. If you have implemented overflow detection, please use Template 2; otherwise, use Template 1    //
//===================================================================================================//



//============== Template 1 ==============
/*
module adder (A, B, mode, sum, c_out);

	input	[7:0]	A, B;
	input			mode;

	output	[7:0]	sum;
	output			c_out;

endmodule
*/



//============== Template 2 ==============

module adder (A, B, mode, sum_difference, c_out, overflow);

input	[7:0]	A, B;
input			mode;

output	[7:0]	sum_difference;	
output			c_out;
output			overflow;

wire	[7:0]	carry;
	
	xor (B0, B[0], mode);
	xor (B1, B[1], mode);
	xor (B2, B[2], mode);
	xor (B3, B[3], mode);
	xor (B4, B[4], mode);
	xor (B5, B[5], mode);
	xor (B6, B[6], mode);
	xor (B7, B[7], mode);
	
	
	xor(c_out, carry[7], mode); 
	or(overflow, carry[0], carry[6], carry[5], carry[4], carry[3], carry[2], carry[1]);
	
	full_adder	Bit0( A[0], B0, mode, sum_difference[0], carry[0] );
	full_adder	Bit1( A[1], B1, carry[0], sum_difference[1], carry[1] );
	full_adder	Bit2( A[2], B2, carry[1], sum_difference[2], carry[2] );
	full_adder	Bit3( A[3], B3, carry[2], sum_difference[3], carry[3] );
	full_adder	Bit4( A[4], B4, carry[3], sum_difference[4], carry[4] );
	full_adder	Bit5( A[5], B5, carry[4], sum_difference[5], carry[5] );
	full_adder	Bit6( A[6], B6, carry[5], sum_difference[6], carry[6] );
	full_adder	Bit7( A[7], B7, carry[6], sum_difference[7], carry[7] );
	
endmodule


module full_adder ( x, y, z, s, c );

	input			x, y, z;
	output			s, c;
	half_adder	HA1( x, y, hs, hc );
	half_adder	HA2( hs, z, s, tc );
	or				(c, tc, hc);
	
endmodule


module half_adder ( x, y, s, c );

	input 			x, y;
	output 			s, c;
	xor 			( s, x, y );
	and 			( c, x, y );
	
endmodule