module one_shot(clk,clk_i,s);
input clk,clk_i;
output reg s;
reg [1:0] cs,ns;
wire _s;

always @(posedge clk)
	cs<=ns;
	
always @(cs)
	case(cs)
	2'b00: ns <= (clk_i)?2'b01:2'b00;
	2'b01: ns <= 2'b10;
	2'b10: ns <= (clk_i)?2'b10:2'b00;
	default: ns <=2'b00;
	endcase
	
endmodule 