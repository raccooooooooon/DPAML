`timescale 1ns/10ps

`include "./median_syn.v"
`include "./tsmc13.v"

module tb;

reg    	[7:0] 	a0, a1, a2;
wire   	[7:0]	out;

wire  			_a1, _a2, w0, w1, w2, w3, A, B, C, _A, _B, _C;
wire	[7:0]	SUM0, SUM1, SUM2;

median median(.a0(a0), .a1(a1), .a2(a2), .out(out));

initial begin
	a0=8'b00000100;	a1=8'b01000000;	a2=8'b00001000; //00001000
#30 a0=8'b10000000;	a1=8'b00100000;	a2=8'b00010000; //00100000
#30 a0=8'b00000010;	a1=8'b00010000;	a2=8'b00000100; //00000100
#30 a0=8'b00000010;	a1=8'b00100000;	a2=8'b01000000; //00100000
#30 $finish;
end

initial begin
$sdf_annotate("median_syn.sdf", median);
end

//nwave
initial begin
	$fsdbDumpfile ("median_syn.fsdb");
	$fsdbDumpvars;
	$fsdbDumpMDA;
end

endmodule


