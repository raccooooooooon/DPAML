module count8(clk,rst,tdc);
input 	 clk,rst;
output 	 tdc;

reg [2:0] count;

//triggered at every posedge clk, if rst=1, count =3'd0, else itself+1
always@( posedge clk)
	if(rst)
	count  <=  3'd0;
	else
	count <= count +3'd1;

assign tdc = &count;	//output and single

endmodule