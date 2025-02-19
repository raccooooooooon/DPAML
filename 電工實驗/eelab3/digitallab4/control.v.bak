module control (rst, clk_25k, start, str);
input rst, clk_25k;
output reg start, str;
reg [3:0] count;
wire _start, _str;

assign _start= ~(|count);
assign _str= &count;

always@ (posedge clk_25k)
	begin 
		count <= (rst==1'b1)?4'd1:count+1;
		str <= _str;
		start <= _start;
	end 
endmodule 