`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2023 19:46:44
// Design Name: 
// Module Name: jkff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module jkff(j,k,clk,q,qb);
input j,k,clk;
output q,qb;
reg q;

always @(posedge clk)

    case({j,k})
    2'b00: q <= q;
    2'b01: q <= 0;
    2'b10: q <= 1;
    2'b11: q <= ~q;
    endcase
 assign qb = ~q;
endmodule
