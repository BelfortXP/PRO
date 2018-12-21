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
    output beepo
    );
    reg [9:0] count;
    reg beep;
        always@(posedge (clk_512&open512))
        begin
            if(count < 1)
                beep <= 1; 
            else 
            begin
                beep <= 0;
                count <= 0;
            end        
        end    
 
        always@(posedge (clk_1k&open1k))
        begin
            if(count < 1001)
                beep <= 1; 
            else 
            begin 
                beep <= 0;
                count <= 0;
            end    
        end 
            
        always@(posedge (clk_512&open512))
            count = count + 1;
            
        always@(posedge (clk_1k&open1k))
            count = count + 1;    
    assign beepo = beep;    
endmodule
