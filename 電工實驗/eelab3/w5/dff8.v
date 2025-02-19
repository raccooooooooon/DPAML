module dff8(data, clk, Q);
	input [7:0] data;
	input clk;
	output reg [7:0] Q;
	
	always@(posedge clk) //when clk is in posedge, the value of data will be assigned to Q
	begin
		Q <= data;
	end
			
endmodule