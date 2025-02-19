`timescale 1ns/10ps
`include "./top.v"

module tb;
reg [7:0] A, B;
reg mode;
wire [7:0] sum;
wire c_out;

adder u_adder (.sum(sum), .A(A), .B(B), .c_out(c_out), .mode(mode) );

initial begin
A=0; B=0	; mode=0;
#20 A=10 	; B=2  	;mode=0;
#20 A=9		; B=118	;mode=0;
#20 A=110	; B=12	;mode=0;
#20 $finish;
end

initial $monitor ($time," mode=%d A=%d B=%d sum=%d, c_out=%d" ,mode, A, B, sum, c_out);

//nwave
initial begin
	$fsdbDumpfile ("top.fsdb");
	$fsdbDumpvars;
	$fsdbDumpMDA;
end

endmodule