`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2023 20:29:44
// Design Name: 
// Module Name: tb_8bitfmult
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

module tb_8bitfmult();
reg [7:0]a,b;
wire [15:0]c;
fpmult tb_8bitmult(a,b,c);
initial
begin
a = 8'b10101001;b = 8'b01101101;
#100 a = 8'b11100101; #100 b = 8'b01101101;
#100 a = 8'b11110101; #100 b = 8'b00101101;
#100 a = 8'b11101101; #100 b = 8'b11101101;

end
endmodule
