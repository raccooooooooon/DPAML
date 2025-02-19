//===================================================================================================//
//                                            Important Note                                            // 
//                                  1. DO NOT modify basic I/O names!                                 // 
//      2. If you have implemented overflow detection, please use Template 2; otherwise, use Template 1    //
//===================================================================================================//



//============== Template 1 ==============



module adder ( A, B, mode, sum, c_out );

	input	[7:0]	A, B;
	input			mode;
	output	[7:0]	sum;
	output			c_out;
	wire	[8:0]	C;
	wire	[7:0]	P, G;
	
	wire			W0;
	wire	[1:0]	W1;
	wire	[2:0]	W2;
	wire	[3:0]	W3;
	wire	[4:0]	W4;
	wire	[5:0]	W5;
	wire	[6:0]	W6;
	wire	[7:0]	W7;
	
	   xor #(1)(B0, B[0], mode);
	   xor #(1)(B1, B[1], mode);
	   xor #(1)(B2, B[2], mode);
	   xor #(1)(B3, B[3], mode);
	   xor #(1)(B4, B[4], mode);
	   xor #(1)(B5, B[5], mode);
	   xor #(1)(B6, B[6], mode);
	   xor #(1)(B7, B[7], mode);
	   
	   buf #(1)(C[0], mode);
	 
		pg_generator	PG0( A[0], B0, P[0], G[0] );
		pg_generator	PG1( A[1], B1, P[1], G[1] );
		pg_generator	PG2( A[2], B2, P[2], G[2] );
		pg_generator	PG3( A[3], B3, P[3], G[3] );
		pg_generator	PG4( A[4], B4, P[4], G[4] );
		pg_generator	PG5( A[5], B5, P[5], G[5] );
		pg_generator	PG6( A[6], B6, P[6], G[6] );
		pg_generator	PG7( A[7], B7, P[7], G[7] );
	
		and #(1)(W0, C[0], P[0]);
		or	#(1)(C[1], W0, G[0]);
		
		and	#(1)(W1[0], G[0], P[1]);
		and	#(1)(W1[1], C[0], P[0], P[1]);
		or	#(1)(C[2], W1[0], W1[1], G[1]);
		
		and	#(1)(W2[0], G[1], P[2]);
		and #(1)(W2[1], G[0], P[1], P[2]);
		and #(1)(W2[2], C[0], P[0], P[1], P[2]);
		or	#(1)(C[3], W2[0], W2[1], W2[2], G[2]);
		
		and	#(1)(W3[0], G[2], P[3]);
		and #(1)(W3[1], G[1], P[2], P[3]);
		and #(1)(W3[2], G[0], P[1], P[2], P[3]);
		and #(1)(W3[3], C[0], P[0], P[1], P[2], P[3]);
		or	#(1)(C[4], W3[0], W3[1], W3[2], W3[3], G[3]);
		
		and	#(1)(W4[0], G[3], P[4]);
		and	#(1)(W4[1], G[2], P[3], P[4]);
		and #(1)(W4[2], G[1], P[2], P[3], P[4]);
		and #(1)(W4[3], G[0], P[1], P[2], P[3], P[4]);
		and #(1)(W4[4], C[0], P[0], P[1], P[2], P[3], P[4]);
		or	#(1)(C[5], W4[0], W4[1], W4[2], W4[3], W4[4], G[4]);
		
		and #(1)(W5[0], G[4], P[5]);
		and	#(1)(W5[1], G[3], P[4], P[5]);
		and #(1)(W5[2], G[2], P[3], P[4], P[5]);
		and	#(1)(W5[3], G[1], P[2], P[3], P[4], P[5]);
		and #(1)(W5[4], G[0], P[1], P[2], P[3], P[4], P[5]);
		and #(1)(W5[5], C[0], P[0], P[1], P[2], P[3], P[4], P[5]);
		or	#(1)(C[6], W5[0], W5[1], W5[2], W5[3], W5[4], W5[5], G[5]);
		
		and #(1)(W6[0], G[5], P[6]);
		and	#(1)(W6[1], G[4], P[5], P[6]);
		and #(1)(W6[2], G[3], P[4], P[5], P[6]);
		and	#(1)(W6[3], G[2], P[3], P[4], P[5], P[6]);
		and #(1)(W6[4], G[1], P[2], P[3], P[4], P[5], P[6]);
		and #(1)(W6[5], G[0], P[1], P[2], P[3], P[4], P[5], P[6]);
		and	#(1)(W6[6], C[0], P[0], P[1], P[2], P[3], P[4], P[5], P[6]);
		or	#(1)(C[7], W6[0], W6[1], W6[2], W6[3], W6[4], W6[5], W6[6], G[6]);
		
		and #(1)(W7[0], G[6], P[7]);
		and	#(1)(W7[1], G[5], P[6], P[7]);
		and #(1)(W7[2], G[4], P[5], P[6], P[7]);
		and	#(1)(W7[3], G[3], P[4], P[5], P[6], P[7]);
		and #(1)(W7[4], G[2], P[3], P[4], P[5], P[6], P[7]);
		and #(1)(W7[5], G[1], P[2], P[3], P[4], P[5], P[6], P[7]);
		and	#(1)(W7[6], G[0], P[1], P[2], P[3], P[4], P[5], P[6], P[7]);
		and	#(1)(W7[7], C[0], P[0], P[1], P[2], P[3], P[4], P[5], P[6], P[7]);
		or	#(1)(C[8], W7[0], W7[1], W7[2], W7[3], W7[4], W7[5], W7[6], W7[7], G[7]);
		
		
		xor	#(1)(sum[0], C[0], P[0]);
		xor	#(1)(sum[1], C[1], P[1]);
		xor	#(1)(sum[2], C[2], P[2]);
		xor	#(1)(sum[3], C[3], P[3]);
		xor	#(1)(sum[4], C[4], P[4]);
		xor	#(1)(sum[5], C[5], P[5]);
		xor	#(1)(sum[6], C[6], P[6]);
		xor	#(1)(sum[7], C[7], P[7]);
		
		buf #(1)(c_out, C[8]);
	
endmodule


module pg_generator ( x, y, p, g );

	input 			x, y;
	output 			p, g;
	xor 	#(1)	( p, x, y );
	and 	#(1)	( g, x, y );
	
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