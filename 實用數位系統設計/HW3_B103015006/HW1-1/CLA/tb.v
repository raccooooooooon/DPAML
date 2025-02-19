`timescale 1ns/10ps

`include "./adder_syn.v"
`include "./tsmc13.v"

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

initial begin
$sdf_annotate("adder_syn.sdf", u_adder);
end

//nwave
initial begin
	$fsdbDumpfile ("adder_syn.fsdb");
	$fsdbDumpvars;
	$fsdbDumpMDA;
end

endmodule