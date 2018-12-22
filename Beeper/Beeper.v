`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/21 18:53:56
// Design Name: 
// Module Name: Beeper
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


module Beeper(
    input clk,
    input clk_512,
    input clk_1k,
    input open512,
    input open1k,
    output reg beep = 0
    );
    reg [19:0] count = 20'b0000_0000_0000_0000_0000;
    
    always@(posedge clk)
        count <= count + 1;
           
    always@(posedge clk)
    begin
        if(open512&&clk_512&&count<4000)
            beep <= 1;
        else if(open1k&&clk_1k&&count<=100_000_000)
            beep <= 1;
        else 
        begin
            beep <= 0;
            $finish;
        end            
    end
endmodule
