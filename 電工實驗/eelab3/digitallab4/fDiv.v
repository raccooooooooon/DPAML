module fDiv(fin,DivN, reset,fout);
input fin, reset; 
output fout; 
input[31:0]DivN;//the output value of DivNSel will be sent to the 32-bit input DIVN
wire [31:0]_DivN;//define 32-bit wire _DIVN
reg[31:0] count; //define 32-bit register count
reg fout;//define a register fout


assign _DivN = {1'b0,DivN[31:1]}; //_DIVN = DIVN/2

always@(posedge fin) //triggered at the positive edge of fin
begin
	if(reset)
		count<=32'd1; //when reset is 1, 32'd1 will be assigned into count
	else
		count<=(count>=DivN)?32'd1:count+1; //if count>=DIVN, count=1 in decimal. if not, count=count+1
		fout<=(count<=_DivN)?1'b0:1'b1; //if count<=DIVN, fout=0 in binary. if not fout=1 in binary
end
endmodule