module AG(reset, m_clk, sel, addr_out); //address generator
//input
input reset, m_clk, sel;
//output
output reg [7:0] addr_out;
//reg&wire
reg [6:0]count;
wire [7:0]_addr_out;

always@(posedge m_clk or negedge reset) //trigger when m_clk is posedge or reset is negedge
begin
	if(reset == 0)		// reset control
		count <= 7'b0; // set count to 0000000
	else					//up counter
		count <= (count>= 7'd127)?7'd0:count+1; //if  count>= 7'd127, set count to 7'd0, else count +1
end

always@(negedge m_clk) //adding sel pin
	addr_out <= {sel, count[6:0]}; //the address is 1 bit of sel add 7 bits of count

endmodule