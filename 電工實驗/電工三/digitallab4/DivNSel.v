module DivNSel(sel, DivN);
input [1:0] sel;//define a 2-bit input sel
output reg[31:0] DivN;//define a 32-bit output DivN

always@(sel)
	case(sel)
		2'b00: DivN <= 32'd25000000;//when sel=00 in binary, DivN=256000
		2'b01: DivN <= 32'd12500000;//when sel=01 in binary, DivN=512000
		2'b10: DivN <= 32'd83333333;//when sel=10 in binary, DivN=1024000
		default: DivN <= 32'd6250000;//when sel is other value, DivN=2048000
	endcase
endmodule
