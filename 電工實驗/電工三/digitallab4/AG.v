module AG(reset, clk, addr_out);

input reset, clk;//1-bit input declaration
output reg [3:0] addr_out;//8-bit output 

reg [3:0] count;
wire [3:0] _addr_out;

always@(posedge clk or posedge reset)
begin
	if(reset)
		count<=7'b0;//when reset goes to 0, which is at the moment of the music start, clear the counting
	else
		count<=(count>=7'd15)?7'd0:count+1;//if counting to 127, which is the end of the given songs, restart the song, otherwise, keep counting
end

always@(negedge clk)
	addr_out<=count;/*when m_clk signal is triggered, 
	output the a 7-bit number with song selction as the first bit and the counting as the 0-6 bits*/

endmodule
