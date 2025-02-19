module RxUnit(reset,clk,rx,RData, ready);

input reset,clk,rx;
output [7:0] RData;
output reg ready;

reg [2:0] cs,ns;
wire rdc;
reg rst,shift_en;

//Rx Control Circuit
//assign ns to cs at every posedge clk
always @(posedge clk)
	cs<=ns;
	
//state 
//trigger at every cs or reset or rx
always @(reset or rx or rdc or cs)
	if(reset==1'b0)
		ns <= 3'd0;
	else
		case(cs)
		3'd0: ns <= 3'd1; //reset stage:	   when cs=3'd0, ns=3'd1
		3'd1: ns <= (rx)?3'd1:3'd2;//detect start bit:	   when cs=3'd1, ns=3'd1 if rx=1, else ns=3'd2
		3'd2: ns <= (rdc)?3'd3:3'd2;//receive 8 bit data:	when cs=3'd2, ns=3'd3 if rdc=1, else ns=3'd2
		3'd3: ns <= (rx)?3'd4:3'd1;//detect stop bit:	   when cs=3'd4, ns=3'd1 if rx=1, else ns=3'd2
		3'd4: ns <= (rx)?3'd1:3'd2;//display the receive data and detect start bit:	   
											//when cs=3'd4, ns=3'd1 if rx=1, else ns=3'd2
		default: ns <= 3'd0;//						else, ns=3'd0
	endcase
	
//output control signal decoder
//trigger when cs changes
always @(cs)
	case(cs)
		3'd0:begin
		//when cs=3'd0, rst=1'b1, ready=1'b0, shift_en=1'b0;
		rst <= 1'b1;
		shift_en <= 1'b0;
		ready <= 1'b0;
		end
		3'd1:begin
		//when cs=3'd1, rst=1'b1, ready=1'b0, shift_en=1'b0;
		rst <= 1'b1;
		shift_en <= 1'b0;
		ready <= 1'b0;
		end
		3'd2:begin
		//when cs=3'd2, rst=1'b0, ready=1'b0, shift_en=1'b1;
		rst <= 1'b0;
		shift_en <= 1'b1;
		ready <= 1'b0;
		end
		3'd3:begin
		//when cs=3'd3, rst=1'b1, ready=1'b0, shift_en=1'b0;
		rst <= 1'b1;
		shift_en <= 1'b0;
		ready <= 1'b0;
		end
		3'd4:begin
		//when cs=3'd4, rst=1'b1, ready=1'b1, shift_en=1'b0;
		rst <= 1'b1;
		shift_en <= 1'b0;
		ready <= 1'b1;//data received complete
		end
		default:begin
		//else, rst=1'b1, ready=1'b0, shift_en=1'b0;
		rst <= 1'b1;
		shift_en <= 1'b0;
		ready <= 1'b0;
		end
		endcase
		
//import other modules
count8 U0(.rst(rst), .clk(clk), .tdc(rdc));
RXshift U1(.rst(rst),.rxd(rx),.clk(clk),
		     .en(shift_en),.rdc(rdc),.Dout(RData));

endmodule
