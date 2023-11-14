u`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2023 08:34:52
// Design Name: 
// Module Name: up_dwn
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


module up_dwn(clk,rst,mode,count);
input clk,rst,mode;
output reg [3:0]count;
always @(posedge clk or posedge rst)
begin 
    if(rst)
        begin
            count <= 4'b0000;
        end
    else
        begin
            if(mode)
                begin
                    count = count+1;
                end
            else
                 begin
                    count = count - 1;
                 end
    end
end
endmodule
