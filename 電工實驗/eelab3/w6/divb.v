module divb(clkin, clkout);

input clkin;	
output reg clkout;
reg [31:0] count;
wire [31:0] divn, divnh;

assign divn= 32'd434;//50MHz/434=115200Hz
assign divnh= divn>>1;//define divnh to be half of divn

always@(posedge clkin) //while clkin is in posedge
begin
	if((count>=divn)) //if counter is larger than the specified period of time
		count<=1; //restart the counter
	else
		count<=count+1; //otherwise keep counting
end

always@(negedge clkin) //wile clkin is in negedge
clkout= (count<= divnh)?1:0; 
//output of the frequncy diveder is 1 while counting from 1 to the half period, otherwise is 0

endmodule