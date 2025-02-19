`timescale 1ns/10ps
`include "./voting.v"

module tb;

reg    [2:0] a0, a1, a2, a3, a4;
wire   [2:0] out;
wire		  w0, w1, w2, w3, w4, w5;
wire   [2:0] X, Y, Z;

voting voting_ (.a0(a0), .a1(a1), .a2(a2), .a3(a3), .a4(a4), .out(out));

initial begin
	a0=100;	a1=100; a2=010; a3=010; a4=001; //100
#50 a0=100;	a1=100; a2=010; a3=001; a4=001; //100
#50 a0=010;	a1=100; a2=010; a3=001; a4=001; //010
#50 $finish;
end

initial $monitor ($time," a0=%b a1=%b a2=%b a3=%b, a4=%b, out=%b" ,a0, a1, a2, a3, a4, out);

//nwave
initial begin
	$fsdbDumpfile ("voting.fsdb");
	$fsdbDumpvars;
	$fsdbDumpMDA;
end

endmodule