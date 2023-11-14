`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Institute: NIT Rourkela 
// Create Date: 02.02.2023 18:33:16
// Design Name: Priteesh Ranjan
// Module Name: Counter
// Project Name: Counter
//////////////////////////////////////////////////////////////////////////////////

module counter_1(input clk,rst, output[3:0] cntr);
reg [3:0] up_cntr, dw_cntr;
always @(posedge clk or posedge rst)
begin
if(rst)
    up_cntr <= 4'b0;
else 
up_cntr <= up_cntr + 4'b1; 
end
assign cntr = up_cntr;

endmodule
