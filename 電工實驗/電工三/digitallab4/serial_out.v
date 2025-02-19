module serial_out(clk,Din,start,D);
input clk,start;
input [15:0] Din;
output D;
reg [15:0] Buf;
wire [15:0] nBuf;

assign nBuf= {Buf[14:0],Buf[15]};//rotate left
assign D=Buf[15];

always @(posedge clk)
	if(start)
		Buf <= Din;
	else
		Buf <= nBuf;
		
endmodule 