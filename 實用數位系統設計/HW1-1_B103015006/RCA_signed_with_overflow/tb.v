`timescale 1ns/10ps
`include "./top.v"

module tb;
reg [7:0] A, B;
reg mode;
wire [7:0] sum_difference;
wire overflow;
wire c_out;

adder u_adder (.sum_difference(sum_difference), .A(A), .B(B), .mode(mode), .overflow(overflow), .c_out(c_out) );

initial begin
A=0; B=0; mode=0;
#10 A=-10  ; B=11 ;
#10 A=11111111  ; B=00000001  ;
#10 A=01111111  ; B=00000001;
#10 A=00000110  ; B=11111110 ;
#10 A=00000001  ; B=00000010 ;
#10 $finish;
end

initial $monitor ($time," mode=%d A=%d B=%d sum_difference=%d overflow=%d" ,mode, A, B, sum_difference, overflow );

//nwave
initial begin
	$fsdbDumpfile ("top.fsdb");
	$fsdbDumpvars;
	$fsdbDumpMDA;
end

endmodule
