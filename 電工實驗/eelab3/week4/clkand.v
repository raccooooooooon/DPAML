module clkand(ed, ch, m_clk);
//input
input ed, ch;
//output
output wire m_clk;

// a not gate and an and gate
assign m_clk = (~ed)&ch;

endmodule