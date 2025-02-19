module TXshift(load, clk, Din, en, txd);
input load, en, clk;
input [7:0] Din;
output txd;

reg [7:0] Data;
wire [7:0] nData;

//triggered at every posedge clk,
//if the input load=1, then the input DIN will be assign to Data
//otherwise, nData will be assign to Data
always @(posedge clk)
if(load)
	Data <= Din;
else
	Data <= nData;

// if en=1, nData=1'b0 plus [7:1] bit of Data, otherwise nData = Data
assign nData = (en)?{1'b0, Data[7:1]} :Data;

assign txd = Data[0]; //the output value would be the [0] bit of Data

endmodule