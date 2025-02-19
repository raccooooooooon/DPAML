module SMCtrl (clk, reset, dir, SMC);	//state control machine

input clk, reset, dir;	//three input variables. while input clk is the output of fDiv(speed control clock)
output reg[3:0] SMC;	//4 bits output of registor SMC
reg[2:0] ns, cs;	//3 bits output of ns and cs

//latch: when clk is posege, always assign ns to cs
always@(posedge clk)
	cs <= ns;

//next stage generator: when the value of reset, dir, or cs changes:
//if reset=1, assign ns into 0 of 3bits in decimo number
//else if cs=0: ns assign to 1;
//		 if cs=1: if dir=1, assign ns to 2; if dir=0, assign ns to 4
//		 if cs=2: if dir=1, assign ns to 3; if dir=0, assign ns to 1
//		 if cs=3: if dir=1, assign ns to 4; if dir=0, assign ns to 2
//		 if cs=4: if dir=1, assign ns to 1; if dir=0, assign ns to 3
//		 otherwise, assign ns to 0
always@(reset or dir or cs)
	if(reset) ns <= 3'd0;
	else
		case(cs)
		3'd0: ns <= 3'd1;
		3'd1: ns <= (dir)?3'd2:3'd4;
		3'd2: ns <= (dir)?3'd3:3'd1;
		3'd3: ns <= (dir)?3'd4:3'd2;
		3'd4: ns <= (dir)?3'd1:3'd3;
		default: ns <= 3'd0;
		endcase
		
//output decoder: when the value of cs changes:
//if cs=0: assign the output SMC into 4 bits of binary number 0000
//if cs=1: assign the output SMC into 4 bits of binary number 1001
//if cs=2: assign the output SMC into 4 bits of binary number 0011
//if cs=3: assign the output SMC into 4 bits of binary number 0110
//if cs=4: assign the output SMC into 4 bits of binary number 1100
//otherwise, assign the output SMC into 4 bits of binary number 0000
always@(cs)
	case(cs)
	3'd0: SMC <= 4'b0000;
	3'd1: SMC <= 4'b1001;
	3'd2: SMC <= 4'b0011;
	3'd3: SMC <= 4'b0110;
	3'd4: SMC <= 4'b1100;
	default: SMC <= 4'b0000;
	endcase
	
endmodule
