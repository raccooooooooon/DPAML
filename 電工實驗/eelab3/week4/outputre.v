module outputre (rst, s, change, _end, out_reset);
//input
input rst,change,_end;
input [4:0] s;
//output
output out_reset;
//wire&reg
wire out_reset;

//combination of a not gate, or gate, and a nor gate
assign out_reset = (((~rst)|_end|change)|(~|s));
endmodule