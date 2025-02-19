//===============================================================================//
//            PLEASE DO NOT modify basic I/O name or top module name!            // 
//===============================================================================//

module voting (a0, a1, a2, a3, a4, out);

input    [2:0]   a0, a1, a2, a3, a4;

output   [2:0]   out;

//====================================================================
//======================= enter your code here =======================
wire	[2:0] X, Y, Z;
wire		  w0, w1, w2, w3, w4, w5;

	three_bits_RCA	RCA0( a0[0], a1[0], a2[0], a3[0], a4[0], X);
	three_bits_RCA	RCA1( a0[1], a1[1], a2[1], a3[1], a4[1], Y);
	three_bits_RCA	RCA2( a0[2], a1[2], a2[2], a3[2], a4[2], Z);
	
	and #(1) (w0, X[0], X[1]);
	or  #(1) (out[0], w0, X[2]);
	
	not #(1) (w1, w0);
	and #(1) (w2, Y[0], Y[1]);
	not #(1) (w3, w2);
	and #(1) (w4, w1, w3, Z[1]);
	or  #(1) (out[2], w4, Z[2]);
	
	or  #(1) (w5, out[0], out[2]);
	not #(1) (out[1], w5);
	
	//assign	#1	out[0] = ( (X[0]&X[1]) | X[2] );
	//assign	#1	out[2] = ( ( ~(X[0]&X[1]) & ~(Y[0]&Y[1]) & Z[1] ) | Z[2] );
	//assign	#1	out[1] = ~(out[0]|out[2]);

endmodule

module three_bits_RCA	( a0, a1, a2, a3, a4, cout );

	input 			a0, a1, a2, a3, a4;
	wire	[8:0]	C, S;
	output	[2:0]	cout;
	
		full_adder	adder0( a0, 	 a1,    1'b0,   S[0],    C[0] );
		full_adder	adder1( a2,	   S[0],	1'b0,   S[1], 	 C[1] );
		full_adder	adder2( a3,	   S[1],	1'b0,	S[2], 	 C[2] );
		full_adder	adder3( a4,    S[2], 	1'b0, 	S[3], 	 C[3] );
		
		full_adder	adder4( C[0], 	 C[1],    1'b0,   S[4],    C[4] );
		full_adder	adder5( C[2], 	 S[4],    1'b0,   S[5],    C[5] );
		full_adder	adder6( C[3], 	 S[5],    1'b0,   S[6],    C[6] );
		
		full_adder	adder7( C[4], 	 C[5],    1'b0,   S[7],    C[7] );
		full_adder	adder8( C[6], 	 S[7],    1'b0,   S[8],    C[8] );
		
		buf #(1) (cout[0], S[3]);
		buf #(1) (cout[1], S[6]);
		buf #(1) (cout[2], S[8]);
	
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


