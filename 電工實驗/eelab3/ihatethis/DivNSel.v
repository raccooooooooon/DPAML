module DivNSel(sel, DivN);	//Divisor selector
input [1:0] sel;	//2bits of input sel
output [31:0] DivN;	//32bits of output DivN, it will be sent to frequency divider
reg [31:0] DivN;	//32bits of registor

//when the value of sel changes:
//		if sel=00: assign DivN into 64000 in 32bits decimal number
//		if sel=01: assign DivN into 128000 in 32bits decimal number
//		if sel=10: assign DivN into 256000 in 32bits decimal number
//		else: assign DivN into 512000 in 32bits decimal number
always @(sel)	
	case(sel)
		2'b00: DivN <= 32'd512000;
		2'b01: DivN <= 32'd1024000;
		2'b10: DivN <= 32'd2048000;
		default: DivN <= 32'd4096000;
	endcase
endmodule
