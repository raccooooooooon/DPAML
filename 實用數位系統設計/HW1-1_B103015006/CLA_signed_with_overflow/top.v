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
/*
module adder (A, B, mode, sum, c_out, overflow);

input	[7:0]	A, B;
input			mode;

output	[7:0]	sum;
output			c_out;
output			overflow;

endmodule*/