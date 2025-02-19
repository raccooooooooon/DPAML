module counter(clk,rst,end_single);
input 	 clk,rst;
output 	 end_single;

reg [2:0] count;

always@(negedge clk or posedge rst)begin
	count  <= (rst) ? 3'b0:count+3'd1;
end

assign end_single = &count;	//output end single

endmodule
