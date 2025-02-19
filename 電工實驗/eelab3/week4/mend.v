module mend(s, ed);
//input
input [7:0]s;
//output
output wire ed;

// and all the component bits inside s
assign ed = &s;

endmodule
