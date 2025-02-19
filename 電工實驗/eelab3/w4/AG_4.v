module AG_4 (reset, clk, Addr) ; //Address Generator: generate address automaticly

input clk, reset ; //input value clk is connected to the output of frequency divider(1 Hz)
output [3:0] Addr ; //output is 5 bits in Binary
reg [3:0] Addr ; //registor is 5 bits in Binary

always@(posedge clk or negedge reset) //trigger at clk is posedge
begin
	if(reset == 0)		// reset control
		Addr <= 4'b0; // set count to 0000000
	else	
		Addr <= Addr +1 ; //Addr +1
end	


endmodule

