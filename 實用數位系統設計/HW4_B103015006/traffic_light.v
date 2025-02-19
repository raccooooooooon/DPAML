
module traffic_light (HG, HY, HR, FG, FY, FR, ST, enable, clk, reset);

	output HG, HY, HR, FG, FY, FR;
	input enable, clk, reset;
	output  [2:0] ST;
	reg [0:2] state;

	parameter ST0=3'b000, ST1=3'b001, ST2=3'b010, ST3=3'b011, ST4=3'b100, ST5=3'b101, ST6=3'b110, ST7=3'b111;
	parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100, S5=3'b101;

	counter count(reset, enable, clk, ST);
	
	always @(ST)
		case(ST)
		
		ST0: state=S0;
		ST1: state=S1;
		ST2: state=S2;
		ST3: state=S3;
		ST4: state=S4;
		ST5: state=S3;
		ST6: state=S2;
		ST7: state=S5;
		default: state=S0;
		endcase
		
	assign HG=(state==S0 || state==S1 ||state==S5);
	assign HY=(state==S2);
	assign HR=(state==S3 ||state==S4);
	assign FG=(state==S4);
	assign FY=(state==S3);
	assign FR=(state==S0 || state==S1 || state==S2 || state==S5);

endmodule


module counter(reset, enable, clk, ST);

	input reset, enable, clk;
	output reg [2:0] ST;
	reg [4:0] count;
	
	parameter ST0=3'b000, ST1=3'b001, ST2=3'b010, ST3=3'b011, ST4=3'b100, ST5=3'b101, ST6=3'b110, ST7=3'b111;
		
	always @(posedge clk)
		if (enable==1) 
		begin
			if (reset) begin
				count<=4'b0;
				//ST_ <= ST0;
				end
			else count<=count+4'b0001;
		end
		else
			count<=4'b0;
			//ST_ <= ST0;
			
	always @(count)
		case (count)
		4'b0000: ST <= ST0;
		4'b0001: ST <= ST1;
		4'b0010: ST <= ST2;
		4'b0011: ST <= ST3;
		//wait for 5 clk
		4'b0100: ST <= ST4;
		4'b0101: ST <= ST4;
		4'b0110: ST <= ST4;
		4'b0111: ST <= ST4;
		4'b1000: ST <= ST4;
		4'b1001: ST <= ST5;
		4'b1010: ST <= ST6;
		//wait for 5 clk
		4'b1011: ST <= ST7;
		4'b1100: ST <= ST7;
		4'b1101: ST <= ST7;
		4'b1110: ST <= ST7;
		4'b1111: ST <= ST7;
		default: ST <= ST0;
		endcase

	
endmodule



//====================================================================


