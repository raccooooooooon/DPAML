module AG_5 (clk, Addr) ; //Address Generator: generate address automaticly

input clk ; //input value clk is connected to the output of frequency divider(1 Hz)
output [4:0] Addr ; //output is 5 bits in Binary
reg [4:0] Addr ; //registor is 5 bits in Binary

always@(posedge clk) begin //trigger at clk is posedge
	Addr <= Addr +1 ; //Addr +1
end	


endmodule