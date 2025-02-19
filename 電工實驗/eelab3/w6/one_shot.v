module one_shot(clk, clk_i, s);
input clk, clk_i;
output reg s;

reg [1:0] cs, ns;
wire _s;

//assign ns to cs at every posedge clk
always @(posedge clk)
	cs <= ns;

always @(cs)
	case(cs)
	//when cs=2'b00, ns=2'b01 when clk_i=1, else ns=2'b00
	2'b00: ns <= (clk_i)?2'b01:2'b00;
	//when cs=2'b01, ns=2'b10
	2'b01: ns <= 2'b10;
	//when cs=2'b10, ns=2'b10 when clk_i=1, else ns=2'b00
	2'b10: ns <= (clk_i)?2'b10:2'b00;
	//else, ns=2'b00
	default: ns <= 2'b00;
	endcase
	
//assign _s to s at every posedge clk	
always @(posedge clk)
	s <= _s;
//assign _s to 1'b1 when cs==2'b01, else _s=1'b0	
assign _s = (cs==2'b01)?1'b1:1'b0;

endmodule