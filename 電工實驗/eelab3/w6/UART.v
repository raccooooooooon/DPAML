module UART(reset, clk, start_btn,
				TData, tx, rx, RData, ready);
				
input [7:0] TData;
input reset, clk, start_btn;
output [7:0] RData;
output tx,rx,ready;
wire start;

one_shot U2(start_btn , clk , start);

TX_unit U0(reset, clk, start, TData, tx);

RxUnit U1(reset, clk, rx, RData, ready);

endmodule