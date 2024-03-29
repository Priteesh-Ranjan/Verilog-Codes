`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Institute: NIT Rourkela 
// Create Date: 05.04.2023 23:30:23
// Design Name: Priteesh Ranjan
// Module Name: Dmultiplexer
// Project Name: dmuux
//////////////////////////////////////////////////////////////////////////////////


module dmux(y,a,d);
input [1:0]a;
input d;
output reg [3:0]y;

always @(y,a) 
begin
case(a)
    2'b00: begin y[0] = d; y[3:1] = 0; end
    2'b01: begin y[1] = d; y[0] = 0; end
    2'b10: begin y[2] = d; y[1:0] = 0; end
    2'b11: begin y[3] = d; y[2:0] = 0; end
    endcase
 end 
endmodule
