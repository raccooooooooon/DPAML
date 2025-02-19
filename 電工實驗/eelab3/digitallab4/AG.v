module AG(reset, clk, addr_out);

input reset, clk;//input declaration
output reg [3:0] addr_out;//4-bit output address

reg [3:0] count;
wire [3:0] _addr_out;

always@(posedge clk or posedge reset)//when clk or reset is in posedge
begin
	if(reset)
		count<=7'b0;//when reset goes to 1, assign 7 bits of 0 into count, that is, reset its value
	else
		count<=(count>=7'd15)?7'd0:count+1;/*if count reaches to 7'd15, restart its value, 
														otherwise, keep counting*/
end

always@(negedge clk)//clk is negedge triggered
	addr_out<=count;//assign count value to the output
endmodule
