module ad_dff8(data, clk, en, Q);
	input [7:0] data;
	input clk, en;
	output reg [7:0] Q;
	
	always@(posedge clk)
	begin
		if(en)
			Q <= data;//when clk is in posedge, the value of data will be assigned to Q
		else
			Q <= Q;//else, the value of Q will not change
	end
			
endmodule