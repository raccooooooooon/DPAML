`timescale 1ns/10ps
module IOTDF( clk, rst, in_en, iot_in, fn_sel, busy, valid, iot_out);
input          clk;
input          rst;
input          in_en;
input  [7:0]   iot_in;
input  [2:0]   fn_sel;
output         busy;
output         valid;
output [127:0] iot_out;

reg	[3:0]	cnt_in_byte;		// input byte count
reg	[2:0]	cnt_in_128b_data;	// data count by 128 bits


always@ (posedge clk)
begin
	if (rst)
		cnt_in_byte[3:0] <= 4'h0;
	else
		if (in_en)
			cnt_in_byte[3:0] <= cnt_in_byte[3:0] + 4'h1;
end

always@ (posedge clk)
begin
	if (rst)
		cnt_in_128b_data[2:0] <= 3'h0;
	else
		if (in_en & (cnt_in_byte[3:0]==4'hf))
			cnt_in_128b_data[2:0] <= cnt_in_128b_data[2:0] + 3'h1;
end


endmodule