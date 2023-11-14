`timescale 1ns / 1ps

module tb_updwn();
reg clk;
reg mode;
reg rst;

wire [3:0]count;

up_dwn uut(.clk(clk),.rst(rst),.mode(mode),.count(count)
);
initial begin
// Initializing the Inputs
    clk = 0; mode = 0; rst = 1;
    #100
    rst = 0; mode = 1;
    #300
    rst = 0; mode = 0;    
    #200; $stop;
end
    always #10 clk = ~clk;
endmodule
