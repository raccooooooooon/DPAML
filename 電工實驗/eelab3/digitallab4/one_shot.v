module one_shot(clk,clk_i,s);
input clk,clk_i;
output reg s;
reg [1:0] cs,ns;
wire _s;

always @(posedge clk)	//triggered when clk is in posedge
	cs<=ns;	//assign ns to cs
	
always @(cs) //when the value of cs differs, followed by the value of cs, we have following conditions
	case(cs)
	2'b00: ns <= (clk_i)?2'b01:2'b00; //if clk_i=1, assign 2'b01 to ns, else assign 2'b00 to ns
	2'b01: ns <= 2'b10; //assign 2'b10 to ns
	2'b10: ns <= (clk_i)?2'b10:2'b00; //if clk_i=1, assign 2'b10 to ns, else assign 2'b00 to ns 
	default: ns <=2'b00; //otherwise, assign 2'b00 to ns
	endcase
	
always @(posedge clk)
	s <= _s;
assign _s = (cs==2'b01)?1'b1:1'b0; //if cs equals to 2'b01, s will be 1'b1, else it will be 1'b0

endmodule 