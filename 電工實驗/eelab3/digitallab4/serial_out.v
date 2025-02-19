module serial_out(clk,Din,start,D);
input clk,start;
input [15:0] Din;
output D;
reg [15:0] Buf;
wire [15:0] nBuf;

assign nBuf= {Buf[14:0],Buf[15]};//rotate left, the 16th bit will be the 1st bit
assign D=Buf[15]; //the output D is the last bit of Buf

always @(posedge clk)
	if(start)
		Buf <= Din; //if start=1, the value of Buf will be the input Din
	else
		Buf <= nBuf; // else it will rotate left
		
endmodule
