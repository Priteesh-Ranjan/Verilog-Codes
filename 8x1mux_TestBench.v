`timescale 1ns / 1ps

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
