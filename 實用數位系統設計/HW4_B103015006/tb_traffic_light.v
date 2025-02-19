`timescale 1ns/10ps

`include "./traffic_light_syn.v"
`include "./tsmc13.v"

module tb_traffic_light;

	wire HG, HY, HR, FG, FY, FR;
	wire [2:0] ST;
	reg enable, clk, reset;
	//reg [0:2] state;

traffic_light TL( .HG(HG), .HY(HY), .HR(HR), .FG(FG), .FY(FY), .FR(FR), .ST(ST), .enable(enable), .clk(clk), .reset(reset));

initial begin
$sdf_annotate("traffic_light.sdf", TL);
end

initial begin
	clk=1'b0;
	reset=1'b0;
	enable=1'b0;
end

always begin
	#10 clk=~clk;
end
initial begin
	#10 enable=1'b1;
	#400 $finish;
end

initial $monitor ($time," HG=%b HY=%b HR=%b FG=%b FY=%b FR=%b clk=%b reset=%b enable=%b" ,HG , HY, HR, FG, FY, FR, clk, reset, enable);

//nwave
initial begin
	$fsdbDumpfile ("traffic_light.fsdb");
	$fsdbDumpvars;
	$fsdbDumpMDA;
end

endmodule


