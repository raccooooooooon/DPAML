module A2D_Controller(clk, eoc, Cout);
input clk, eoc;
output reg [2:0] Cout; //ALE, start, g_d;

reg [2:0] cs, ns;

always @(posedge clk)//every posedge of clk, ns will be assigned to cs
	cs<=ns;
	
//triggered when the value of cs or eoc differs
//the value of ns will be assigned according to the states of cs	
always @(cs or eoc)
	case(cs)
	3'd0: ns <= 3'd1;
	3'd1: ns <= 3'd2;
	3'd2: ns <= 3'd3;
	3'd3: ns <= (eoc)?3'd3:3'd4;//ns will be assigned to 3'd3 if eoc=1, else it will be assigned to 3'd4
	3'd4: ns <= (eoc)?3'd5:3'd4;//ns will be assigned to 3'd5 if eoc=1, else it will be assigned to 3'd4
	3'd5: ns <= 3'd0;
	default: ns <= 3'd0;//otherwise, ns will be 3'd0
	endcase
	
//triggered when the value of cs differs
//the value of Cout will be assigned according to the states of cs	
always @(cs)
	case(cs)
	3'd0: Cout <= 3'b000;//S0
	3'd1: Cout <= 3'b100;//S1
	3'd2: Cout <= 3'b010;//S2
	3'd3: Cout <= 3'b000;//S3
	3'd4: Cout <= 3'b000;//S4
	3'd5: Cout <= 3'b001;//S5
	default: Cout <= 3'b000;//otherwise, Cout will be 3'b000
	endcase
	
endmodule