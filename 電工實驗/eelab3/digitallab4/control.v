module control (rst, clk_25k, start, str);
input rst, clk_25k;
output reg start, str;
reg [3:0] count;
wire _start, _str;

assign _start= ~(|count); //if count is 4'b0000, _start = 1, else _start=0
assign _str= &count; //if count is 4'b1111, _str=1, else _str=0

always@ (posedge clk_25k) //triggered when clk_25k is posedge
	begin 
		count <= (rst==1'b1)?4'd1:count+1; //if rst i 1'b1, assign 4'd1 to count, else count+1
		str <= _str; //assign _str to output str
		start <= _start; //assign _start to output start
	end 
endmodule 