`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Institute: NIT Rourkela 
// Create Date: 05.02.2023 19:26:26
// Design Name: Priteesh Ranjan
// Module Name: fpmult
// Project Name: Fixed point 8 bit multiplier
//////////////////////////////////////////////////////////////////////////////////
module fpmult(a,b,c);
input [7:0]a,b;
output [15:0]c;
// Defining Each Multiplication Terms with m1,m2,m3... 

wire [7:0]m1;
wire [8:0]m2;
wire [9:0]m3;
wire [10:0]m4;
wire [11:0]m5;
wire [12:0]m6;
wire [13:0]m7;
wire [14:0]m8;

// Addition of middile Terms:
wire [15:0]s1,s2,s3,s4,s5,s6,s7;

// Assigning m1,m2,m3... to their respective multiplications
assign m1 = {8{a[0]}} & b[7:0];
assign m2 = {8{a[1]}} & b[7:0];
assign m3 = {8{a[2]}} & b[7:0];
assign m4 = {8{a[3]}} & b[7:0];
assign m5 = {8{a[4]}} & b[7:0];
assign m6 = {8{a[5]}} & b[7:0];
assign m7 = {8{a[6]}} & b[7:0];
assign m8 = {8{a[7]}} & b[7:0];

// Left shifting each operator
assign s1 = m1 + (m2<<1);
assign s2 = s1 + (m3<<2);
assign s3 = s2 + (m4<<3);
assign s4 = s3 + (m5<<4);
assign s5 = s4 + (m6<<5);
assign s6 = s5 + (m7<<6);
assign s7 = s6 + (m8<<7);
assign c=s7;
endmodule
