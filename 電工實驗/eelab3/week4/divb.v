module divb(clkin, clkout); //beat frequency divider
//input
input clkin;
//output
output reg clkout;
//reg&wire
reg [31:0]count;
wire [31:0]divn, divnh;

assign divn = 32'd3750000;	//frequency division ratio
assign divnh = divn>>1;		//half of divn

//when clkin is posedge, if count >= frequency division ratio, it will loop back to 1, else count+1
always@(posedge clkin)
begin
	if(count>=divn)
		count<=1;
	else
		count<=count+1;
end

// when clkin is negedge, if count<= half of the frequency division ratio, clkout = 1, else = 0.
always@(negedge clkin)
clkout = (count<=divnh)?1:0;

endmodule