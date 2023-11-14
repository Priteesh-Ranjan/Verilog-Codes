`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2023 23:10:07
// Design Name: 
// Module Name: mux4x1
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


module mux4x1(a,b,c,d,s1,s2,y);
input a,b,c,d,s1,s2;
output y;
wire tmp1,tmp2,tmp3,tmp4,tmp5,tmp6;
assign tmp1 = ~s1;
assign tmp2 = ~s2;
assign tmp3 = tmp1&tmp2&a;
assign tmp4 = tmp1&s2&b;
assign tmp5 = s1&tmp2&c;
assign tmp6 = s1&s2&d;
assign y = tmp3|tmp4|tmp5|tmp6;
endmodule
