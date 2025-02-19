module fDiv (reset, fin, DIVN, fout);	//changeable frequency devidor

input reset, fin;	//1 bit input
output fout;	//1 bit output
input [31:0] DIVN;	//32bits of input DIVN
wire [31:0] _DIVN;	//declare 32bits of wire _DIVN 

reg[31:0] count; //a 32 bits registor count
reg fout; //1 bit registor fout

assign _DIVN = {1'b0, DIVN[31:1]}; //_DivN equals to DivN devided by 2

always@(posedge fin) //posedge input
begin
	if (reset == 0)
		count <= 1;
	else \\
	count <= (count>=DIVN)?32'd1:count+1;
	//when count is larger or equal to DivN, set count to 1 in Decimal
	//otherwise count+1
	fout <= (count<=_DIVN)?1'b0:1'b1;
	//when count is lesser than _DivN, set fout to Binary 0; 
	//otherwise when it is larger or equal, set fout to binary 1.
end
endmodule
