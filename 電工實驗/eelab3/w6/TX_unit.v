module TX_unit(clk,start,reset,TData,tx);
input 		 clk,reset,start;
input  [7:0] TData;
output reg	 tx;

parameter WAITING_BIT = 1'b1;
parameter START_BIT = 1'b0;
parameter STOP_BIT = 1'b1;

reg 	 [2:0] cs,ns;
wire	 		 tdc, txd, _tx;
reg	 [1:0] OS;
reg			 count_rst, shift_en;

//Tx control circuit
//assign ns to cs at every posedge clk
always @(posedge clk)
	cs<=ns;

//state
//trigger at every cs or reset or tdc or start
always@(cs or reset or tdc or start) 
if(reset==1'b0) //ns reset to 3'd0 when reset==1'b0
	ns <= 3'd0;
else
	case(cs)
		3'd0:   ns <= 3'd1;						//reset stage:	   when cs=3'd0, ns=3'd1
		3'd1:   ns <= (start)?3'd2:3'd1;	//wait push button: when cs=3'd1, ns=3'd2 if start=1, else ns=3'd1
		3'd2:   ns <= 3'd3;						//tran start bit: when cs=3'd2, ns=3'd3
		3'd3:   ns <= (tdc)   ?3'd4:3'd3;	//shift stage:		when cs=3'd3, ns=3'd4 if tdc=1, else ns=3'd3
		3'd4:   ns <= 3'd1;						//stop bit:			when cs=3'd4, ns=3'd1
		default:ns <= 3'd0;						//						else, ns=3'd0
	endcase


//output control signal decoder
//trigger when cs changes
always@(cs)
	case(cs)
	3'd0:begin
		//when cs=3'd0, OS=2'b00, count_rst=1'b1, shift_en=1'b0;
		OS <= 2'b00;
		count_rst <= 1'b1;
		shift_en <= 1'b0;
		end
	3'd1:begin
		//when cs=3'd1, OS=2'b00, count_rst=1'b1, shift_en=1'b0;
		OS <= 2'b00;
		count_rst <= 1'b1;
		shift_en <= 1'b0;
		end
	3'd2:begin
		//when cs=3'd2, OS=2'b01, count_rst=1'b1, shift_en=1'b0;
		OS <= 2'b01;
		count_rst <= 1'b1;
		shift_en <= 1'b0;
		end
	3'd3:begin
		//when cs=3'd3, OS=2'b10, count_rst=1'b0, shift_en=1'b1;
		OS <= 2'b10;
		count_rst <= 1'b0;
		shift_en <= 1'b1;
		end
	3'd4:begin
		//when cs=3'd4, OS=2'b11, count_rst=1'b1, shift_en=1'b0;
		OS <= 2'b11;
		count_rst <= 1'b1;
		shift_en <= 1'b0;
		end
	default:begin
		//else, OS=2'b00, count_rst=1'b1, shift_en=1'b0;
		OS <= 2'b00;
		count_rst <= 1'b1;
		shift_en <= 1'b0;
		end
	endcase
	
	
//send value to other modules
count8 U0(.rst(count_rst), .clk(clk), .tdc(tdc));

TXshift U1(.load(start), .clk(clk), .Din(TData), .en(shift_en), .txd(txd));

// mux circuit
//when OS[0]=1, _tx = (OS[1])?(STOP_BIT:START_BIT)
//when OS[0]=0, _tx = (OS[1])?(txd:WAITING_BIT)
assign _tx = (OS[1])?(OS[0]?STOP_BIT:txd):
				 ((OS[0])?START_BIT:WAITING_BIT);
				

always @(posedge clk) //latched tx signal at every posedge clk
	tx <= _tx;
	
endmodule