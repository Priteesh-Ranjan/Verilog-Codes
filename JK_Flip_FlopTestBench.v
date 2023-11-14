`timescale 1ns / 1ps

module testbench_jk();
reg j; reg k; reg clk;
wire q; wire qb;

jkff  testbench_jk(.j(j),.k(k),.clk(clk),.q(q),.qb(qb));

initial begin
    clk = 0;
    j <= 0;k<=0;
    #100; j<=0;k<=1;
    #100; j<=1;k<=0;
    #100; j<=1;k<=1;
end
initial 
forever #20 clk = ~clk;
endmodule
