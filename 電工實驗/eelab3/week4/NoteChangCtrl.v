module NoteChangCtrl (reset, bclk, clk, cp, BDN);
input		reset, bclk, clk; //bclk is the output of beat frequency divider
output	reg cp;
input 	[5:0] BDN; //the output of the decoder

reg		[5:0] count;
wire		_cp;

//trigger when either bclk, cp, or reset is posedge
//if reset or cp is 1, count=0, else count+1
always @(posedge bclk or posedge cp or posedge reset)begin
	if (reset|cp) 
		count <= 0;
	else begin
		count <= count +1;
	end
end

//when count=the output value of decoder, _cp=1, else _cp=0
assign _cp = (count == BDN)?1'b1:1'b0;

//clk posedge triggered, assign _cp to cp
always @(posedge clk)begin
	cp <= _cp;
end

endmodule
