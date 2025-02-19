module RXshift(rst,rxd,clk,en,rdc,Dout);

input rst,rxd,en,clk,rdc;
output [7:0] Dout;
reg [7:0] Data;
wire [7:0] nData;

//triggered at every posedge clk,
//if the input rst=1, then Data will be reset to 8'd0
//otherwise, nData will be assign to Data
always @(posedge clk)
	if(rst)
		Data <= 8'd0;
	else
		Data <= nData;
		
// if en=1, nData=rxd plus [7:1] bit of Data, otherwise nData = Data
assign nData = (en)? {rxd,Data[7:1]} :Data;

assign Dout=(rdc)? Data: Dout; //Latch Received Data

endmodule