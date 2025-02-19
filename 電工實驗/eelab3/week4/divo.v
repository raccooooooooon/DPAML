module divo(fin, tone, reset, fout); //audio frequency divider
//input
input fin, reset;
input [31:0]tone;
//output
output reg fout;
//reg&wire
reg [31:0]count;
wire [31:0]divnh;

assign divnh = tone>>1; //The input tone is the division ratio retrieved from memory.

//if reset=1 or count>=1, count=1, else count+=1
always@(posedge fin or posedge reset)
begin
	if (reset == 1)
		count<=1;
	else if (count>=tone)
		count<=1;
	else
		count<=count+1;
end

//fin negedge triggered, if count<=divnh, it will be assigned to 1
always@(negedge fin)
fout = (count<=divnh)?1:0;

endmodule