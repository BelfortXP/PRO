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
    input clk_512,
    input clk_1k,
    input open512,
    input open1k,
    input rst,
    output reg beep512,beep1k
    );
            always@(posedge (clk_512&open512) or negedge rst)
            begin
                if(!rst) beep512 = 0;
                else  beep512 = 1; 
            end    
     
            always@(posedge (clk_1k&open1k) or negedge rst)
            begin
                if(!rst) beep1k = 0;
                else  beep1k = 1; 
            end 
endmodule
