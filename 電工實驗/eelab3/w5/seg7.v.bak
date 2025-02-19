module seg7(din,dout); 
input 	[3:0]	din; //4 bits of binary input din
output	[6:0]	dout; //7 bits of output (7-segments), represented in hexidecimal number)
reg		[6:0]	dout; //7 bits of registor

always@(din) //trigger when din changed 
begin
	case(din) 			//gfedcba, 0:light; 1:dark
	 	4'b0000:dout<=7'b1000000; //0
	 	4'b0001:dout<=7'b1111001; //1
	 	4'b0010:dout<=7'b0100100; //2
	 	4'b0011:dout<=7'b0110000; //3
	 	4'b0100:dout<=7'b0011001; //4
	 	4'b0101:dout<=7'b0010010; //5
	 	4'b0110:dout<=7'b0000010; //6
	 	4'b0111:dout<=7'b1111000; //7
		4'b1000:dout<=7'b0000000; //8
		
		/*complete the remaining part!! */
		4'b1001:dout<=7'b0010000; //9
		4'b1010:dout<=7'b0001000; // A
		4'b1011:dout<=7'b0000011; // b
		4'b1100:dout<=7'b1000110; // C
		4'b1101:dout<=7'b0100001; // d
		4'b1110:dout<=7'b0000110; // E
		4'b1111:dout<=7'b0001110; // F
	 	
	endcase
end
endmodule
