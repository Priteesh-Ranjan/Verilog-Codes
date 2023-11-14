u`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Institute: NIT Rourkela 
// Create Date: 09.02.2023 08:34:52
// Design Name: Priteesh Ranjan
// Module Name: UP Down Counter
// Project Name: up_down_counter
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
