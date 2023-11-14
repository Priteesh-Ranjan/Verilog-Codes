`timescale 1ns / 1ps

module tb_cntr1();
reg clk,rst;
wire [3:0] cntr;
counter_1 tb_cntr1(clk,rst,cntr);
initial begin
clk = 0;
forever #60 clk = ~clk;
end
initial begin
rst = 1;
#60;
rst = 0;
end
endmodule
